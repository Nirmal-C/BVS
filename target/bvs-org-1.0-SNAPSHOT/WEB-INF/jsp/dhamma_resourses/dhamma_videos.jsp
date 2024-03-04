<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BVS | Dhamma Videos</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
              crossorigin="anonymous">
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
                padding-top: 0.1em;
                padding-bottom: 0.1em;
                font-family: 'Merriweather', serif;
                color: #1968B1;

            }

            .title {
                font-size: 2rem;
                margin: 0;
                /* Remove any default margins */
            }

            .background-image {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('assets/img/lotus.png');
                /* Replace 'your-photo.jpg' with the path to your image */
                background-size: cover;
                /* Ensures the image covers the entire background */
                background-position: center;
                /* Centers the image */
                opacity: 0.2;
                z-index: -1;
                /* Adjust the opacity value as needed (0.0 to 1.0) */
            }

            .card-video {
                width: 50rem;
                background-color: #dec5b8;
                border-radius: 15px;
                margin-top: 1rem;
                padding: 0.5rem;
            }

            .container-c {
                display: none; /* Initially hide the container */
                /* Add any styles you need for the new container */
            }
        </style>
    </head>
    <body>
        <%@include file="../jspf/navbar.jspf" %>


        <div class="container-v " id="sysss" >
            <div class="title-bg">
                <div class="container-s">
                    <div class="container_12">
                        <div class="grid_12">
                            <h1 class="title">Dhamma Videos</h1>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="container-c" id="container-c">

            <div class="container">
                <button class="btn btn-outline-primary back-to-videos" style="margin-top: 1rem; margin-bottom: 1rem; border-radius: 10px;  font-size: 1.2rem;">Back To Dhamma Videos</button>
                <div class="row">

                </div>  
            </div>

        </div>

        <div class="background-image"></div>


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
            fetch('dhamma/attach-content')
                    .then(res => res.json())
                    .then(data => {
                        console.log(data);



                        for (var i = 0; i < data.length; i++) {
                            var card = '<div class="row justify-content-center mb-3" style="margin-top: 1rem;">' +
                                    '<div class="card-video">' +
                                    '<div class="row">' +
                                    '<div class="col-3">' +
                                    '<img src="assets/img/btn.gif" style="width: 60%" class="card-img" alt="...">' +
                                    '</div>' +
                                    '<div class="col-9">' +
                                    '<h2>' + data[i].heading + '</h2>' +
                                    '<button type="button" class="btn btn-outline-primary more-videos-btn" data-video-id="' + data[i].id + '">More Videos</button>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>';
                            $('#sysss').append(card);
                        }

                    });

            $(document).on('click', '.more-videos-btn', function () {

                $('.container-v').hide();

                $('.container-c').show();

                var videoId = $(this).data('video-id');
                fetch('dhamma/' + videoId)
                        .then(res => res.json())
                        .then(res => res.data)
                        .then(data => {
                            console.log("Data :", data);

                            $('.container-c .row').empty();


                            // Append the title background div
                            var titleBg = $('.container-c .title-bg');
                            if (titleBg.length === 0) {
                                // If it doesn't exist, create and prepend it
                                titleBg = $('<div class="title-bg">' +
                                        '<div class="container-s">' +
                                        '<div class="container_12">' +
                                        '<div class="grid_12">' +
                                        '<h1 class="title">' + data.content + '</h1>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>');
                                $('.container-c').prepend(titleBg);
                            }

                            // Loop through the videos array
                            for (var i = 0; i < data.videos.length; i++) {
                                var video = data.videos[i];

                                // Create the card HTML with the embedded video
                                var card = '<div class="col-6" style="margin-top: 1rem;">' +
                                        '<div class="card border-secondary">' +
                                        '<div class="card-header">' +
                                        '<h5>' + video.name + '</h5>' +
                                        '</div>' +
                                        '<div class="card-body text-secondary">' +
                                        video.link +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';

                                $('.container-c .row').append(card);
                            }




                            $('.container-c').show();
                        });



            });


            // Add click event listener to the "More Videos" button
            $(document).on('click', '.more-videos-btn', function () {
                // Hide the container-v
                $('.container-v').hide();
                // Show the container-c
                $('.container-c').show();
                // Here you can add any additional logic you need when the button is clicked
            });
            $(document).on('click', '.back-to-videos', function () {
                // Hide the container-c
                $('.container-c').hide();
                // Show the container-v
                $('.container-v').show();
                // Here you can add any additional logic you need when the button is clicked
            });

        </script>
    </body>
</html>
