
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />
        <title>BVS</title>
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico"
              type="image/vnd.microsoft.icon" />
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,300,700,100' rel='stylesheet' type='text/css'>
        <link rel = "stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    <body>
        <%@include file="jspf/navbar.jspf" %>

        <style>
            .a{
                style: unset !important;
                text-decoration: none !important;

            }


            .container_12 {
                max-width: 1282px;
                margin: 0 auto;
            }

            .grid_6 {
                width: calc(50% - 2%);
                float: left;
                margin-right: 4%;
                box-sizing: border-box;
            }

            .covid-image{
                width:100px;
                height:100px;
            }
            .alpha {
                margin-left: 0;
            }

            .omega {
                margin-right: 0;
            }


            .container_12::after {
                content: "";
                display: table;
                clear: both;
            }


            .home-block-area {
                background-color: #fff;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
                transition: box-shadow 0.3s ease;
            }

            .home-block-area:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
            }

            .content h2 {
                color: #333;
            }

            .content p {
                color: #555;
            }


            #banner {
                margin-top:30px;

            }

            .slider-item {
                margin-bottom: 20px;
            }


            @media screen and (max-width: 768px) {

                .grid_6 {
                    width: 100%;
                    margin-right: 0;
                }
            }
            .slideshow-pan {
                position: relative;
                /* Other styles for your slideshow container */
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
                opacity: 0.5;
                z-index: -1;/* Adjust the opacity value as needed (0.0 to 1.0) */
            }



        </style>



        <div class="slideshow-pan">
            <div class="background-image"></div>
            <div id="banner">
                <div class="container_12">
                    <!-- First Column -->
                    <div class="grid_6 alpha">
                        <div class="column-fix">
                            <!-- Row 1 -->
                            <div class="home-block-area first">
                                <div class="region region-home-area-2-left">
                                    <div id="block-block-32" class="block block-block">
                                        <div class="content">
                                            <h2><img alt="" src="assets/img/covid.png"
                                                     style="float:left; height:115px; margin-left:0px; margin-right:10px; width:130px" />BVS
                                                Health and Safety protocols for COVID - 19</h2>
                                            <p>Under the BC disease control, guidelines we have all had to make significant behavioral
                                                changes, and new safety procedures to reduce the spread of COVID-19. Hence all the BVS
                                                devotees....</p>
                                            <p><a href="assets/img/BVS-COVID-19-Final.pdf">READ MORE</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Row 2 -->
                            <div class="home-block-area">
                                <div class="region region-home-area-2-right">
                                    <div id="block-block-31" class="block block-block">
                                        <div class="content">
                                            <h2><img alt="" src="assets/img/garden.png"
                                                     style="float:left; height:110px; margin-left:0px; margin-right:20px; width:110px" />Town
                                                Hall Meeting - BVS Garden Beautification Project</h2>
                                            <p>We concluded a successful town hall meeting via Zoom on Saturday, the 19th December 2020
                                                from 6:00 pm to 7:00 pm and received very valuable comments and suggestions</p>
                                            <p>We still would like to receive your valuable comments and suggestions on this project</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="home-block-area">
                                <div class="region region-home-area-1">
                                    <div id="block-block-2" class="block block-block">
                                        <h2>Buddhist Vihara Society in BC</h2>
                                        <div class="content">
                                            <p>Registered under the Canadian Charities Act, Buddhist Vihara Society
                                                in BC, Reg#89234 2775RT0001, (BVS) is an organization that provides
                                                various charitable services to the Canadian Society and to other
                                                communities who are in need of help. For over twenty years (20
                                                years) BVS has provided and helped in various ways to fellow
                                                Canadians and other communities around the world such as earthquake
                                                victims of Nepal, flood victims of Sri Lanka, fellow Canadians who
                                                were affected by wildfire in Fort McMurray, Alberta, just to name
                                                a few. ...</p>
                                            <p><a class="readmore" href="What-We-Do">READ MORE</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Second Column -->
                    <div class="grid_6 alpha omega">
                        <div class="column-fix">
                            <!-- Row 1 (Moved from Row 3) -->
                            <div class="home-block-area">
                                <div class="region region-home-area-2">
                                    <div id="block-block-13" class="block block-block">
                                        <div class="content">
                                            <div class="home-links">
                                                <div class="dana-link content">
                                                    <a class="image" href="Dana-Calender"><img src="assets/img/calendar.png" name="Image3" width="220" height="170" border="0"></a>
                                                    <h3><a href="Dana-Calender">Dana Calendar</a></h3>
                                                    <p>All dana sponsors are kindly reminded to confirm your
                                                        dana arrangement two days (2) prior to the dana date by
                                                        calling the temple at 604.888.1162.</p>
                                                </div>
                                                <div class="suport-link content">
                                                    <a class="image" href="Support-Us"><img src="assets/img/support.png" name="Image2" width="170" height="170" border="0"></a>
                                                    <h3><a href="Support-Us">Support Us</a></h3>
                                                    <p>We request that anyone who requires the services of our
                                                        society become a member. In order to become a member,
                                                        please <a href="Membership"
                                                                  target="_blank">register</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Additional Row 3 (New) -->

                        </div>
                    </div>
                </div>
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
    </body>
</html>