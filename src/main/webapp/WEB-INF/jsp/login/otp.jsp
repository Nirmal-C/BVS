<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>BVS - Login</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="files/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="files/icon/feather/css/feather.css">
        <link rel="stylesheet" type="text/css" href="files/css/style_.css">
        <link rel="stylesheet" type="text/css" href="files/css/pages_.css">
        <link rel="stylesheet" type="text/css" href="files/css/waves.min.css">
        <meta name="keywords" content="fintrex,fintrexfinance,finance,cms">
        <meta name="author" content="bvs">
        <link rel="icon" href="files/images/logo1.ico" type="images/x-icon">
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />

    </head>
    <body class="" style="background-color: #42a5f5;">
        <section class="login-block">

            <form id="otpForm" method="post">
                <div class="auth-box card">
                    <div class="card-block">
                        <!-- Input field for OTP -->
                        <label for="otp">Enter OTP:</label>
                        <input type="text" id="otp" name="otp" required>

                        <!-- Submit button -->
                        <button type="submit">Submit OTP</button>
                    </div>
                </div>
            </form>
        </section>
        <script type="text/javascript" src="files/jquery/js/jquery.min.js"></script>
        <script type="text/javascript" src="files/js/popper.min.js"></script>
        <script type="text/javascript" src="files/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="files/js/jquery.slimscroll.js"></script>
        <script src="files/js/waves.min.js" defer=""></script>
        <script src="files/js/common-pages.js" defer=""></script>

        <script>
            $(document).ready(function () {
                $('#otpForm').submit(function (event) {
                    // Prevent the default form submission
                    event.preventDefault();

                    // Get the OTP input value
                    var otp = $('#otp').val();

                    // Construct the URL with the OTP as a query parameter
                    var url = 'reset-validate?code=' + encodeURIComponent(otp);

                    // Redirect to the URL
                    window.location.href = url;
                });
            });
        </script>



    </body>
</html>
