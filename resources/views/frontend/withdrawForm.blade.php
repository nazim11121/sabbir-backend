<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>BD FUNDED TRADER</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    /* ===== Base Styles ===== */
    body {
      font-family: system-ui, -apple-system, sans-serif;
      background: #f9fafb;
    }
    .navbar-brand img { height: 70px;width: 165px; }
    .navbar-footer img { height: 70px;width: 140px; }
    .banner img { width: 100%; border-radius: .5rem; }

    .card-custom {
      border-radius: 1rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }

    /* ===== Footer ===== */
    .footer {
      background: #f1f5f9;
      padding: 2rem 0;
    }
    .footer h6 { font-weight: 600; margin-bottom: .5rem; }

    /* ===== App Buttons ===== */
    .app-btn {
      border: 1px solid #d1d5db;
      padding: .75rem 1rem;
      border-radius: .5rem;
      background: #fff;
      text-align: center;
      transition: background .2s;
    }
    .app-btn:hover { background: #f3f4f6; }

    /* ===== Floating Buttons ===== */
    .floating-buttons {
      position: fixed;
      right: 20px;
      bottom: 80px;
      display: flex;
      flex-direction: column;
      gap: 10px;
      z-index: 1050;
    }
    .btn-floating {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 22px;
      color: #fff;
      box-shadow: 0 4px 8px rgba(0,0,0,.2);
      transition: transform 0.2s;
    }
    .btn-floating:hover {
      transform: scale(1.1);
      color: #fff;
    }

    #chat-buttons {
      display: none;
      flex-direction: column;
      gap: 10px;
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
<!-- ===== Navbar (Responsive) ===== -->
<nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
  <div class="container d-flex justify-content-between align-items-center flex-wrap flex-lg-nowrap">
    @php
      $data = session('referrer');
      $user = $data ? App\Models\User::find($data->id) : null;
    @endphp

    <!-- Brand Logo -->
    <a class="navbar-brand" href="#">
      <img src="{{ asset('images/logo/logo.jpg') }}" alt="Shop" height="40">
    </a>

    <!-- Auth Buttons -->
    <div class="d-flex align-items-center gap-2 flex-shrink-0">
      <!-- Contact Us (Desktop only) -->
      <a href="#contactUs" class="btn btn-sm d-none d-lg-inline">Contact Us</a>

      @if($user)
        <!-- Deposit Button -->
        <a href="#" class="btn btn-info d-flex align-items-center">
          <i class="bi bi-wallet2 me-1"></i><span>{{ intval($user->total_deposit_amount ?? 0) }} $</span>
        </a>
        <div class="dropdown">
          <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User" width="40" class="rounded-circle">
          </a>
          <ul class="dropdown-menu dropdown-menu-end shadow-sm">
            <li><a class="dropdown-item" href="{{ route('frontend-dashboard') }}"><i class="bi bi-person-circle me-2"></i> Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="{{ route('deposit') }}"><i class="bi bi-coin me-2"></i> Deposit</a></li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <form action="{{ route('logout.user') }}" method="POST">
                @csrf
                <button type="submit" class="dropdown-item text-danger">
                  <i class="bi bi-box-arrow-right me-2"></i> Logout
                </button>
              </form>
            </li>
          </ul>
        </div>
      @else
        <!-- Login (Always show) -->
        <a href="{{ route('frontend.login') }}" class="btn btn-primary btn-sm">Login</a>
      @endif
    </div>
  </div>
</nav>

<!-- ===== Mobile Navbar (Bottom Fixed) ===== -->
<nav class="navbar fixed-bottom bg-white border-top d-lg-none">
  <div class="container d-flex justify-content-around text-center">

    <a href="#" class="text-decoration-none text-dark">
      <i class="bi bi-house-door fs-5"></i><br>
      <small>Home</small>
    </a>
    @if($user)
      <a href="{{route('deposit')}}" class="text-decoration-none text-dark">
        <i class="bi bi-coin fs-5"></i><br>
        <small>Deposit</small>
      </a>

      <a href="{{route('withdraw')}}" class="text-decoration-none text-dark">
        <i class="bi bi-cash fs-5"></i><br>
        <small>Withdraw</small>
      </a>
    @else
      <a href="https://www.youtube.com/@Rs_Sabbir_Trader" class="text-decoration-none text-dark">
        <i class="bi bi-youtube fs-5"></i><br>
        <small>Tutorial</small>
      </a>

      <a href="#funded" class="text-decoration-none text-dark">
        <i class="bi bi-cash-stack fs-5"></i><br>
        <small>Funded</small>
      </a>
    @endif

    <a href="#contactUs" class="text-decoration-none text-dark">
      <i class="bi bi-map fs-5"></i><br>
      <small>Contact</small>
    </a>

  </div>
</nav>

<!-- Offcanvas Drawer -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="mainMenu">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title">Menu</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
  <div class="offcanvas-body">
    <ul class="navbar-nav">
      <!-- <li class="nav-item">
        <a href="#" class="nav-link">Topup</a>
      </li> -->
      <li class="nav-item">
        <a href="#" class="nav-link">Contact Us</a>
      </li>
    </ul>
  </div>
</div>

<!-- ===== Login Form ===== -->
<div class="container my-4">

  <!-- Add Money -->
  <!-- Binance Submit Card -->
  <div class="container my-4">
    <div class="card card-custom p-4 text-center shadow-sm">
      <div class="mb-3">
        <img src="{{asset('images/binance-logo.png')}}" alt="Binance" width="60">
        <div class="text-success mt-2">
          <i class="bi bi-check-circle-fill fs-4"></i>
          <p class="fw-semibold mb-0">Verified Binance Withdrawal</p>
        </div>
      </div>

      <form id="binanceWithdrawForm">
        @csrf
        <div class="mb-3 text-start">
          <label for="amount" class="form-label fw-bold">Amount (USD)</label>
          <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter amount" required min="10">
          <div class="form-text">Minimum Amount must be 10$.</div>
        </div>

        <div class="mb-3 text-start">
          <label for="binance_id" class="form-label fw-bold">Binance ID</label>
          <input type="number" class="form-control" id="binance_id" name="binance_id" placeholder="Your Binance ID" required>
        </div>

        <button type="submit" class="btn btn-warning w-100 fw-bold">
          <i class="bi bi-send-check me-1"></i> Submit Withdrawal
        </button>
      </form>
    </div>
  </div>


  <!-- How to add money -->
  <div class="card card-custom p-4">
    <h5 class="fw-bold mb-3">How to withdraw money</h5>
    <div class="ratio ratio-16x9">
      <iframe src="https://www.youtube.com/embed/YOUR_VIDEO_ID"
              title="How to add money tutorial" allowfullscreen></iframe>
    </div>
  </div>

</div>

  <!-- ===== Footer ===== -->
  <footer class="footer">
    <div class="container">
      <div class="row g-4">
        <div class="col-md-6">
          <h6>
            <a class="navbar-footer mx-auto mx-lg-0 text-decoration-none text-dark" href="#">
              <img src="{{asset('images/logo/logo.jpg')}}" alt="Shop"> <!-- <h4><strong>BD Funded Trader</strong></h4> -->
            </a>
          </h6>
          <p class="small mb-1"></p>
          <p class="small mb-1"></p>
          <p class="small text-muted">
            ফান্ডিং অ্যাকাউন্ট সম্পর্কে আরও বিস্তারিত জানতে চাইলে আমাদের Telegram এ নক দিন। তবে মনে রাখবেন আবেদনকারীর বয়স অবশ্যই ন্যূনতম 16+ হতে হবে।
            আপনার ট্রেডিং একিউরেসি অন্তত 60%–70% হতে হবে।
            বাংলাদেশে ১০০% ট্রাস্টেড প্ল্যাটফর্ম – লোন, ফান্ডিং, ইনভেস্টমেন্ট ও টুর্নামেন্টের সব সুবিধা একসাথে।
          </p>
        </div>
        <!-- ===== Social Media Cards (Mobile Only) ===== -->
        <div class="container d-block d-md-none my-3">
          <div class="row g-2 text-center">
            <!-- Facebook -->
            <div class="col-6">
              <div class="card shadow-sm p-2">
                <a href="https://facebook.com" target="_blank" class="text-decoration-none text-dark">
                  <i class="bi bi-facebook fs-4 d-block"></i>
                  Facebook
                </a>
              </div>
            </div>
            <!-- YouTube -->
            <div class="col-6">
              <div class="card shadow-sm p-2">
                <a href="https://youtube.com" target="_blank" class="text-decoration-none text-dark">
                  <i class="bi bi-youtube fs-4 d-block"></i>
                  YouTube
                </a>
              </div>
            </div>
            <!-- Telegram -->
            <div class="col-6">
              <div class="card shadow-sm p-2">
                <a href="https://t.me/" target="_blank" class="text-decoration-none text-dark">
                  <i class="bi bi-telegram fs-4 d-block"></i>
                  Telegram
                </a>
              </div>
            </div>
            <!-- WhatsApp -->
            <div class="col-6">
              <div class="card shadow-sm p-2">
                <a href="https://wa.me/" target="_blank" class="text-decoration-none text-dark">
                  <i class="bi bi-whatsapp fs-4 d-block"></i>
                  WhatsApp
                </a>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-6" id="contactUs">
          <h6>Contact Us</h6>
          <div class="p-3 mb-2 bg-white rounded shadow-sm d-flex align-items-center">
            <i class="bi bi-telegram text-primary fs-4 me-3"></i>
            <div>
              <strong>Telegram Helpline</strong><br>
              <span class="small text-muted">সকাল ৯টা থেকে রাত ১১টা</span>
            </div>
          </div>
          <!-- <div class="p-3 mb-2 bg-white rounded shadow-sm d-flex align-items-center">
            <i class="bi bi-facebook text-primary fs-4 me-3"></i>
            <div>
              <strong>Facebook Helpline</strong><br>
              <span class="small text-muted">সকাল ৯টা থেকে রাত ১১টা</span>
            </div>
          </div> -->
          <div class="p-3 bg-white rounded shadow-sm d-flex align-items-center">
            <i class="bi bi-whatsapp text-success fs-4 me-3"></i>
            <div>
              <strong>Whatsapp Helpline</strong><br>
              <span class="small text-muted">সকাল ৯টা থেকে রাত ১১টা</span>
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div class="text-center small">© 2025 All rights reserved | Developed by N&N Co.</div>
    </div>
  </footer>

  <!-- ===== Floating Buttons ===== -->
  <div class="floating-buttons">
    <div id="chat-buttons">
      <!-- <a href="https://wa.me/8801XXXXXXXXX" class="btn-floating bg-success">
        <i class="bi bi-whatsapp"></i>
      </a> -->
      <a href="https://t.me/YourTelegramID" class="btn-floating bg-primary">
        <i class="bi bi-telegram"></i>
      </a>
    </div>
    <a href="#" class="btn-floating bg-danger" onclick="toggleChatButtons()" id="toggle-button">
      <i class="bi bi-telephone" id="toggle-icon"></i>
    </a>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Floating Button Toggle Script -->
  <script>
    let chatVisible = false;

    function toggleChatButtons() {
      const chatButtons = document.getElementById('chat-buttons');
      const toggleIcon = document.getElementById('toggle-icon');

      chatVisible = !chatVisible;
      chatButtons.style.display = chatVisible ? 'flex' : 'none';
      toggleIcon.className = chatVisible ? 'bi bi-x' : 'bi bi-plus';
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    document.getElementById('binanceWithdrawForm').addEventListener('submit', function (e) {
      e.preventDefault();

      const form = e.target;
      const formData = new FormData(form);

      fetch("{{ route('withdraw-form.store') }}", {
        method: "POST",
        headers: {
          "X-CSRF-TOKEN": "{{ csrf_token() }}"
        },
        body: formData
      })
      .then(response => {
        if (!response.ok) throw new Error("Failed to submit");
        return response.json();
      })
      .then(data => {
        Swal.fire({
          title: 'Success!',
          text: 'Withdrawal submitted successfully. We will process it within 24 hours.',
          icon: 'success',
          confirmButtonText: 'OK'
        }).then(() => {
          window.location.href = "{{ route('frontend-dashboard') }}";
        });
      })
      .catch(error => {
        Swal.fire('Error', 'Something went wrong.', 'error');
      });
    });
</script>

</body>
</html>
