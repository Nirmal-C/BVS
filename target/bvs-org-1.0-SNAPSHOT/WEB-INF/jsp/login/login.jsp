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

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <form class="md-float-material form-material">
                            <div class="text-center">
                                <img src="https://bvs.org/sites/default/files/logo_0.png" width="200" alt="logo.png">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">


                                    <p class="text-muted text-center p-b-5">Sign in with your Login Details</p>
                                    <div id="altarea"></div>
                                    <div class="form-group form-primary">
                                        <input type="text" id="username" name="user-name" class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Username</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" id="password" name="password" class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Password</label>
                                    </div>

                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="button" id="loginbtn" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
                                        </div>
                                    </div>
                                    <div style="text-align: center;">
                                        <a style="cursor: pointer;" href="Reset-Password">Forgot Password?</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </section>
        <script type="text/javascript" src="files/jquery/js/jquery.min.js"></script>
        <script type="text/javascript" src="files/js/popper.min.js"></script>
        <script type="text/javascript" src="files/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="files/js/jquery.slimscroll.js"></script>
        <script src="files/js/waves.min.js" defer=""></script>
        <script src="files/js/common-pages.js" defer=""></script>
        <script>

            function loadDiv(card) {
                var $this = $(card);
                $this.addClass("div-load");
                $this.append('<div class="div-loader"><i class="loader2"></div>');
            }

            function finishLoadDiv(card) {
                var $this = $(card);
                $this.children(".div-loader").remove();
                $this.removeClass("div-load");
            }

            $('#loginbtn').click(function () {
                var username = $('#username').val();
                var password = $('#password').val();

                // Basic input validation
                if (!username || !password) {
                    $('#altarea').html('<div class="alert alert-danger alert-dismissible">' +
                            '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>' +
                            '<strong>Error!</strong> Please enter both username and password.' +
                            '</div>');
                    return;
                }

                $.post('login', {username: username, password: password}, function (data) {
                    if (data === "ok") {
                        window.location.href = 'Admincontrol';
                    } else if (data === "locked") {
                        $('#altarea').html('<div class="alert alert-danger alert-dismissible">' +
                                '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>' +
                                '<strong></strong> Your Account is Locked !, Please Contact an Admin' +
                                '</div>');
                    } else {
                        $('#altarea').html('<div class="alert alert-danger alert-dismissible">' +
                                '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>' +
                                '<strong>Error!</strong> Invalid Username or Password' +
                                '</div>');
                    }
                }).fail(function () {
                    $('#altarea').html('<div class="alert alert-danger alert-dismissible">' +
                            '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>' +
                            '<strong>Error!</strong> Something Went Wrong!' +
                            '</div>');
                });
            });

            $('#password').on('keypress', function (e) {
                if (e.which === 13) {
                    $('#loginbtn').click();
                }
            });
        </script>
    </body>
</html>
