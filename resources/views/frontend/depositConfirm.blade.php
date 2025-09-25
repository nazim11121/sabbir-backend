<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BD FUNDED TRADER</title>
  <link rel="icon" href="{{asset('images/favicon.png')}}" type="image/x-icon">
  <!-- Open Graph (used by Facebook, WhatsApp, LinkedIn, etc.) -->
  <meta property="og:title" content="BD Funded Trader" />
  <meta property="og:description" content="Get funded to trade with BD Funded Trader. No risk, all reward." />
  <meta property="og:image" content="https://bdfundedtrader.com/images/logo/logo.jpg" />
  <meta property="og:url" content="https://bdfundedtrader.com" />
  <meta property="og:type" content="website" />
  <!-- Twitter Card (used by X/Twitter) -->
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="BD Funded Trader" />
  <meta name="twitter:description" content="Get funded to trade with BD Funded Trader. No risk, all reward." />
  <meta name="twitter:image" content="https://bdfundedtrader.com/images/logo/logo.jpg" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f5f9ff;
      font-family: Arial, sans-serif;
    }
    .payment-card {
      background: #fff;
      border-radius: 1rem;
      padding: 2rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      max-width: 600px;
      margin: auto;
    }
    .merchant-logo img {
      width: 60px;
      height: 60px;
      border-radius: 12px;
      object-fit: cover;
    }
    .merchant-name {
      font-size: 1.2rem;
      font-weight: bold;
    }
    .provider-card {
      border: 1px solid #eee;
      border-radius: 12px;
      padding: 10px;
      background: #fafafa;
    }
    .provider-logo {
      max-width: 200px;
      border-radius: 8px;
    }
    .pay-btn {
      background: #0d6efd;
      color: #fff;
      border: none;
      border-radius: 12px;
      padding: 14px;
      font-size: 1rem;
      font-weight: bold;
      width: 100%;
      transition: 0.2s;
    }
    .pay-btn:hover {
      background: #084298;
    }
  </style>
   <link rel="manifest" href="/manifest.json">
    <meta name="theme-color" content="#0d6efd">

    <script>
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/serviceworker.js')
                .then(function () {
                    console.log('Service Worker Registered');
                });
        }
    </script>
</head>
<body>

<div class="container my-5">
  <div class="payment-card">

    <!-- Merchant Info -->
    <div class="d-flex align-items-center mb-4">
      <div class="merchant-logo me-3">
        <img src="{{asset('images/logo/app.jpg')}}" alt="Merchant Logo">
      </div>
      <div>
        <div class="merchant-name">BD FUNDED TRADER</div>
        <small class="text-muted">Secure Payment</small>
      </div>
    </div>

    <!-- Binance ID -->
    <!-- <div class="text-center fw-bold mt-4 mb-3 text-white bg-primary rounded p-2">
      Binance ID : <span id="binanceText">👉892208461</span>
      Address : <span id="binanceText">TAPRhxNnfCZYSW9rkzGoE26kV5Q2qa3PQk</span>
    </div> -->

    <!-- Payment Form -->
    <form action="{{ route('deposit-confirm.store') }}" method="POST" enctype="multipart/form-data">
      @csrf

      <!-- Hidden Inputs -->
      <input type="hidden" name="user_id" id="user_id" value="{{$data->user_id}}">
      <input type="hidden" name="binance_id" id="binance_id" value="TAPRhxNnfCZYSW9rkzGoE26kV5Q2qa3PQk">
      <input type="hidden" name="amount" id="amount" value="{{$data->amount}}">

      <!-- QR / Provider -->
      <div class="row g-3 text-center">
        <div class="col-12">
          <div class="provider-card">
            <img src="{{asset('images/qr.png')}}" class="provider-logo" alt="QR Code">
          </div>
        </div>
      </div>

      <!-- Order ID Field -->
      <div class="mt-4">
        <label for="order_id" class="form-label fw-semibold">Transaction ID(Txid)<span class="requiredStar text-danger">*</span></label>
        <input type="text" class="form-control" id="order_id" name="order_id" 
               placeholder="Enter your Txid ID">
        <span class="text-success" style="font-size:11px">Ex: Off-chain transfer 298564119363 or 298564119363</span>
      </div>

      <!-- Upload Proof -->
      <!-- <div class="mt-4">
        <label for="payment_proof" class="form-label fw-semibold">Upload Payment Proof</label>
        <input class="form-control" type="file" id="deposit_proof" name="deposit_proof" accept="image/*" onchange="previewImage(event)" required>
        <div class="mt-3 text-center">
          <img id="imagePreview" src="" alt="Preview" class="img-fluid rounded shadow-sm d-none" style="max-height: 200px;">
        </div>
      </div> -->

      <!-- Pay Button -->
      <button type="submit" class="pay-btn mt-4">Pay <span id="amountText">{{$data->amount}}.00</span> $</button>
    </form>
  </div>
</div>

<script>
  // Show preview of uploaded image
  function previewImage(event) {
    const reader = new FileReader();
    reader.onload = function(){
      const output = document.getElementById('imagePreview');
      output.src = reader.result;
      output.classList.remove('d-none');
    };
    reader.readAsDataURL(event.target.files[0]);
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
