

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>BVS | Projects & Events</title>
        <link rel = "stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <style>
            .para {
                font-family: 'Poppins', sans-serif;
                font-size: 1rem;
                padding-left: 15em;
                padding-right: 15em;
                text-align: justify;
                padding-top: 2em;
                padding-bottom: 2em;
            }
            .container-s {
                background-color: #E5E5E5;
                padding-left: 20em;
                padding-top :0.1em;
                padding-bottom: 0.1em;
                font-family: 'Merriweather', serif;
                color: #1968B1;

            }
            .title {
                font-size: 2rem;
                margin: 0; /* Remove any default margins */
            }
            .background-image {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('assets/img/lotus.png'); /* Replace 'your-photo.jpg' with the path to your image */
                background-size: cover; /* Ensures the image covers the entire background */
                background-position: center; /* Centers the image */
                opacity: 0.2;
                z-index: -1;/* Adjust the opacity value as needed (0.0 to 1.0) */
            }
            .a{
                text-decoration: none;
                color: black;
                font-size: 1.1rem;
            }
            .blur-background {
                filter: blur(5px);
                -webkit-filter: blur(5px);
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Adjust the opacity as needed */
                z-index: 9999; /* Ensure it's on top of everything */
                display: none; /* Initially hidden */
            }

            /* Modal */
            .modal {
                display: none; /* Hidden by default */
                position: fixed;
                z-index: 10000; /* Ensure it's on top of the blurred background */
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.8);
            }

            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 800px; /* Adjust as needed */
                position: relative;
                z-index: 10001; /* Ensure it's above the blurred background and other content */
            }

            .close {
                color: #ffffff;
                position: absolute;
                top: 10px;
                right: 20px;
                font-size: 30px;
                font-weight: bold;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="jspf/navbar.jspf" %>

        <div class="title-bg">
            <div class="container-s">
                <div class="container_12">
                    <div class="grid_12">
                        <h1 class="title">Support Us</h1>
                    </div>
                </div> 
            </div>

        </div>
        <div class="background-image"></div>

        <div class="para" >

            <h4 style="color: #417CE8;font-weight: 900;">By being a member</h4>
            <p>
                We request that anyone who requires the services of our society to become a member.<br>
                In order to become a member please download the membership form <a id="member" style="color: #1968B1;font-weight: 900;cursor: pointer;">HERE</a>
            </p>
            <h4 style="color: #417CE8;font-weight: 900;">By signing up for a Pre-Authorized Payment Plan</h4>
            <p>

                Additionally to being a member of the society, one can support us by signing up for a monthly 
                Pre-Authorized Payment plan by downloading the PAP form <a id="plan" style="color: #1968B1;font-weight: 900;cursor: pointer;">HERE</a>
            </p>
            <h4 style="color: #417CE8;font-weight: 900;">By making a Donation</h4>
            <p>
                Apart from the above two methods, individuals can make a donation to the society.<br>
                We  encourage donations to be made out by cheque to the <strong>'Buddhist Vihara Society in BC'</strong> and mailed by registered post to the following address;
            </p>

            <p>
                <strong>Treasurer</strong><br>
                <strong>Buddhist Vihara Society in BC</strong><br>
                <strong>18941, 80th Avenue</strong><br>
                <strong>Surrey, BC</strong><br>
                <strong>V4N 4J1</strong>
            </p>
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
                <input name="cmd" type="hidden" value="_donations" />
                <input name="business" type="hidden" value="treasurer@bvs.org" />
                <input name="lc" type="hidden" value="US" />
                <input name="item_name" type="hidden" value="BVS" />
                <input name="no_note" type="hidden" value="0" />
                <input name="currency_code" type="hidden" value="CAD" />
                <input name="bn" type="hidden" value="PP-DonationsBF:donate.png:NonHostedGuest" />
                <input alt="PayPal - The safer, easier way to pay online!" border="0" name="submit" src="assets/img/paypal.png" type="image" />
                <img alt="" border="0" height="1" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" />
            </form>
        </div>
    </div>


    <%@include file="jspf/footer.jspf" %>
    <%@include file="jspf/scripts.jspf" %>
    <script type="text/javascript" src="files/js/slimselect.js"></script>
    <script type="text/javascript" src="files/js/datatables.min.js"></script>
    <script type="text/javascript" src="files/js/sweetalert2.js"></script>
    <script type="text/javascript" src="files/js/func.js"></script>
    <script type="text/javascript" src="files/js/autoNumeric.js"></script>
    <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="files/js/jquery.highlight.js"></script>
    <script type="text/javascript" src="files/js/dataTables.searchHighlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script></script>
    <script>
        document.getElementById("member").addEventListener("click", function (event) {
            event.preventDefault(); // Prevent default link behavior
            window.open("assets/img/APPLICATION_FOR_BVS_MEMBERSHIP_Rev_1.pdf", "_blank"); // Replace "path_to_your_file" with the actual URL or path to your file
        });
        document.getElementById("plan").addEventListener("click", function (event) {
            event.preventDefault(); // Prevent default link behavior
            window.open("assets/img/PreAuthorizedPayment Form.pdf", "_blank"); // Replace "path_to_your_file" with the actual URL or path to your file
        });


    </script>
</body>
</html>


