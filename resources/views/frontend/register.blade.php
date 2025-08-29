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
  @flasher_render
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
    <a class="navbar-brand" href="{{url('/')}}">
      <img src="{{asset('images/logo/logo.jpg')}}" alt="Shop" height="40"> <!-- <h4 class="text-decoration-none text-dark"><strong>BD Funded Trader</strong></h4> -->
    </a>

    <!-- Desktop Menu -->
    <!-- <div class="d-none d-lg-flex gap-4">
      <a href="#" class="nav-link">Topup</a>
      <a href="#" class="nav-link">Contact Us</a>
    </div> -->

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

    <a href="#" class="text-decoration-none text-dark">
      <i class="bi bi-house-door fs-5"></i><br>
      <small>Home</small>
    </a>

    <a href="#" class="text-decoration-none text-dark">
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

<!-- ===== Registration Form ===== -->
<div class="container d-flex justify-content-center align-items-center min-vh-100 my-4">
  <div class="col-md-6 col-lg-5">
    <div class="card p-4">
      <h4 class="text-center fw-bold mb-3">Login</h4>

      <!-- Google Login -->
      <a href="{{ route('google.login') }}" class="btn google-btn mb-3 fw-bold">
        <img src="https://img.icons8.com/color/16/000000/google-logo.png"/>
        Login with Google
      </a>

      <!-- Divider -->
      <div class="text-center my-2 text-muted fw-bold">Or sign up with credentials</div>
      <hr>

      <!-- Form -->
      <form method="POST" action="{{route('register.store')}}" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
          <label class="form-label">Name<span class="text-danger">*</span></label>
          <input type="text" name="name" id="name" class="form-control" placeholder="Name" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Phone<span class="text-danger">*</span></label>
          <input type="text" name="phone_number" id="phone_number" class="form-control" placeholder="Phone" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Email<span class="text-danger">*</span></label>
          <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Password <span class="text-danger">*</span></label>
          <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Confirm Password <span class="text-danger">*</span></label>
          <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password" required>
          <div id="passwordHelp" class="invalid-feedback">
            Passwords do not match.
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label">Refer Code</label>
          <input type="text" name="refer_code" id="refer_code" class="form-control" placeholder="Optional refer code">
        </div>

        <div class="mb-3">
          <label class="form-label">Upload NID Images<span class="text-danger">*</span></label>
          <input type="file" name="nid_image[]" id="nid_image" class="form-control" accept="image/*" multiple required>
        </div>

        <button type="submit" class="btn btn-primary w-100 fw-bold">Register</button>
      </form>

      <!-- Footer -->
      <div class="text-center mt-3 login-link fw-bold">
        Already member? <a href="{{route('frontend.login')}}" class="text-decoration-none">Login</a> Now
      </div>
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
<!-- <pre>{{ print_r(session()->all(), true) }}</pre> -->

  <!-- ===== Flash Message Modal ===== -->
@if(session('error'))
<div class="modal fade" id="flashModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-danger text-white">
        <h5 class="modal-title">Error</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        {{ session('error') }}
      </div>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var flashModal = new bootstrap.Modal(document.getElementById('flashModal'));
    flashModal.show();
});
</script>
@endif
  <!-- ===== Scripts ===== -->

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        let flashModal = new bootstrap.Modal(document.getElementById('flashModal'));
        flashModal.show();
    });
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
  <script>
  const password = document.getElementById("password");
  const confirmPassword = document.getElementById("confirm_password");

  confirmPassword.addEventListener("input", function () {
    if (confirmPassword.value !== password.value) {
      confirmPassword.classList.add("is-invalid");
    } else {
      confirmPassword.classList.remove("is-invalid");
    }
  });
</script>
</body>
</html>
