

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            @media only screen and (max-width: 768px) {
                /* Adjust styles for smaller screens */
                .para {
                    padding-left: 1em;
                    padding-right: 1em;
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
                        <h1 class="title">BVS PROPERTY BEAUTIFYING & GARDEN ENHANCEMENT PROJECT</h1>
                    </div>
                </div> 
            </div>

        </div>
        <div class="background-image"></div>
        <div class="para" >

            <img src="assets/img/Garden_Project2.jpg" alt="Garden">

        </div>
        <div class="para" >

            <h3 style="color: #417CE8;font-weight: 900;">Community Garden</h3>
            <p>
                BVS community Garden has been an integral part of our community for many years. 
                Our devoted volunteers and members has spent hundreds of hours working on this garden. 
                It has helped the community a chance to engage in some farming and providing some quality vegetables and 
                fruits cultivated without using any chemicals. Through this, the temple was able to generate substantial amount of 
                income as donations for the produce bought by our community
            </p><br>
            <h3 style="color: #417CE8;font-weight: 900;">Need of the Project</h3>
            <p>
                For several years there has been requests form the membership and well-wishers to 
                enhance the appearance of the temple premises and better utilize the arming land. BVS board 
                of directors with the recommendations of community professionals prepared a plan to beautify the 
                garden and better utilize the property to provide an appealing look to the temple premises and convert 
                BVS garden to a revenue generating stream. 
            </p><br>
            <h3 style="color: #417CE8;font-weight: 900;">About the Project</h3>
            <p>
                This is a long term initiative with 3 major phases. We are currently in the phase 1<br>
                You can find the information about the project <a id="about" style="color: #1968B1;font-weight: 900;cursor: pointer;">HERE</a>
                <br>We are in Phase one now and through this page, BVS would like to give its members
                all the information about the project, current status and some memories of our journey 
                so far with some photo, videos, etc. You can also visit the Facebook page of "BVS Community Garden" 
                for news and information as things happen. To visit the Facebook page, please click  <a id="fb"  style="color: #1968B1;font-weight: 900;cursor: pointer;">HERE</a>
            </p><br>
            <h3 style="color: #417CE8;font-weight: 900;">Our Donors - Our Strength</h3>
            <p>

                This project wouldn't have made possible without the generous donations from our members and well-wishers.
                You can see the list of donors by clicking <a id="donor"  style="color: #1968B1;font-weight: 900;cursor: pointer;">HERE</a>
            </p><br>
            <h3 style="color: #417CE8;font-weight: 900;">What's Happening Now</h3>
            <p>
                Having setup all the vegetable bed boxes, we are currently in the process of planting the baby plants. 
                We started this activity in the last weekend of April. You can reserve a plot now for planting. <br>
                Below are some photos and videos taken when our members from Board of Directors of BVS and some volunteers from the community  
            </p><br>

            <div class="row">
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/1.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/1.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <video width="300" height="300" controls >
                                    <source src="assets/img/garden/2.mp4" type="video/mp4">
                                </video>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/3.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/3.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <video width="300" height="300" controls >
                                    <source src="assets/img/garden/4.mp4" type="video/mp4">
                                </video>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/5.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/5.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/6.jpg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/6.jpg')" />
                            </div>
                        </div>
                    </div>
                </div>
            </div><br>
            <div class="row">
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <video width="300" height="300" controls >
                                    <source src="assets/img/garden/7.mp4" type="video/mp4">
                                </video>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/8.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/8.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/9.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/9.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>
            </div><br>
            <div class="row">

                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/10.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/10.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/11.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/11.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="media-gallery-item">
                        <div class="gallery-thumb-outer">
                            <div class="gallery-thumb-inner">
                                <!-- Add onclick event to call openModal function -->
                                <img src="assets/img/garden/12.jpeg" width="300" height="300" title="View larger image" alt="View larger image" onclick="openModal('assets/img/garden/12.jpeg')" />
                            </div>
                        </div>
                    </div>
                </div>
            </div><br><br>
            <h3 style="color: #417CE8;font-weight: 900;">The Journey so far...</h3>
            <p>
                We started the project with an informative virtual townhall session to present the 
                proposed Garden Enhancement Project plan to our members and well-wishers. You can access the video of that townhall here
            </p>
            <p>
                With all the positive feedback, encouragement, support, guidance and most importantly the necessary funds from our community,
                we managed to start out project on a positive note. 
            </p>

            <p>
                On 13th of March at the auspicious time of 7.54am, a small ground breaking ceremony was held while 
                Venerable Sirinivasa and Venerable Somawansa blessed the initiation of this project.
            </p>
            <div class="media-gallery-item">
                <div class="gallery-thumb-outer">
                    <div class="gallery-thumb-inner">
                        <!-- Add onclick event to call openModal function -->
                        <video width="300" height="300" controls >
                            <source src="https://video.fcmb10-1.fna.fbcdn.net/v/t42.1790-2/294775765_457691815893689_5082541380625288955_n.mp4?_nc_cat=103&ccb=1-7&_nc_sid=55d0d3&efg=eyJybHIiOjU0MSwicmxhIjo1MTIsInZlbmNvZGVfdGFnIjoic3ZlX3NkIn0%3D&_nc_ohc=CY5iX8KG--EAX8qcaO1&rl=541&vabr=301&_nc_ht=video.fcmb10-1.fna&edm=AGo2L-IEAAAA&oh=00_AfD9NzslxyFPAQ5auzVnZ-rVehvkuVvb3g9fVuf4jCxTKA&oe=65DB2A61" type="video/mp4">
                        </video>
                    </div>
                </div>
            </div><br>
            <p>
                Since the 13th March, the project team enthusiastically worked together, day and night to navigate through countless
                number of technical challenges, roadblocks and many issues arises when managing such projects. Despite all challenges, 
                it has been a wonderful, fun experience filled with determination, laughter and happiness from the day one
            </p>
            <p>
                Below are some memories of that journey
            </p>
        </div>
    </div>
    <div id="myModal" class="modal">
        <span class="close" onclick="closeModal()">&times;</span>
        <img id="modalImg" class="modal-content" src="">
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
    <script></script>
    <script>
            document.getElementById("about").addEventListener("click", function (event) {
                event.preventDefault(); // Prevent default link behavior
                window.open("assets/img/BVS_Garden_Enhancement_Project_Proposal_v3.0.pdf", "_blank"); // Replace "path_to_your_file" with the actual URL or path to your file
            });

            document.getElementById("fb").addEventListener("click", function (event) {
                event.preventDefault(); // Prevent default link behavior
                window.open("https://www.facebook.com/people/BVS-Community-Garden/100070866045686/", "_blank"); // Replace "path_to_your_file" with the actual URL or path to your file
            });
            document.getElementById("donor").addEventListener("click", function (event) {
                event.preventDefault(); // Prevent default link behavior
                window.open("assets/img/Garden_Project_Donor_List.pdf", "_blank"); // Replace "path_to_your_file" with the actual URL or path to your file
            });

            function openModal(src) {
                var modal = document.getElementById("myModal");
                var modalImg = document.getElementById("modalImg");
                modal.style.display = "block";
                modalImg.src = src;
                document.body.style.overflow = "hidden"; // Disable scrolling on the background content
            }

            // Function to close the modal
            function closeModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
                document.body.style.overflow = ""; // Enable scrolling on the background content
            }
    </script>
</body>
</html>


