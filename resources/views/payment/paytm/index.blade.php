<form action="{{ route('make.order', $payment_gateway->identifier) }}" method="post" enctype="multipart/form-data">
    @csrf

    <input type="hidden" name="amount" value="{{ $payment_details['items'][0]['price'] }}" required>
    <input type="hidden" name="user" value="{{ auth()->user()->id }}" required>
    <input type="submit" value="Pay by Paytm" class="btn btn-primary">
</form>
