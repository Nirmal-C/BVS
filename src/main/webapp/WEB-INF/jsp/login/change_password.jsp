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
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />
    </head>
    <body class="" style="background-color: #42a5f5;">
        <section class="login-block">

            <form id="changePasswordForm" method="post">
                <div class="auth-box card">
                    <div class="card-block">
                        <!-- First password input field -->
                        <label for="password1">Enter New Password:</label>
                        <input type="password" id="password1" name="password1" required>

                        <!-- Second password input field -->
                        <label for="password2">Confirm New Password:</label>
                        <input type="password" id="password2" name="password2" required>

                        <!-- Submit button -->
                        <button type="submit">Change Password</button>
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
                $('#changePasswordForm').submit(function (event) {
                    // Prevent the default form submission
                    event.preventDefault();

                    // Get the password input values
                    var password1 = $('#password1').val();
                    var password2 = $('#password2').val();

                    // Check if passwords match
                    if (password1 !== password2) {
                        alert("Passwords do not match. Please try again.");
                        return;
                    }

                    // If passwords match, send the password via Fetch
                    var formData = new FormData();
                    formData.append('password', password2);

                    fetch('changepw', {
                        method: 'POST',
                        body: formData
                    })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Failed to change password');
                                }
                                // Display success message
                                alert('Password changed successfully');
                                // Redirect to home JSP
                                window.location.href = 'bvsAdmin-Login';
                            })
                            .catch(error => {
                                // Handle error response if needed
                                console.error('Error:', error);
                                // For example, you can display an error message to the user
                                alert('Failed to change password. Please try again.');
                            });
                });
            });

        </script>

    </body>
</html>
