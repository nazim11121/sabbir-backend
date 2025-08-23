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
  </style>
</head>
<body>
<!-- ===== Navbar (Responsive) ===== -->
<nav class="navbar navbar-expand-lg bg-white shadow-sm sticky-top">
  <div class="container d-flex justify-content-between align-items-center">

    <!-- Brand Logo -->
    <a class="navbar-brand" href="#">
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
      @php
      $users = Auth::user();
    @endphp
    @if($users)
      <!-- Deposit Button -->
      <a href="#" class="btn btn-info d-flex align-items-center">
        <i class="bi bi-wallet2 me-1"></i> 
        <span>0 $</span>
      </a>
      <!-- User -->
      <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="user" width="40" class="rounded-circle">
      @else
      <!-- Login (Always show) -->
      <a href="{{route('login')}}" class="btn btn-primary btn-sm">Login</a>
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
    @php
      $users = Auth::user();
    @endphp
    @if($users)
      <a href="#" class="text-decoration-none text-dark">
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