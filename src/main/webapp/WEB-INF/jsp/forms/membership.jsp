

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>BVS | Membership Form</title>
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
        </style>
    </head>
    <body>
        <%@include file="../jspf/navbar.jspf" %>

        <div class="title-bg">
            <div class="container-s">
                <div class="container_12">
                    <div class="grid_12">
                        <h1 class="title">Membership Form</h1>
                    </div>
                </div> 
            </div>

        </div>
        <div class="background-image"></div>
        <div class="para" >

            <p>
                Family Membership - $150<br>
                Ordinary Membership - $100<br>
                Student membership $50<br><br>
                Life - Single - $2,000<br>
                Life - Family - $3,000
            </p>
            <p style="font-weight: 900;">
                All PAP members who have contributed $30 or more per month as well as those who paid Lump 
                Sum donation of $360 or more in Lieu of monthly PAP, will have their membership automatically renewed.
            </p>
            <p>
                All other PAP donors who have paid $30 per month or more as well as those who paid Lump Sum 
                donation of $360 or more in Lieu of monthly PAP are eligible to apply for membership free of charge.
            </p>
            <button id="downloadButton" type="button" class="btn btn-primary">Download Membership Application</button>

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
        <script>
            document.getElementById("downloadButton").addEventListener("click", function () {
                window.open("assets/img/APPLICATION_FOR_BVS_MEMBERSHIP_Rev_1.pdf", "_blank");
            });
        </script>
    </body>
</html>


