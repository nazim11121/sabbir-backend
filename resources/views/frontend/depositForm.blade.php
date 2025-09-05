<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
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
    .navbar-brand img { height: 76px;width: 175px; }
    .navbar-footer img { height: 70px;width: 140px; }
    .banner img { width: 100%; border-radius: .5rem; }

    @media (max-width: 576px) {
      .navbar-brand img {
        height: 42px;
        width: auto;
      }
      .money-bag-icon {
        padding: 7px;
        font-weight: 500;
        font-size: 11px;
      }
      .notification-icon {
        margin-left: -25px;
      }
    }
    .navbar .d-flex {
      flex-wrap: nowrap !important;
    }

    .card-custom {
      border-radius: 1rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }

    /* ===== Footer ===== */
    .footer {
      background: #081149;
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
    <a class="navbar-brand d-flex align-items-center" href="/">
      <img src="{{ asset('images/logo/logo.jpg') }}" alt="logo" class="me-2">
    </a>
    <!-- Auth Buttons -->
    <div class="d-flex align-items-center gap-2 flex-shrink-0">
      <!-- Contact Us (Desktop only) -->
      <a href="#contactUs" class="btn btn-sm d-none d-lg-inline">Contact Us</a>

      @if($user)
    <!-- Auth Buttons -->
    <!-- <div class="d-flex align-items-center flex-nowrap gap-2"> -->
    
      <!-- Notification Bell -->
      <div class="position-relative notification-icon">
        <a role="button" class="text-dark fs-5" data-bs-toggle="modal" data-bs-target="#notificationModal">
          <i class="bi bi-bell"></i>
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="padding: 6px;font-size: 10px;">
            {{ count($user->unread_notifications) ?? 0 }}
          </span>
        </a>
      </div>

      

      <!-- Deposit Button -->
      <a href="#" class="btn btn-info btn-sm d-flex align-items-center money-bag-icon" style="margin-left: 5px;">
        <i class="bi bi-wallet2 me-1"></i><span>{{ intval($user->total_deposit_amount ?? 0) }} $</span>
      </a>

      <!-- Profile Image -->
      <div class="dropdown">
        <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="{{ asset('/') }}{{ $user->profile_photo ?? 'images/default.png' }}" 
              alt="User" width="40" height="40" class="rounded-circle">
        </a>
        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
          <li><a class="dropdown-item" href="{{ route('frontend-dashboard') }}"><i class="bi bi-person-circle me-2"></i> Profile</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="{{ route('deposit') }}"><i class="bi bi-coin me-2"></i> Deposit</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="{{ route('withdraw') }}"><i class="bi bi-cash me-2"></i> Withdraw</a></li>
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
<!-- Notification Modal -->
<div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="notificationModalLabel">Notifications</h5>
              <!-- ✅ Proper dismiss button -->
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              @if(count($user->unread_notifications) > 0)
                <ul class="list-group">
                  @foreach($user->unread_notifications as $notify)
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                      <span>{{ $notify->commission_type ?? 'N/A' }}</span>
                      <span class="fw-bold text-success">+ {{ $notify->amount ?? 0 }} $</span>
                    </li>
                  @endforeach
                </ul>
              @else
                <p class="text-muted text-center">No new notifications</p>
              @endif
            </div>
          </div>
        </div>
</div>

<!-- ===== Mobile Navbar (Bottom Fixed) ===== -->
<nav class="navbar fixed-bottom bg-white border-top d-lg-none">
  <div class="container d-flex justify-content-around text-center">

    <a href="/" class="text-decoration-none text-dark">
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
  <div class="card card-custom p-4 mb-4">
    <h5 class="fw-bold mb-3">Deposit Money</h5>
    <form method="POST" action="{{route('deposit-form.store')}}" enctype="multipart/form-data">
      @csrf
      <div class="mb-3">
        <input type="hidden" name="user_id" value="{{$user->id}}">
        <label for="amount" class="form-label">Enter the amount</label>
        <input type="number" name="amount" id="amount" class="form-control"
               placeholder="Enter amount"
               min="10" max="10000000" required>
        <div class="form-text">Minimum Amount must be 10$.</div>
      </div>
      <button type="submit" class="btn btn-primary w-100 fw-bold">Click Here To Deposit Money</button>
    </form>
  </div>

  <!-- How to add money -->
  <div class="card card-custom p-4">
    <h5 class="fw-bold mb-3">How to deposit money</h5>
    <div class="ratio ratio-16x9">
      <iframe src="https://www.youtube.com/embed/YOUR_VIDEO_ID"
              title="How to add money tutorial" allowfullscreen></iframe>
    </div>
  </div>

</div>

  <!-- ===== Footer ===== -->
  <footer class="text-white pt-4 pb-3 footer" id="contactUs">
    <div class="container">
      <div class="row text-start text-md-start align-items-center">

        <!-- Stay Connected -->
        <div class="col-md-4 mb-4 mb-md-0">
          <h5 class="fw-bold">BD FUNDED TRADER</h5>
          <p class="small" style="font-size: 11px;color: rgb(173, 173, 173);font-weight: 500;">
            কোন সমস্যায় পড়লে টেলিগ্রামে যোগাযোগ করবেন।<br>
            তাহলেই দ্রুত সমাধান পেয়ে যাবেন।
          </p>
          <div class="d-flex justify-content-start justify-content-md-start gap-3">
            <a href="https://www.youtube.com/@Rs_Sabbir_Trader" class="btn btn-outline-light rounded-3"><i class="bi bi-youtube"></i></a>            
            <a href="https://t.me/bd_funded_support" class="btn btn-outline-light rounded-3"><i class="bi bi-telegram"></i></a>
            <a href="https://www.tiktok.com/@rs_sabbir_trader99" class="btn btn-outline-light rounded-3"><i class="bi bi-tiktok"></i></a>
            <a href="https://t.me/bd_funded_support" class="btn btn-outline-light rounded-3"><i class="bi bi-facebook"></i></a>
          </div>
        </div>
        <div class="col-md-4 text-start text-md-start"></div>
        <!-- Support Center -->
        <div class="col-md-4 text-start text-md-start">
          <h5 class="fw-bold mb-3">SUPPORT CENTER</h5>
          <div class="border rounded d-flex align-items-start p-2 mb-3">
            <a href="https://t.me/bd_funded_support"><i class="bi bi-telegram fs-1 text-info me-2"></i></a>
            <div>
              <strong style="font-size: 13px;font-weight: 500;">Help line [9AM-12PM]</strong><br>
              <small style="font-size: 13px;color: rgb(173, 173, 173);font-weight: 500;">টেলিগ্রামে সাপোর্ট</small>
            </div>
          </div>
        </div>
      </div>
      <!-- Copyright -->
      <div class="text-center mt-4 border-top pt-3 small">
        © 2025 | All Rights Reserved | Developed by <strong>N&N Co.</strong>
      </div>
    </div>
  </footer>
  <!-- ===== Floating Buttons ===== -->
  <div class="floating-buttons">
    <div id="chat-buttons">
      <a href="https://t.me/bd_funded_support" class="btn-floating bg-primary">
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
</body>
</html>
