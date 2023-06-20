<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>MoHotelPMSLogin</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/login/login.css">
    <link href="https://cdn.jsdelivr.net/npm/naver-nanumfont/font.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="/images/login/login.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="/images/login/logo.svg" alt="logo" class="logo">
              </div>
              <p class="login-card-description">Sign into your account</p>
              <form action="userLogin" method="post">
                  <div class="form-group">
                    <label class="sr-only" for="id">ID</label>
                    <input type="text" name="id" id="id" class="form-control" placeholder="Please enter your ID">
                  </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Please enter your password">
                  </div>
                  <button class="btn btn-block login-btn mb-4" type="submit" value="Login">Login</button>
                </form>
            <%--    <a href="#" class="forgot-password-link" style="font-family: 'Nanum Gothic', sans-serif;">MOHOTEL: Don't have an account?  </a>
                <p class="login-card-footer-text"> <a href="#" class="text-reset">Business Registration Here!</a></p>--%>
                <a href="/partner/join" class="forgot-password-link" style="font-family: 'Nanum Gothic', sans-serif;" >MOHOTEL: Don't have an account?</a>
                <p class="login-card-footer-text">
                    <a href="/partner/join" class="text-reset" data-bs-toggle="modal" data-bs-target="#exampleModalLg1">Business Registration Here!</a>
                </p>

            <%--                <nav class="login-card-footer-nav">--%>
<%--                  <a href="#!">Terms of use.</a>--%>
<%--                  <a href="#!">Privacy policy</a>--%>
<%--                </nav>--%>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="card login-card">
        <img src="assets/images/login.jpg" alt="login" class="login-card-img">
        <div class="card-body">
          <h2 class="login-card-title">Login</h2>
          <p class="login-card-description">Sign in to your account to continue.</p>
          <form action="#!">
            <div class="form-group">
              <label for="email" class="sr-only">Email</label>
              <input type="email" name="email" id="email" class="form-control" placeholder="Email">
            </div>
            <div class="form-group">
              <label for="password" class="sr-only">Password</label>
              <input type="password" name="password" id="password" class="form-control" placeholder="Password">
            </div>
            <div class="form-prompt-wrapper">
              <div class="custom-control custom-checkbox login-card-check-box">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember me</label>
              </div>
              <a href="#!" class="text-reset">Forgot password?</a>
            </div>
            <input name="login" id="login" class="btn btn-block login-btn mb-4" type="button" value="Login">
          </form>
          <p class="login-card-footer-text">Don't have an account? <a href="#!" class="text-reset">Register here</a></p>
        </div>
      </div> -->
    </div>
      <%--insert 모달--%>


  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<%--  <script>
      function openPopup() {
          var url = "/partner/join";
          var popup = window.open(url, "_blank", "width=500,height=500");
          popup.focus();
      }
  </script>--%>
</body>
</html>
