<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>BD FUNDED TRADER</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Toastr -->
  <link rel="stylesheet" href="{{ asset('assets/vendor/toastr/css/toastr.min.css') }}">

  <style>
    body {
      font-family: system-ui, -apple-system, sans-serif;
      background: #f9fafb;
    }
    .navbar-brand img { height: 70px; width: 165px; }
    .navbar-footer img { height: 70px; width: 140px; }
    .banner img { width: 100%; border-radius: .5rem; }

    .money-btn { transition: all .3s ease; }
    .money-btn:hover { background-color: #0d6efd; color: #fff; }

    .card { border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    .profile-img { width: 100px; height: 100px; border-radius: 50%; object-fit: cover; }
    .card-custom { border-radius: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }

    .info-box {
      background: #fff;
      padding: 15px;
      border-radius: 12px;
      text-align: center;
      box-shadow: 0 2px 6px rgba(0,0,0,0.05);
    }
    .info-box h5 { margin: 0; font-weight: bold; }
    .info-box small { color: #555; }

    .footer { background: #f1f5f9; padding: 2rem 0; }
    .footer h6 { font-weight: 600; margin-bottom: .5rem; }

    .app-btn {
      border: 1px solid #d1d5db;
      padding: .75rem 1rem;
      border-radius: .5rem;
      background: #fff;
      text-align: center;
      transition: background .2s;
    }
    .app-btn:hover { background: #f3f4f6; }

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
      transition: transform .2s;
    }
    .btn-floating:hover { transform: scale(1.1); color: #fff; }

    #chat-buttons { display: none; flex-direction: column; gap: 10px; }
    @media (max-width: 576px) {
      .navbar-brand img {
        height: 44px;
        width: auto;
      }
      .product-card {
        width: 100px;
        font-size: 12px;
      }
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
@php
  $data = session('referrer');
  $users = $data ? App\Models\User::find($data->id) : null;
@endphp
<!-- ===== Navbar ===== -->
<nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
  <div class="container d-flex justify-content-between align-items-center">
    <a class="navbar-brand" href="{{ url('/') }}">
      <img src="{{ asset('images/logo/logo.jpg') }}" alt="Shop">
    </a>

    <div class="d-flex align-items-center gap-2">
      <a href="#contactUs" class="btn btn-sm d-none d-lg-inline">Contact Us</a>
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
    </div>
  </div>
</nav>

<!-- ===== Mobile Navbar ===== -->
<nav class="navbar fixed-bottom bg-white border-top d-lg-none">
  <div class="container d-flex justify-content-around text-center">
    <a href="#" class="text-decoration-none text-dark">
      <i class="bi bi-house-door fs-5"></i><br><small>Home</small>
    </a>
    @if($users)
      <a href="{{ route('deposit') }}" class="text-decoration-none text-dark">
        <i class="bi bi-coin fs-5"></i><br><small>Deposit</small>
      </a>
      <a href="{{ route('withdraw') }}" class="text-decoration-none text-dark">
        <i class="bi bi-cash fs-5"></i><br><small>Withdraw</small>
      </a>
    @else
      <a href="https://www.youtube.com/@Rs_Sabbir_Trader" class="text-decoration-none text-dark">
        <i class="bi bi-youtube fs-5"></i><br><small>Tutorial</small>
      </a>
      <a href="#funded" class="text-decoration-none text-dark">
        <i class="bi bi-cash-stack fs-5"></i><br><small>Funded</small>
      </a>
    @endif
    <a href="#contactUs" class="text-decoration-none text-dark">
      <i class="bi bi-map fs-5"></i><br><small>Contact</small>
    </a>
  </div>
</nav>
<!-- ===== Profile Header ===== -->
<div class="container text-center mt-5">
  <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Profile" class="profile-img mb-3">
  <h5 class="fw-bold">Hi, {{ $user->name }}</h5>
  <p class="text-muted">
    Available Balance: <span class="fw-bold">{{ $user->total_deposit_amount ?? 0 }} $</span> 
    <button class="btn btn-sm btn-light border ms-1"><i class="bi bi-arrow-clockwise"></i></button>
  </p>
</div>

<!-- ===== Info Cards ===== -->
<div class="container mt-4">
  <div class="row g-3">
    <div class="col-6 col-md-3"><div class="info-box"><h5>{{ $user->total_invest_amount ?? 0 }} $</h5><small>Invest Amount</small></div></div>
    <div class="col-6 col-md-3"><div class="info-box"><h5>{{ $user->total_deposit_amount ?? 0 }} $</h5><small>Deposit Amount</small></div></div>
    <div class="col-6 col-md-3"><div class="info-box"><h5>0</h5><small>Total Refer Register</small></div></div>
    <div class="col-6 col-md-3"><div class="info-box"><h5>0</h5><small>Total FTD</small></div></div>
  </div>
</div>

<!-- ===== Account Information ===== -->
<div class="container mt-5">
  <div class="card card-custom p-4">
    <h6 class="fw-bold mb-3"><i class="bi bi-wallet2 me-2"></i>Account Information</h6>
    <div class="row g-3 text-center">
      <div class="col-md-6"><div class="info-box"><h5>{{ $user->total_deposit_amount ?? 0.00 }} $</h5><small>Available Balance</small></div></div>
      <div class="col-md-6"><div class="info-box"><h5><i class="bi bi-patch-check-fill text-primary"></i></h5><small>{{ $user->level }}!</small></div></div>
    </div>
  </div>
</div>

<!-- ===== User Information ===== -->
<div class="container my-4">
  <div class="card card-custom p-4">
    <h6 class="fw-bold mb-3"><i class="bi bi-info-circle me-2"></i>User Information</h6>
    <p><strong>Email:</strong> {{ $user->email }}</p>
    <p><strong>Phone:</strong> {{ $user->phone_number }}</p>
    <p><strong>Own Refer Code:</strong> {{ $user->own_refer_code }}</p>
    <p><strong>Used Refer Code:</strong> {{ $user->refer_code }}</p>
  </div>
</div>

<!-- ===== Deposit History ===== -->
<div class="container my-4">
  <div class="card card-custom p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h6 class="fw-bold mb-0">
        <i class="bi bi-info-circle me-2"></i>Deposit History
      </h6>
      <button class="btn btn-sm btn-outline-secondary d-flex align-items-center" 
              type="button" 
              data-bs-toggle="collapse" 
              data-bs-target="#depositHistoryCollapse" 
              aria-expanded="false" 
              aria-controls="depositHistoryCollapse"
              onclick="toggleIcon(this)">
        <i class="bi bi-chevron-down" id="collapseIcon"></i>
      </button>
    </div>

    <div class="collapse" id="depositHistoryCollapse">
      @forelse($user->deposits->take(10) as $deposit)
        <div class="order-card">
          <div class="d-flex justify-content-between align-items-center text-nowrap">
            <span class="flex-shrink-0" style="width: 80px;">
              <strong>{{ $deposit->created_at->format('d-m-Y') }}</strong>
            </span>

            <span class="text-secondary text-truncate" style="width: 120px;">
              {{ $deposit->order_id }}
            </span>

            <span class="text-primary text-end flex-shrink-0" style="width: 90px;">
              + {{ $deposit->amount }} $
            </span>

            <span class="text-end flex-shrink-0" style="width: 90px; color: {{ $deposit->payment_status == 1 ? '#198754' : '#ffc107' }}">
              {{ $deposit->payment_status == 1 ? 'Success' : 'Pending' }}
            </span>
          </div>
        </div>
        <hr>
      @empty
        <p class="text-muted">No deposit yet.</p>
      @endforelse
    </div>
  </div>
</div>

<script>
  function toggleIcon(button) {
    const icon = button.querySelector('i');
    icon.classList.toggle('bi-chevron-down');
    icon.classList.toggle('bi-chevron-up');
  }
</script>
<!-- ===== Purchase Funded Package History ===== -->
<div class="container my-4">
  <div class="card card-custom p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h6 class="fw-bold mb-0">
        <i class="bi bi-box-seam me-2"></i>Purchased Funded Packages
      </h6>
      <button class="btn btn-sm btn-outline-secondary d-flex align-items-center"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#packageListCollapse"
              aria-expanded="false"
              aria-controls="packageListCollapse"
              onclick="toggleIcon(this)">
        <i class="bi bi-chevron-down" id="packageCollapseIcon"></i>
      </button>
    </div>

    <div class="collapse" id="packageListCollapse">
      @forelse($user->buyPackages as $index => $package)
        <div class="mb-3">
          <div class="d-flex justify-content-between">
            <strong>Package ID: {{ $package->package_id }}</strong>
            <small>{{ $package->created_at->format('d-m-Y') }}</small>
          </div>
          <div class="text-muted mb-2">
            Status: {{ $package->status == 1 ? 'Active' : 'Inactive' }}
          </div>

          <!-- Toggle Button for Rules -->
          <button class="btn btn-sm btn-outline-secondary d-flex align-items-center mb-2"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#rulesCollapse{{ $index }}"
                  aria-expanded="false"
                  aria-controls="rulesCollapse{{ $index }}"
                  onclick="toggleIcon(this)">
            <i class="bi bi-chevron-down me-1"></i> Show Rules
          </button>

          <!-- Collapsible Rules Section (Default Closed) -->
          <div class="collapse" id="rulesCollapse{{ $index }}">
            @php
              // Static rule definitions
              $staticRules = [
                'min_profit' => 'মিনিমাম প্রফিট: প্রতিদিন +10%',
                'max_loss' => 'ম্যাক্স লস: প্রতিদিন –10%',
                'trade_limit' => 'ট্রেড লিমিট: দিনে সর্বোচ্চ 10',
                'risk_management' => 'রিস্ক ম্যানেজমেন্ট: প্রতি ট্রেডে ব্যালেন্সের 2%',
                'rule_break' => 'রুল ভাঙলে: সাথে সাথে অ্যাকাউন্ট ক্যানসেল',
                'profit_share' => 'প্রফিট শেয়ার: 60% ট্রেডার, 40% কোম্পানি',
              ];

              // Completed rules for this package (from DB)
              $completedRules = $package->rules->pluck('rule_value', 'rule_key')->toArray();
            @endphp

            @foreach($staticRules as $key => $label)
              <div class="form-check">
                <input class="form-check-input" type="checkbox" disabled {{ ($completedRules[$key] ?? 0) ? 'checked' : '' }}>
                <label class="form-check-label">{{ $label }}</label>
              </div>
            @endforeach
          </div>
        </div>
        <hr>
      @empty
        <p class="text-muted">No packages purchased yet.</p>
      @endforelse
    </div>

  <script>
    function toggleIcon(button) {
      const icon = button.querySelector('i');
      icon.classList.toggle('bi-chevron-down');
      icon.classList.toggle('bi-chevron-up');
      button.classList.toggle('active');
    }
  </script>
  
  </div>
</div>

<script>
  function toggleIcon(button) {
    const icon = button.querySelector('i');
    icon.classList.toggle('bi-chevron-down');
    icon.classList.toggle('bi-chevron-up');
  }
</script>

<!-- ===== Invest History ===== -->
<div class="container my-4">
  <div class="card card-custom p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h6 class="fw-bold mb-0">
        <i class="bi bi-cash-coin me-2"></i>Investment History
      </h6>
      <button class="btn btn-sm btn-outline-secondary d-flex align-items-center"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#investmentListCollapse"
              aria-expanded="false"
              aria-controls="investmentListCollapse"
              onclick="toggleIcon(this)">
        <i class="bi bi-chevron-down"></i>
      </button>
    </div>

    <div class="collapse" id="investmentListCollapse">
      @forelse($user->invests as $index => $investment)
        <div class="order-card">
          <div class="d-flex justify-content-between align-items-center text-nowrap">
            <!-- Date -->
            <span class="flex-shrink-0" style="width: 80px;">
              <strong>{{ $investment->created_at->format('d-m-Y') }}</strong>
            </span>

            <!-- Order ID -->
            <span class="text-secondary text-truncate" style="width: 120px;">
              {{ $investment->order_id }}
            </span>

            <!-- Amount -->
            <span class="text-primary text-end flex-shrink-0" style="width: 90px;">
              + {{ $investment->amount }} $
            </span>

            <!-- Status -->
            <span class="text-end flex-shrink-0" style="width: 90px; color: {{ $investment->payment_status == 1 ? '#198754' : '#ffc107' }}">
              {{ $investment->payment_status == 1 ? 'Success' : 'Pending' }}
            </span>

            <!-- Optional Toggle Button (commented out) -->
            <!--
            <button class="btn btn-sm btn-light p-1 ms-2" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#investmentRules{{ $index }}"
                    aria-expanded="false"
                    aria-controls="investmentRules{{ $index }}"
                    onclick="toggleIcon(this)">
              <i class="bi bi-chevron-down"></i>
            </button>
            -->
          </div>

          <!-- Optional Rules Section (commented out) -->
          <!--
          <div class="collapse mt-2" id="investmentRules{{ $index }}">
           //@php//
              $staticRules = [
                'min_profit' => 'মিনিমাম প্রফিট: প্রতিদিন +10%',
                'max_loss' => 'ম্যাক্স লস: প্রতিদিন –10%',
                'trade_limit' => 'ট্রেড লিমিট: দিনে সর্বোচ্চ 10',
                'risk_management' => 'রিস্ক ম্যানেজমেন্ট: প্রতি ট্রেডে ব্যালেন্সের 2%',
                'rule_break' => 'রুল ভাঙলে: সাথে সাথে অ্যাকাউন্ট ক্যানসেল',
                'profit_share' => 'প্রফিট শেয়ার: 60% ট্রেডার, 40% কোম্পানি',
              ];
              $completedRules = $investment->rules->pluck('rule_value', 'rule_key')->toArray();
           // @endphp

            @foreach($staticRules as $key => $label)
              <div class="form-check ms-3">
                <input class="form-check-input" type="checkbox" disabled {{ ($completedRules[$key] ?? 0) ? 'checked' : '' }}>
                <label class="form-check-label">{{ $label }}</label>
              </div>
            @endforeach
          </div>
          -->
        </div>
        <hr>
      @empty
        <p class="text-muted">No investments yet.</p>
      @endforelse
    </div>

  </div>
</div>

<script>
  function toggleIcon(button) {
    const icon = button.querySelector('i');
    icon.classList.toggle('bi-chevron-down');
    icon.classList.toggle('bi-chevron-up');
  }
</script>
<!-- ===== Withdraw History ===== -->
<div class="container my-4">
  <div class="card card-custom p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h6 class="fw-bold mb-0">
        <i class="bi bi-cash me-2"></i>Withdraw History
      </h6>
      <button class="btn btn-sm btn-outline-secondary d-flex align-items-center"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#withdrawListCollapse"
              aria-expanded="false"
              aria-controls="withdrawListCollapse"
              onclick="toggleIcon(this)">
        <i class="bi bi-chevron-down"></i>
      </button>
    </div>

    <div class="collapse" id="withdrawListCollapse">
      @forelse($user->withdraws as $index => $withdraw)
        <div class="order-card">
          <div class="d-flex justify-content-between align-items-center text-nowrap">
            <span class="flex-shrink-0" style="width: 80px;">
              <strong>{{ $withdraw->created_at->format('d-m-Y') }}</strong>
            </span>

            <span class="text-secondary text-truncate" style="width: 120px;">
              {{ $withdraw->binance_id }}
            </span>

            <span class="text-danger text-end flex-shrink-0" style="width: 90px;">
              - {{ $withdraw->amount }} $
            </span>

            <span class="text-end flex-shrink-0" style="width: 90px; color: {{ $withdraw->payment_status == 1 ? '#198754' : '#ffc107' }}">
              {{ $withdraw->payment_status == 1 ? 'Success' : 'Pending' }}
            </span>
          </div>
        </div>
        <hr>
      @empty
        <p class="text-muted">No withdraw yet.</p>
      @endforelse
    </div>
  </div>
</div>

<!-- ===== Footer ===== -->
<footer class="footer">
  <div class="container">
    <div class="row g-4">
      <div class="col-md-6">
        <a class="navbar-footer mx-auto mx-lg-0 text-decoration-none text-dark" href="#">
          <img src="{{ asset('images/logo/logo.jpg') }}" alt="Shop">
        </a>
        <p class="small text-muted mt-3">
          ফান্ডিং অ্যাকাউন্ট সম্পর্কে আরও বিস্তারিত জানতে চাইলে আমাদের Telegram এ নক দিন। তবে মনে রাখবেন আবেদনকারীর বয়স অবশ্যই ন্যূনতম 16+ হতে হবে। আপনার ট্রেডিং একিউরেসি অন্তত 60%–70% হতে হবে। বাংলাদেশে ১০০% ট্রাস্টেড প্ল্যাটফর্ম – লোন, ফান্ডিং, ইনভেস্টমেন্ট ও টুর্নামেন্টের সব সুবিধা একসাথে।
        </p>
      </div>

      <!-- Social Media (Mobile Only) -->
      <div class="container d-block d-md-none my-3">
        <div class="row g-2 text-center">
          <div class="col-6"><div class="card shadow-sm p-2"><a href="https://facebook.com" target="_blank" class="text-decoration-none text-dark"><i class="bi bi-facebook fs-4 d-block"></i>Facebook</a></div></div>
          <div class="col-6"><div class="card shadow-sm p-2"><a href="https://youtube.com" target="_blank" class="text-decoration-none text-dark"><i class="bi bi-youtube fs-4 d-block"></i>YouTube</a></div></div>
          <div class="col-6"><div class="card shadow-sm p-2"><a href="https://t.me/" target="_blank" class="text-decoration-none text-dark"><i class="bi bi-telegram fs-4 d-block"></i>Telegram</a></div></div>
          <div class="col-6"><div class="card shadow-sm p-2"><a href="https://wa.me/" target="_blank" class="text-decoration-none text-dark"><i class="bi bi-whatsapp fs-4 d-block"></i>WhatsApp</a></div></div>
        </div>
      </div>

      <div class="col-md-6" id="contactUs">
        <h6>Contact Us</h6>
        <div class="p-3 mb-2 bg-white rounded shadow-sm d-flex align-items-center">
          <i class="bi bi-telegram text-primary fs-4 me-3"></i>
          <div><strong>Telegram Helpline</strong><br><span class="small text-muted">সকাল ৯টা থেকে রাত ১১টা</span></div>
        </div>
        <div class="p-3 bg-white rounded shadow-sm d-flex align-items-center">
          <i class="bi bi-whatsapp text-success fs-4 me-3"></i>
          <div><strong>Whatsapp Helpline</strong><br><span class="small text-muted">সকাল ৯টা থেকে রাত ১১টা</span></div>
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
    <a href="https://t.me/YourTelegramID" class="btn-floating bg-primary"><i class="bi bi-telegram"></i></a>
  </div>
  <a href="#" class="btn-floating bg-danger" onclick="toggleChatButtons()" id="toggle-button">
    <i class="bi bi-telephone" id="toggle-icon"></i>
  </a>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('assets/vendor/toastr/js/toastr.min.js') }}"></script>
<script>
  toastr.options = {
    closeButton: true,
    progressBar: true,
    positionClass: "toast-top-center",
    timeOut: "4000"
  };
  @if (session('success')) toastr.success("{{ session('success') }}");
  @elseif (session('error')) toastr.error("{{ session('error') }}");
  @elseif (session('info')) toastr.info("{{ session('info') }}");
  @elseif (session('warning')) toastr.warning("{{ session('warning') }}");
  @elseif (session('danger')) toastr.error("{{ session('danger') }}");
  @endif

  function toggleChatButtons() {
    const chatButtons = document.getElementById('chat-buttons');
    const toggleIcon = document.getElementById('toggle-icon');
    const visible = chatButtons.style.display === 'flex';
    chatButtons.style.display = visible ? 'none' : 'flex';
    toggleIcon.className = visible ? 'bi bi-telephone' : 'bi bi-x';
  }
</script>
</body>
</html>
