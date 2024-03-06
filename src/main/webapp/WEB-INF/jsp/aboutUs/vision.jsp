<%-- 
    Document   : whatWeDo
    Created on : 9 Feb 2024, 8:02:01 am
    Author     : Chirantha Prasad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BVS | Vision|Mission</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <link rel = "stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
                        <h1 class="title">Vision & Mission</h1>
                    </div>
                </div> 
            </div>

        </div>
        <div class="background-image"></div>
        <div class="para">
            <p style="color: #666666;font-size: 1.3rem;font-weight: 600;">
                Our Vision
            </p>
            <p>Since establishment in January 1990, it is the vision of the Buddhist Vihara 
                Society of British Columbia to manage and maintain a place where Budda, Dhamma and Sangha
                reside for the benefit of everybody seeking:
            </p>
            <ul>
                <li>Comfort and compassion under the noble triple gem</li>  
                <li>Guidance for Spiritual Nourishment including meditational practice according to the path shown by Lord Budda</li>
                <li>To learn from the teachings of the Lord Buddha</li>
                <li>Opportunity to perform ‘Dhana’, ‘Sila’ and ‘Bhavana’</li>
                <li>To obtain guidance and councelling from Buddhist monks</li>
                <li>To meet with Buddhist monks and lay friends with similar ideas, engage in useful discussions and exchange ideas to
                    live a peaceful and successful life and help each other</li>
                <li>To show their children the values of Buddha’s teachings and through that provide them with guidance 
                    to achive success and lead a peaceful life.</li>
            </ul>


        </div>
        <div class="para">
            <p style="color: #666666;font-size: 1.3rem;font-weight: 600;">
                Our Mission
            </p>
            <p>BVS is committed to fulfill its Vision through the actions as mentioned but not limited to the following:
            </p>
            <ul>
                <li>Maintain the Buddhist Vihara premises in a pleasant, serene and peaceful status with a meditation
                    hall accessible for everyone to seek refuge in Dhamma 
                    with guidance and blessings of the resident monks.</li>
                <li>Maintain the Buddhist Vihara premises as a livable, safe and secured place for the Resident monks and provide 
                    them with necessary means to dwell in and practice Dhamma preached by the Buddha.</li>
                <li>Organize and conduct regular and special religious activities and functions enabling everyone who wish to attend and participate.</li>
                <li>Organize and conduct weekly meditation sessions.</li>
                <li>Organize and conduct Daham Pasala (summer school holiday period excluded) to teach Dhamma and Buddhist way of life to all the children who wish to attend.</li>
                <li>Manage and maintain Buddhist Vihara Society of BC (BVS) as 
                    a charitable organization dedicated to Dhamma and spiritual & mind development.
                </li>
                <li>Continue to maintain the Buddhist Vihara as a counseling and spiritual service centre for the community.
                </li>
                <li>Organize volunteer work and participate in joint-activities with the other sections of the community.
                </li>
                <li>Maintain and update a library at Vihara premises holding selected collection of Buddhist literature, Sutras, guidance for meditation, Dhammapada, Encyclopedia of Buddhism etc.
                </li>
                <li>Encourage youth to take part and lead the activities of BVS.
                </li>
            </ul>


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
