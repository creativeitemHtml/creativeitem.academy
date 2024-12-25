<?php

namespace App\Models\payment_gateway;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Razorpay\Api\Api;

class Razorpay extends Model
{
    use HasFactory;

    public static function payment_status($identifier, $transaction_keys = [])
    {
        if ($transaction_keys != '') {
            array_shift($transaction_keys);
            session(['keys' => $transaction_keys]);
            return true;
        }
        return false;
    }
    public static function payment_create($identifier)
    {
        $payment_details = session('payment_details');
        $user            = DB::table('users')->where('id', auth()->user()->id)->first();
        $model           = $payment_details['success_method']['model_name'];
        $payment_gateway = DB::table('payment_gateways')
                ->where('identifier', $identifier)
                ->first();

        if ($model == 'InstructorPayment') {
            $settings = DB::table('users')->where('id', $payment_details['items'][0]['id'])
                ->value('paymentkeys');
            $keys = isset($settings) ? json_decode($settings) : null;

            $public_key = $secret_key = '';
            if ($keys) {
                $public_key = $keys->razorpay->public_key;
                $secret_key = $keys->razorpay->secret_key;
            }

        } else {
            
            $keys = json_decode($payment_gateway->keys, true);

            $public_key = $keys['public_key'];
            $secret_key = $keys['secret_key'];
            $color      = '';
        }

        $receipt_id = Str::random(20);
        $api        = new Api($public_key, $secret_key);

        $order = $api->order->create(array(
            'receipt'  => $receipt_id,
            'amount'   => $payment_details['payable_amount'] * 100,
            'currency' => $payment_gateway->currency,
        ));

        $page_data = [
            'order_id'    => $order['id'],
            'razorpay_id' => $public_key,
            'amount'      => $payment_details['payable_amount'] * 100,

            'name'        => $user->name,
            'currency'    => $payment_gateway->currency,
            'email'       => $user->email,
            'phone'       => $user->phone,
            'address'     => $user->address,
            'description' => isset($payment_details['custom_field']['description']) ? $payment_details['custom_field']['description'] : '',
        ];

        $data = [
            'page_data'       => $page_data,
            'color'           => null,
            'payment_details' => $payment_details,
        ];
        return $data;
    }
}
