<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BVS | Vegetable Ordering</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <style>
            .para {
                font-family: 'Poppins', sans-serif;
                font-size: 1rem;
                padding: 2em 15em; /* Adjust padding */
                text-align: justify;
                position: relative;
            }

            .responsive-iframe {
                position: relative;
                width: 100%;
                height: 100vh; /* Adjust the height as needed */
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
                z-index: -1; /* Adjust the opacity value as needed (0.0 to 1.0) */
            }

            @media only screen and (max-width: 768px) {
                /* Adjust styles for smaller screens */
                .para {
                    padding: 2em 1em; /* Adjust padding for smaller screens */
                }
                .container-s {
                    padding-left: 1em;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="../jspf/navbar.jspf" %>

        <div class="title-bg">
            <div class="container-s">
                <div class="container_12">
                    <div class="grid_12">
                        <h1 class="title">Vegetable Ordering</h1>
                    </div>
                </div> 
            </div>
        </div>
        <div class="background-image"></div>
        <div class="para" >
            <p style="font-weight: 500;">
                Please place your request for vegetable boxes and vegetable here before 6pm on the day prior to the expected collection/delivery day 
            </p>
            <p>
                We have following vegetables available for coming Saturday and Sunday starting from 11am on both days.<br>

                A vegetable box with following six vegetables will be available and the weight of the box will be 1kg approx.
            </p>
            <p style="color: red;font-weight: 600;">
                Collard, Black & Green Kale, Beet,  Swiss chard, Zucchini, Capsicum, Pennywort & Beans
            </p>
            <p>
                You will be also able to get above vegetables individually as you wish. While quantities last only.<br>

                If you wish to get individual vegetables that are available from the list above, please ensure you provide that details in "Other Requests" below<br>

                Please note that your payment for vegetables is by donation only. You can donate cash or do an e-transfer to treasurer@bvs.org
            </p>
        </div>
        <div class="para">
            <!-- Your paragraph content here -->
            <iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdN9WFjxh-_o73GYb0ZVzWRS6MDPjQkY_PzWeHqwowinTJ-fg/viewform?embedded=true" class="responsive-iframe" frameborder="0">Loading…</iframe>
        </div>

        <%@include file="../jspf/footer.jspf" %>
        <%@include file="../jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="files/js/jquery.highlight.js"></script>
        <script type="text/javascript" src="files/js/dataTables.searchHighlight.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    </body>
</html>
