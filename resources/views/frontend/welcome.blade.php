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
  <style>
    /* ===== Base Styles ===== */
    body {
      font-family: system-ui, -apple-system, sans-serif;
      background: #f9fafb;
      font-weight: 600;
    }
    .navbar-brand img { height: 76px;width: 175px; }
    .navbar-footer img { height: 70px;width: 140px; }
    .banner img { width: 100%; border-radius: .5rem; }
    @media (max-width: 576px) {
      .navbar-brand img {
        height: 42px;
        width: auto;
      }
      .product-card {
        width: 100px;
        font-size: 12px;
      }
    }
    /* ===== Section Titles ===== */
    .section-title {
      font-weight: 600;
      text-align: center;
      margin: 2rem 0 1rem;
    }

    /* ===== Product Card ===== */
    .product-card {
      border: 1px solid #e5e7eb;
      border-radius: .5rem;
      background: #fff;
      text-align: center;
      transition: all .2s;
    }
    .product-card:hover {
      box-shadow: 0 6px 18px rgba(0,0,0,.1);
      transform: translateY(-3px);
    }
    .product-card img {
      width: 100%;
      max-height: 348px;
      object-fit: cover;
      border-radius: .5rem .5rem 0 0;
    }

    /* ===== Order Card ===== */
    .order-card {
      background: #fff;
      border: 1px solid #e5e7eb;
      border-radius: .5rem;
      padding: 1rem;
      margin-bottom: .75rem;
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
    .install-card {
        position: fixed;
        bottom: 15px;
        right: 15px;
        background-color: #0d6efd;
        color: white;
        padding: 15px 11px;
        width: 240px;
        border-radius: 10px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
        font-family: Arial, sans-serif;
        font-size: 14px;
        z-index: 9999;
        display: none;
    }

    .install-card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 15px;
        font-weight: bold;
    }

    .close-btn {
        background: transparent;
        border: none;
        font-size: 18px;
        color: white;
        cursor: pointer;
        padding: 0;
    }

    .install-card-body {
        margin-top: 8px;
    }

    .install-card-body p {
        margin: 6px 0 10px;
        font-size: 13px;
    }

    .install-btn {
        background-color: white;
        color: #0d6efd;
        border: none;
        padding: 6px 10px;
        font-size: 13px;
        font-weight: 600;
        border-radius: 6px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: background 0.3s ease;
    }

    .install-btn:hover {
        background-color: #e2e6ea;
    }

    .icon {
        font-size: 16px;
        line-height: 1;
    }
    .fee-badge {
      display: inline-block;
      padding: 4px 14px;
      border-radius: 30px;
      background: linear-gradient(135deg, #28a745, #20c997);
      color: #fff;
      font-weight: bold;
      font-size: 0.8rem;
      letter-spacing: 0.5px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;
    }

    .fee-badge:hover {
      transform: scale(1.1);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

  </style>
    <link rel="manifest" href="/manifest.json">
    <meta name="theme-color" content="#0d6efd">

    <!-- <script>
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/serviceworker.js')
                .then(function () {
                    console.log('Service Worker Registered');
                });
        }
    </script> -->
    <!-- Smaller Install App Card -->
    <div id="installPrompt" class="install-card">
        <div class="install-card-header">
            <span>Install App</span>
            <button id="closePrompt" class="close-btn">&times;</button>
        </div>
        <div class="install-card-body">
            <p>Install our app for a better experience</p>
            <button id="installBtn" class="install-btn">
                <span class="icon">&#8681;</span> Install
            </button>
        </div>
    </div>

    <!-- 🔧 Compact CSS -->

    <!-- 📦 JS: PWA Install Handler -->
    <script>
      let deferredPrompt = null;

      // Wait until the event is triggered by Chrome
      window.addEventListener('beforeinstallprompt', (e) => {
        e.preventDefault(); // Prevent the default install banner
        deferredPrompt = e;

        // Show your custom install card
        const promptCard = document.getElementById('installPrompt');
        if (promptCard) {
          promptCard.style.display = 'block';
        }
      });

      // Install button clicked
      const installBtn = document.getElementById('installBtn');
      if (installBtn) {
        installBtn.addEventListener('click', () => {
          const promptCard = document.getElementById('installPrompt');
          if (promptCard) promptCard.style.display = 'none';

          if (deferredPrompt) {
            deferredPrompt.prompt(); // Show browser install prompt
            deferredPrompt.userChoice.then((choiceResult) => {
              console.log('User choice:', choiceResult.outcome);
              deferredPrompt = null;
            });
          }
        });
      }

      // Close button clicked
      const closeBtn = document.getElementById('closePrompt');
      if (closeBtn) {
        closeBtn.addEventListener('click', () => {
          const promptCard = document.getElementById('installPrompt');
          if (promptCard) promptCard.style.display = 'none';
        });
      }
    </script>
    <script>
      if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('/serviceworker.js')
          .then(() => console.log('✅ Service Worker registered'))
          .catch(err => console.error('❌ Service Worker registration failed:', err));
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
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="{{ asset('images/logo/logo.jpg') }}" alt="logo" class="me-2">
    </a>

    <!-- Auth Buttons -->
    <div class="d-flex align-items-center gap-2 flex-shrink-0">
      <!-- Contact Us (Desktop only) -->
      <a href="#contactUs" class="btn btn-sm d-none d-lg-inline">Contact Us</a>

      @if($user)
        <!-- Deposit Button -->
        <a href="#" class="btn btn-info btn-sm d-flex align-items-center">
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

<!-- ===== Notice ===== -->
@if($notice)
<div class="container mt-3">
  <div class="p-3 rounded" style="background: #2191c1;">
    <h2 class="text-white mb-2" style="font-size: 1.2rem;">Notice:</h2>
    <p class="text-white mb-0 small" style="font-size: .64rem;">
      {{ $notice->remarks ?? '' }}
    </p>
  </div>
</div>
@endif

  <!-- ===== Slider/Banner ===== -->
  <div id="bannerCarousel" class="carousel slide container mt-3" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="0" class="active"></button>
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="1"></button>
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="2"></button>
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="3"></button>
    </div>
    <div class="carousel-inner rounded">
      @if($slider && count($slider) > 0)
        @foreach($slider as $key => $sliders)
          <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
            <img src="{{ asset('/' . $sliders->image) }}" class="d-block w-100" alt="Banner {{ $key + 1 }}">
          </div>
        @endforeach
      @else
        <!-- <div class="carousel-item active">
          <img src="{{asset('images/sliders/s1.jpg')}}" class="d-block w-100" alt="Banner 1">
        </div>
        <div class="carousel-item">
          <img src="images/sliders/s2.jpg" class="d-block w-100" alt="Banner 2">
        </div>
        <div class="carousel-item">
          <img src="images/sliders/s3.jpg" class="d-block w-100" alt="Banner 3">
        </div>
        <div class="carousel-item">
          <img src="images/sliders/s4.jpg" class="d-block w-100" alt="Banner 4">
        </div> -->
      @endif
    </div>
  </div>

  <!-- ===== Our Services ===== -->
  <h2 class="section-title">Our Services</h2>
  <div class="container mb-4">
    <div class="row justify-content-center">
      <!--  -->
      @if($services && count($services) > 0)
        @foreach($services as $service)
          <div class="col-4 col-md-4">
            <div class="product-card OpenModalBtn_{{ strtolower(str_replace(' ', '', $service->id)) }}" 
              data-id="{{ $service->name }}" 
              data-name="{{ $service->name }}" 
              data-category="Our Services"
              data-price="{{ $service->price }}" 
              data-img="{{ asset('/' . $service->image) }}">
              <img src="{{ asset('/' . $service->image) }}" alt="Offer">
              <div class="p-2">{{ $service->name }}</div>
              @if($service->price)
                <h6 class="fee-badge">FEE {{ $service->price }}$</h6>
              @endif
            </div>
          </div>
        @endforeach
      @else
        <div class="col-4 col-md-4">
          <div class="product-card OpenModalBtn_2" 
            data-id="Trusted Company Investment" 
            data-name="Trusted Company Investment" 
            data-category="Our Services"
            data-img="{{asset('images/service/investment.jpg')}}">
            <img src="images/service/investment.jpg" alt="Offer">
            <div class="p-2">Trusted Company Investment</div>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card loanOpenModalBtn" 
            data-id="Get Company Loan and Start Trading" 
            data-name="Get Company Loan and Start Trading" 
            data-category="Our Services"
            data-price="" 
            data-img="{{asset('images/service/loan.jpg')}}">
            <img src="images/service/loan.jpg" alt="Offer">
            <div class="p-2">Get Company Loan and Start Trading</div>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card tournamentOpenModalBtn" 
            data-id="500$ Tournament" 
            data-name="500$ Tournament" 
            data-category="Our Services"
            data-price="20" 
            data-img="{{asset('images/service/tournament.jpg')}}">
            <img src="images/service/tournament.jpg" alt="Offer">
            <div class="p-2">500$ Tournament</div>
            <h6>FEE 20$</h6>
          </div>
        </div>
      @endif
      <!--  -->
    </div>
  </div>
  <!-- ===== Funded Packages ===== -->
  <h2 class="section-title">Funded Packages</h2>
  <div class="container mb-5" id="funded">
    <div class="row g-3">
      @if($funded && count($funded) > 0)
        @foreach($funded as $fundeds)
          <div class="col-4 col-md-4">
            <div class="product-card openModalBtn" 
              data-id="{{ $fundeds->id }}" 
              data-name="{{ $fundeds->name }}" 
              data-category="Funded Packages"
              data-price="{{ $fundeds->price }}" 
              data-img="{{ asset('/' . $fundeds->image) }}">
              <img src="{{ asset('/' . $fundeds->image) }}" alt="Topup">
              <div class="p-2">{{ $fundeds->name }}</div>
              <h6 class="fee-badge">FEE {{ $fundeds->price }}$</h6>
            </div>
          </div>
        @endforeach
      @else
        <div class="col-4 col-md-4">
          <div class="product-card openModalBtn" 
            data-id="100$ fundad account" 
            data-name="100$ fundad account" 
            data-category="Funded Packages"
            data-price="15" 
            data-img="{{asset('images/funded/f1.jpg')}}">
            <img src="{{asset('images/funded/f1.jpg')}}" alt="Topup">
            <div class="p-2">100$ fundad account</div>
            <h6>FEE 15$</h6>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card openModalBtn" 
            data-id="200$ fundad account" 
            data-name="200$ fundad account" 
            data-category="Funded Packages"
            data-price="30" 
            data-img="{{asset('images/funded/f2.jpg')}}">
            <img src="images/funded/f2.jpg" alt="Combo">
            <div class="p-2">200$ fundad account</div>
            <h6>FEE 30$</h6>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card openModalBtn" 
            data-id="300$ fundad account" 
            data-name="300$ fundad account" 
            data-category="Funded Packages"
            data-price="40" 
            data-img="{{asset('images/funded/f3.jpg')}}">
            <img src="images/funded/f3.jpg" alt="PUBG">
            <div class="p-2">300$ fundad account</div>
            <h6>FEE 40$</h6>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card openModalBtn" 
            data-id="400$ fundad account" 
            data-name="400$ fundad account" 
            data-category="Funded Packages"
            data-price="50" 
            data-img="{{asset('images/funded/f4.jpg')}}">
            <img src="images/funded/f4.jpg" alt="PUBG">
            <div class="p-2">400$ fundad account</div>
            <h6>FEE 50$</h6>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card openModalBtn" 
            data-id="500$ fundad account" 
            data-name="500$ fundad account" 
            data-category="Funded Packages"
            data-price="60" 
            data-img="{{asset('images/funded/f5.jpg')}}">
            <img src="images/funded/f5.jpg" alt="PUBG">
            <div class="p-2">500$ fundad account</div>
            <h6>FEE 60$</h6>
          </div>
        </div>
        <div class="col-4 col-md-4">
          <div class="product-card openModalBtn" 
            data-id="1000$ fundad account" 
            data-name="1000$ fundad account" 
            data-category="Funded Packages"
            data-price="120" 
            data-img="{{asset('images/funded/f6.jpg')}}">
            <img src="images/funded/f6.jpg" alt="PUBG">
            <div class="p-2">1000$ fundad account</div>
            <h6>FEE 120$</h6>
          </div>
        </div>
      @endif
    </div>
  </div>

  <!-- ===== Our Social Media ===== -->
  <h2 class="section-title">Our Social Media</h2>
  <div class="container mb-5">
    <div class="row justify-content-center g-3">

      <!-- YouTube Card -->
      <div class="col-4 col-md-4">
        <a href="https://www.youtube.com/@Rs_Sabbir_Trader" target="_blank" class="text-decoration-none text-dark">
          <div class="product-card text-center">
            <img src="images/social/youtube.jpg" alt="YouTube" class="img-fluid">
            <div class="p-2">YouTube Channel</div>
          </div>
        </a>
      </div>

      <!-- Telegram Card -->
      <div class="col-4 col-md-4">
        <a href="https://t.me/BD_funded_trader" target="_blank" class="text-decoration-none text-dark">
          <div class="product-card text-center">
            <img src="images/social/telegram.jpg" alt="Telegram" class="img-fluid">
            <div class="p-2">Telegram Group</div>
          </div>
        </a>
      </div>

      <!-- Tiktok Card -->
      <div class="col-4 col-md-4">
        <a href="https://www.tiktok.com/@rs_sabbir_trader99" target="_blank" class="text-decoration-none text-dark">
          <div class="product-card text-center">
            <img src="images/social/tiktok.jpg" alt="tiktok" class="img-fluid">
            <div class="p-2">Tiktok</div>
          </div>
        </a>
      </div>

    </div>
  </div>

  <!-- ===== REVIWES ===== -->
  <div class="container mb-5">
    <h2 class="section-title">REVIWES</h2>
    <div class="order-card d-flex justify-content-between">
      <span><strong>Md Ashik Hosan</strong> – 50$ Diamond</span>
      <span class="text-success">Level5</span>
    </div>
    <div class="order-card d-flex justify-content-between">
      <span><strong>RAKIB</strong> – 15$ Crown</span>
      <span class="text-success">Level3</span>
    </div>
    <div class="order-card d-flex justify-content-between">
      <span><strong>Md Eakosh</strong> – 10$ Bronze</span>
      <span class="text-success">Level2</span>
    </div>
  </div>

  <!-- ===== App Download & Telegram ===== -->
  <!-- <div class="container mb-5 d-flex flex-column flex-md-row gap-3 justify-content-center">
    <a href="#" class="app-btn">
      <img src="https://nenoxshop.com/_nuxt/app_link.zDBBfP7d.png" style="width:200px;" alt="App Download">
    </a>
    <a href="#" class="app-btn">
      <img src="https://nenoxshop.com/_nuxt/support_img.BVYtQjC0.png" style="width:200px;" alt="Telegram Support">
    </a>
  </div> -->

  <!-- ===== Footer ===== -->
  <footer class="text-white pt-4 pb-3 footer" id="contactUs">
    <div class="container">
      <div class="row text-start text-md-start align-items-center">

        <!-- Stay Connected -->
        <div class="col-md-4 mb-4 mb-md-0">
          <h5 class="fw-bold">STAY CONNECTED</h5>
          <p class="small" style="font-size: 11px;color: rgb(173, 173, 173);font-weight: 500;">
            কোন সমস্যায় পড়লে টেলিগ্রামে যোগাযোগ করবেন।<br>
            তাহলেই দ্রুত সমাধান পেয়ে যাবেন।
          </p>
          <div class="d-flex justify-content-start justify-content-md-start gap-3">
            <a href="https://www.youtube.com/@Rs_Sabbir_Trader" class="btn btn-outline-light rounded-3"><i class="bi bi-youtube"></i></a>            
            <a href="https://t.me/BD_funded_trader" class="btn btn-outline-light rounded-3"><i class="bi bi-telegram"></i></a>
            <a href="https://www.tiktok.com/@rs_sabbir_trader99" class="btn btn-outline-light rounded-3"><i class="bi bi-tiktok"></i></a>
            <a href="https://t.me/BD_funded_trader" class="btn btn-outline-light rounded-3"><i class="bi bi-facebook"></i></a>
          </div>
        </div>
        <div class="col-md-4 text-start text-md-start"></div>
        <!-- Support Center -->
        <div class="col-md-4 text-start text-md-start">
          <h5 class="fw-bold mb-3">SUPPORT CENTER</h5>
          <div class="border rounded d-flex align-items-start p-2 mb-3">
            <a href="https://t.me/BD_funded_trader"><i class="bi bi-telegram fs-1 text-info me-2"></i></a>
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
      <!-- <a href="https://wa.me/8801XXXXXXXXX" class="btn-floating bg-success">
        <i class="bi bi-whatsapp"></i>
      </a> -->
      <a href="https://t.me/bd_funded_support" class="btn-floating bg-primary">
        <i class="bi bi-telegram"></i>
      </a>
    </div>
    <a href="#" class="btn-floating bg-danger" onclick="toggleChatButtons()" id="toggle-button">
      <i class="bi bi-telephone" id="toggle-icon"></i>
    </a>
  </div>
  <!-- ===== Responsive Popup Modal ===== -->
  <div class="modal fade" id="promoModal" tabindex="-1" aria-labelledby="promoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content rounded-3 shadow">
        <div class="modal-body p-0">
          <div class="row g-0 align-items-center">
            
            <!-- Left Side Image -->
            <div class="col-md-6">
              <img src="images/popup/popoup1.jpg" class="img-fluid w-100 h-100" alt="Promo Banner" style="object-fit: cover;">
            </div>

            <!-- Right Side Text -->
            <div class="col-md-6 p-3 d-flex flex-column justify-content-center text-center">
              <h5 class="mb-3 fw-bold">Funding Balance কিভাবে পাবেন? জানতে বিস্তারিত ভিডিও দেখুন</h5>
              <a href="#" class="btn btn-primary">ক্লিক করুন</a>
            </div>
            
          </div>
        </div>
        <!-- Close Button -->
        <button type="button"
                class="btn btn-danger position-absolute top-0 end-0 m-3 rounded-circle d-flex align-items-center justify-content-center"
                style="width: 40px; height: 40px;"
                data-bs-dismiss="modal"
                aria-label="Close">
          <i class="bi bi-x-lg fs-4 text-white"></i>
        </button>
      </div>
    </div>
  </div>
  <!-- Funded Package Modal -->
  <div class="modal fade" id="packageModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <img id="modalPackageImg" src="images/placeholder.png" alt="Package" class="me-3 rounded" style="width: 60px">
          <div>
            <h5 class="modal-title" id="modalPackageName">Package Name</h5>
            <p class="text-muted mb-0">Price: <strong class="text-success" id="modalPackagePrice">0 $</strong></p>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <!-- Modal Body -->
        <div class="modal-body">
          <div class="row">
            <!-- Left: Rules -->
            <div class="col-md-7">
              <h6 class="mb-3">Funding Balance নেওয়ার শর্তাবলী</h6>
              <ul class="list-group small">
                <li class="list-group-item">মিনিমাম প্রফিট: প্রতিদিন +10%</li>
                <li class="list-group-item">ম্যাক্স লস: প্রতিদিন –10%</li>
                <li class="list-group-item">ট্রেড লিমিট: দিনে সর্বোচ্চ 10</li>
                <li class="list-group-item">রিস্ক ম্যানেজমেন্ট: প্রতি ট্রেডে ব্যালেন্সের 2%</li>
                <li class="list-group-item">রুল ভাঙলে: সাথে সাথে অ্যাকাউন্ট ক্যানসেল</li>
                <li class="list-group-item">প্রফিট শেয়ার: 60% ট্রেডার, 40% কোম্পানি</li>
              </ul>
              <p class="mt-2 small text-muted">
                Note: আপনারা যদি সব শর্ত মেনে চলতে পারেন তবে সহজেই আমাদের ফান্ডিং ব্যালেন্স সুবিধা নিতে পারবেন।
              </p>
            </div>
            <!-- Right: Balance -->
            <div class="col-md-5 mt-5">
              <div class="border rounded p-3 mb-3 bg-white text-center">
                <h6>আপনার অ্যাকাউন্ট ব্যালেন্স</h6>
                <p class="fs-5 fw-bold text-success">$ {{$user->total_deposit_amount ?? ''}}</p>
              </div>
              <!-- If no user -->
              <?php if(empty($user)): ?>
                <a href="{{route('frontend.login')}}" class="btn btn-warning w-100">Login First</a>
              <?php endif; ?>
            </div>
          </div>
        </div>
        <!-- Modal Footer -->
        <div class="modal-footer justify-content-between">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="acceptRules">
            <label class="form-check-label small" for="acceptRules"> আমি সকল নিয়ম মেনে নিলাম।</label>
          </div>
          <!-- Hidden Form -->
          <form id="buyForm" action="{{route('buy-package.funded')}}" method="POST">
            @csrf
            <input type="hidden" name="user_id" value="<?php echo $user->id ?? ''; ?>">
            <input type="hidden" name="package_id" id="modalPackageId" value="">
            <input type="hidden" name="amount" id="modalPackageAmount" value="">
            <button id="buyButton" type="submit" class="btn btn-primary" disabled>Accept & Buy</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Success Modal -->
  <div class="modal fade" id="successModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content text-center p-4">
        <h4 class="text-success">🎉 Purchase Successful!</h4>
        <p>Your package has been activated successfully.</p>
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>

<!-- Investment Package Modal -->
<div class="modal fade" id="investmentPackageModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <img id="modalPackageImg2" src="{{asset('images/placeholder.png')}}" alt="Package" class="me-3 rounded" style="width: 60px">
        <div>
          <h5 class="modal-title" id="modalPackageName2">Package Name</h5>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body">
        <div class="row">
          <!-- Left: Rules -->
          <div class="col-md-7">
            <h6 class="mb-3">Investment এর শর্তাবলী</h6>
            <ul class="list-group small">
              <li class="list-group-item">আপনার ইনভেস্টমেন্ট থেকে নিয়মিত আয় করুন – প্রতি সপ্তাহে 10% লাভ, মূলধন নিরাপদ</li>
              <li class="list-group-item">আপনি চাইলে আমাদের কোম্পানিতে ইনভেস্ট করে নিয়মিত কমিশন পেতে পারেন।</li>
              <li class="list-group-item">আপনার ইনভেস্টমেন্টের উপর 10% প্রতি সপ্তাহে লাভ।</li>
              <li class="list-group-item">মিনিমাম ইনভেস্টমেন্ট: $100</li>
              <li class="list-group-item">বড় ইনভেস্ট, বড় লাভ – আপনার ক্যাপিটালকে আয়েশের সুযোগ দিন!</li>
              <li class="list-group-item">ক্যাপিটাল নিরাপত্তা: ইনভেস্টমেন্টের মূলধন সেফ থাকবে, শুধু কমিশন দেওয়া হবে</li>
              <li class="list-group-item">মুলধন উত্তোলনের নিয়ম: মুলধন উত্তোলনের জন্য অ্যাপ্লিকেশন দিতে হবে। ৭ দিনের মধ্যে উত্তোলন সম্পন্ন হবে।</li>
            </ul>
          </div>

          <!-- Right: Form -->
          <div class="col-md-5 mt-4">
            <form id="buyForm2" action="{{route('frontend.invest')}}" method="POST" enctype="multipart/form-data">
              @csrf
              <input type="hidden" name="user_id" value="<?php echo $user->id ?? ''; ?>">
              <input type="hidden" name="package_id" id="modalPackageId2" value="">

              <!-- Balance Info -->
              <div class="border rounded p-3 mb-3 mt-3 bg-white text-center">
                <h6>আপনার অ্যাকাউন্ট ব্যালেন্স</h6>
                <p class="fs-5 fw-bold text-success">$ {{$user->total_deposit_amount ?? '0'}}</p>
              </div>

              <!-- Amount -->
              <div class="mb-5">
                <label for="modalPackageAmount2" class="form-label fw-bold">Invest Amount ($)</label>
                <input type="number" name="amount" id="modalPackageAmount2" 
                       class="form-control" placeholder="Enter amount" 
                       min="100" max="10000000" required>
                <div class="form-text">Minimum Amount must be 100$.</div>
              </div>
              <!-- Checkbox + Submit -->
              <div class="row d-flex justify-content-between align-items-center mt-4">
                <div class="form-check float-left">
                  <input class="form-check-input" type="checkbox" id="acceptRules2">
                  <label class="form-check-label small" for="acceptRules2">
                    আমি সকল নিয়ম মেনে নিলাম।
                  </label>
                </div>
                <?php if(empty($user)): ?>
                  <a href="{{route('frontend.login')}}" class="btn btn-warning mb-4">Login First</a>
                  <button id="buyButton2" type="submit" class="btn btn-primary" style="display:none" disabled>
                    Accept & Invest
                  </button>
                <?php else: ?>
                  <button id="buyButton2" type="submit" class="btn btn-primary" disabled>
                    Accept & Invest
                  </button>
                <?php endif; ?>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // When the modal is hidden (closed)
  document.getElementById('packageModal').addEventListener('hidden.bs.modal', function () {
    // Clear modal content
    modalName.textContent = '';
    modalPrice.textContent = '0 $';
    modalImg.src = '/images/placeholder.png';
    modalId.value = '';
    modalAmount.value = '';
    checkbox.checked = false;
    // toggleBuyButton(); // Disable Buy button again
    // toggleBuyButton2();
  });
</script>
<!-- funded -->
<script>
  const checkbox = document.getElementById('acceptRules');
  const buyButton = document.getElementById('buyButton');
  const buyForm = document.getElementById('buyForm');
  const userLoggedIn = <?php echo empty($user) ? 'false' : 'true'; ?>;
  const userBalance = <?php echo $user->total_deposit_amount ?? 0; ?>;

  const modalName = document.getElementById('modalPackageName');
  const modalImg = document.getElementById('modalPackageImg');
  const modalPrice = document.getElementById('modalPackagePrice');
  const modalId = document.getElementById('modalPackageId');
  const modalAmount = document.getElementById('modalPackageAmount');

  const balanceBox = document.querySelector('#packageModal .modal-body .col-md-5 .border');

  // Deposit button HTML (string)
  const depositButtonHtml = `<a href="/deposit-form" class="btn btn-warning w-100 mt-2" id="dynamicDepositBtn">Deposit Your Account</a>`;

  // Funded Modal open
  document.querySelectorAll('.openModalBtn').forEach(btn => {
    btn.addEventListener('click', function () {
      let card = this.closest('.product-card');
      let id = card.getAttribute('data-id');
      let name = card.getAttribute('data-name');
      let price = parseFloat(card.getAttribute('data-price'));
      let img = card.getAttribute('data-img');

      // fill modal
      modalName.textContent = name;
      modalPrice.textContent = price + "$ ";
      modalImg.src = img;
      modalId.value = id;
      modalAmount.value = price;

      // clean old button
      balanceBox.querySelector('#dynamicDepositBtn')?.remove();

      if (!userLoggedIn) {
       
        buyButton.style.display = "disabled";
      } else {
        buyButton.style.display = "inline-block";

        if (userBalance < price) {
          
          buyButton.disabled = true;
          balanceBox.insertAdjacentHTML('afterend', depositButtonHtml);
        } else {
          buyButton.disabled = !checkbox.checked;
        }
      }

      new bootstrap.Modal(document.getElementById('packageModal')).show();
    });
  });

  // Checkbox
  checkbox.addEventListener('change', () => {
    const price = parseFloat(modalAmount.value);
    if (userLoggedIn && userBalance >= price) {
      buyButton.disabled = !checkbox.checked;
    }
  });

  // Clear on close
  document.getElementById('packageModal').addEventListener('hidden.bs.modal', function () {
    modalName.textContent = 'Package Name';
    modalPrice.textContent = '0 $';
    modalImg.src = 'images/placeholder.png';
    modalId.value = '';
    modalAmount.value = '';
    checkbox.checked = false;
    buyButton.disabled = true;
    balanceBox.querySelector('#dynamicDepositBtn')?.remove();
  });

</script>
<!-- <script>
  buyForm.addEventListener('submit', function (e) {
    e.preventDefault(); 
    // current modal hide
    bootstrap.Modal.getInstance(document.getElementById('packageModal')).hide();

    // show success modal
    new bootstrap.Modal(document.getElementById('successModal')).show();
  });
</script> -->

<!-- investment -->
<script>
  const checkbox2 = document.getElementById('acceptRules2');
  const buyButton2 = document.getElementById('buyButton2');
  const buyForm2 = document.getElementById('buyForm2');
  const userLoggedIn2 = <?php echo empty($user) ? 'false' : 'true'; ?>;
  const userBalance2 = <?php echo $user->total_deposit_amount ?? 0; ?>;

  const modalName2 = document.getElementById('modalPackageName2');
  const modalImg2 = document.getElementById('modalPackageImg2');
  const modalId2 = document.getElementById('modalPackageId2');
  const modalAmount2 = document.getElementById('modalPackageAmount2');

  const balanceBox2 = document.querySelector('#investmentPackageModal .modal-body .col-md-5 .border');

  const depositButtonHtml2 = `<a href="/deposit-form" class="btn btn-warning w-100 mt-2" id="dynamicDepositBtn2">Deposit Your Account</a>`;

  // Modal open
  document.querySelectorAll('.OpenModalBtn_2').forEach(btn => {
    btn.addEventListener('click', function () {
      let card = this.closest('.product-card');
      let id2 = card.getAttribute('data-id');
      let name2 = card.getAttribute('data-name');
      let img2 = card.getAttribute('data-img');

      // fill modal
      modalName2.textContent = name2;
      modalImg2.src = img2;
      modalId2.value = id2;

      // clean old button
      balanceBox2.querySelector('#dynamicDepositBtn2')?.remove();

      if (!userLoggedIn2) {
        buyButton2.style.display = "disabled";
      } else {
        buyButton2.style.display = "inline-block";

        if (userBalance2 < 100) {
          buyButton2.disabled = true;
          balanceBox2.insertAdjacentHTML('afterend', depositButtonHtml2);
        } else {
          buyButton2.disabled = !checkbox2.checked;
        }
      }

      new bootstrap.Modal(document.getElementById('investmentPackageModal')).show();
    });
  });

  // Checkbox validation
  checkbox2.addEventListener('change', validateForm);
  // Amount input validation
  modalAmount2.addEventListener('input', validateForm);

  function validateForm() {
    const amount = parseFloat(modalAmount2.value) || 0;

    if (userLoggedIn2 && checkbox2.checked && amount >= 100 && amount <= userBalance2) {
      buyButton2.disabled = false;
    } else {
      buyButton2.disabled = true;
    }
  }

  // Clear on close
  document.getElementById('investmentPackageModal').addEventListener('hidden.bs.modal', function () {
    modalName2.textContent = 'Package Name';
    modalImg2.src = 'images/placeholder.png';
    modalId2.value = '';
    modalAmount2.value = '';
    checkbox2.checked = false;
    buyButton2.disabled = true;
  });
</script>

</script>
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
  <!-- ===== Show Modal on First Load ===== -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var promoModal = new bootstrap.Modal(document.getElementById('promoModal'));
    promoModal.show();
  });
</script>
</body>
</html>
