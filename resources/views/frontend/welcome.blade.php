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
      max-height: 340px;
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
</head>
<body>
<!-- ===== Navbar (Responsive) ===== -->
<nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
  <div class="container d-flex justify-content-between align-items-center flex-wrap flex-lg-nowrap">
    @php
      $user = session('referrer');
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
          <i class="bi bi-wallet2 me-1"></i> 
          <span>0 $</span>
        </a>
        <!-- User -->
        <!-- User Dropdown (Image Only Trigger) -->
      <div class="dropdown">
        <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User" width="40" class="rounded-circle">
        </a>
        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
          <li><a class="dropdown-item" href="{{ route('frontend-dashboard') }}"><i class="bi bi-person-circle me-2"></i> Profile</a></li>
          <li><hr class="dropdown-divider"></li>
          <li>
            <form action="{{ route('logout.user') }}" method="POST">
              @csrf
              <button type="submit" class="dropdown-item text-danger"><i class="bi bi-box-arrow-right me-2"></i> Logout</button>
            </form>
          </li>
        </ul>
      </div>
      @else
        <!-- Login (Always show) -->
        <a href="{{ route('login') }}" class="btn btn-primary btn-sm">Login</a>
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

      <a href="#" class="text-decoration-none text-dark">
        <i class="bi bi-cash fs-5"></i><br>
        <small>Withdraw</small>
      </a>
    @else
      <a href="#" class="text-decoration-none text-dark">
        <i class="bi bi-youtube fs-5"></i><br>
        <small>Tutorial</small>
      </a>

      <a href="#" class="text-decoration-none text-dark">
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
<div class="container mt-3">
  <div class="p-3 rounded" style="background: #2191c1;">
    <h2 class="text-white mb-2" style="font-size: 1.2rem;">Notice:</h2>
    <p class="text-white mb-0 small" style="font-size: .64rem;">
      <!-- এখন টপ-আপ AI দিয়ে (২৪ ঘন্টা) মাত্র ২০ সেকেন্ডের ভিতরে অর্ডার দেওয়া হয়" যেকোনো প্রয়োজনে WhatsApp: 01628948415 - - - - বিঃদ্রঃ মা-বাবা বা ফ্যামিলির কারো ফোন থেকে টাকা চুরি করে কেউ টপআপ করবেন না! -->
       এখানে শুধুমাত্র দক্ষ ট্রেডারদের ফান্ডিং ব্যালেন্স প্রদান করা হবে।

      যে কোনো প্রয়োজনে যোগাযোগ করুন WhatsApp: 01*********

      বিঃদ্রঃ প্রথমে ডেমো ব্যালেন্সে নিজের দক্ষতা প্রমাণ করতে হবে। দক্ষতা প্রমাণ করতে পারলেই ফান্ডিং ব্যালেন্স প্রদান করা হবে।
    </p>
  </div>
</div>

  <!-- ===== Banner ===== -->
  <div id="bannerCarousel" class="carousel slide container mt-3" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="0" class="active"></button>
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="1"></button>
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="2"></button>
      <button type="button" data-bs-target="#bannerCarousel" data-bs-slide-to="3"></button>
    </div>
    <div class="carousel-inner rounded">
      <div class="carousel-item active">
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
      </div>
    </div>
  </div>

  <!-- ===== Our Services ===== -->
  <h2 class="section-title">Our Services</h2>
  <div class="container mb-4">
    <div class="row justify-content-center">
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/service/investment.jpg" alt="Offer">
          <div class="p-2">Trusted company investment</div>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/service/loan.jpg" alt="Offer">
          <div class="p-2">Get company loan and start trading</div>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/service/tournament.jpg" alt="Offer">
          <div class="p-2">500$ Tournament</div>
          <h6>Fee 20$</h6>
        </div>
      </div>
    </div>
  </div>

  <!-- ===== Funded Packages ===== -->
  <h2 class="section-title">Funded Packages</h2>
  <div class="container mb-5">
    <div class="row g-3">
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/funded/f1.jpg" alt="Topup">
          <div class="p-2">100$ fundad account</div>
          <h6>Fee 15$</h6>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/funded/f2.jpg" alt="Combo">
          <div class="p-2">200$ fundad account</div>
          <h6>Fee 30$</h6>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/funded/f3.jpg" alt="PUBG">
          <div class="p-2">300$ fundad account</div>
          <h6>Fee 40$</h6>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/funded/f4.jpg" alt="PUBG">
          <div class="p-2">400$ fundad account</div>
          <h6>Fee 50$</h6>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/funded/f5.jpg" alt="PUBG">
          <div class="p-2">500$ fundad account</div>
          <h6>Fee 60$</h6>
        </div>
      </div>
      <div class="col-4 col-md-4">
        <div class="product-card">
          <img src="images/funded/f6.jpg" alt="PUBG">
          <div class="p-2">1000$ fundad account</div>
          <h6>Fee 120$</h6>
        </div>
      </div>
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
            <img src="images/social/youtube.jpg" alt="YouTube" class="rounded-circle img-fluid">
            <div class="p-2">YouTube Channel</div>
          </div>
        </a>
      </div>

      <!-- Telegram Card -->
      <div class="col-4 col-md-4">
        <a href="https://t.me/BD_funded_trader" target="_blank" class="text-decoration-none text-dark">
          <div class="product-card text-center">
            <img src="images/social/telegram.jpg" alt="Telegram" class="rounded-circle img-fluid">
            <div class="p-2">Telegram Group</div>
          </div>
        </a>
      </div>

      <!-- WhatsApp Card -->
      <div class="col-4 col-md-4">
        <a href="https://chat.whatsapp.com/DaePkiIEnx9FZgaQO0Er1a?mode=ac_t" target="_blank" class="text-decoration-none text-dark">
          <div class="product-card text-center">
            <img src="images/social/whatsapp.jpg" alt="Whatsapp" class="rounded-circle img-fluid">
            <div class="p-2">Whatsapp Group</div>
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

  <!-- ===== Promo Banner ===== -->
  <section class="banner container mb-5">
    <img src="images/banner.jpg" alt="Special Promo">
  </section>

  <!-- ===== Footer ===== -->
  <footer class="footer">
    <div class="container">
      <div class="row g-4">
        <div class="col-md-6">
          <h6>
            <a class="navbar-footer mx-auto mx-lg-0 text-decoration-none text-dark" href="#">
              <img src="images/logo/logo.jpg" alt="Shop"> <!-- <h4><strong>BD Funded Trader</strong></h4> -->
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
  <!-- ===== Show Modal on First Load ===== -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var promoModal = new bootstrap.Modal(document.getElementById('promoModal'));
    promoModal.show();
  });
</script>
</body>
</html>
