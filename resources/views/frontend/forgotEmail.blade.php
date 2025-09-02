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
    .navbar-brand img { height: 76px;width: 175px; }
    .navbar-footer img { height: 70px;width: 140px; }
    .banner img { width: 100%; border-radius: .5rem; }
    @media (max-width: 576px) {
      .navbar-brand img {
        height: 44px;
        width: auto;
      }
    }

    /* ===== Section Registration Form ===== */
    .card {
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .google-btn {
      border: 1px solid #ddd;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
    }
    .form-label {
      font-weight: 500;
    }
    .form-control::placeholder {
      color: #bbb;
    }
    .login-link {
      font-size: 0.9rem;
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
  <div class="container d-flex justify-content-between align-items-center">

    <!-- Brand Logo -->
    <a class="navbar-brand d-flex align-items-center" href="/">
      <img src="{{ asset('images/logo/logo.jpg') }}" alt="logo" class="me-2">
    </a>

    <!-- Auth Buttons -->
    <div class="d-flex align-items-center gap-2">
      <!-- Contact Us (Desktop only) -->
      <a href="#contactUs" class="btn btn-sm d-none d-lg-inline">Contact Us</a>
      <!-- Login (Always show) -->
      <a href="{{route('frontend.login')}}" class="btn btn-primary btn-sm">Login</a>
    </div>
  </div>
</nav>
<!-- ===== Mobile Navbar (Bottom Fixed) ===== -->
<nav class="navbar fixed-bottom bg-white border-top d-lg-none">
  <div class="container d-flex justify-content-around text-center">

    <a href="/" class="text-decoration-none text-dark">
      <i class="bi bi-house-door fs-5"></i><br>
      <small>Home</small>
    </a>

    <a href="https://www.youtube.com/@Rs_Sabbir_Trader" class="text-decoration-none text-dark">
      <i class="bi bi-youtube fs-5"></i><br>
      <small>Tutorial</small>
    </a>

    <a href="#" class="text-decoration-none text-dark">
      <i class="bi bi-cash-stack fs-5"></i><br>
      <small>Funded</small>
    </a>

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
<div class="container d-flex justify-content-center align-items-center min-vh-100 my-3">
  <div class="col-md-6 col-lg-5">
    <div class="card p-4">
      <h4 class="text-center fw-bold mb-3">Login</h4>

      <!-- Google Login -->
      <a href="{{ route('google.login') }}" class="btn google-btn mb-3 fw-bold">
        <img src="https://img.icons8.com/color/16/000000/google-logo.png"/>
        Login with Google
      </a>

      <!-- Divider -->
      <div class="text-center my-2 text-muted fw-bold">Or write email for forgot password</div>
      <hr>

      <!-- Form -->
      <form method="POST" action="{{route('frontend.forgot-password-mail')}}" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
          <label class="form-label">Email<span class="text-danger">*</span></label>
          <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
        </div>
        <button type="submit" class="btn btn-primary w-100 fw-bold">Login</button>
      </form>

      <!-- Footer -->
      <div class="text-center mt-3 login-link fw-bold">
        New user to BD Funded Trader? <a href="{{route('frontend.register')}}" class="text-decoration-none">Register</a> Now
      </div>
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
