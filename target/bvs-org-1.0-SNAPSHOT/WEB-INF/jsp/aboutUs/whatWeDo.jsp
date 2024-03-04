
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BVS | What We Do</title>
        <link rel = "stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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


        <div class="container-s">
            <div class="container_12">
                <div class="grid_12">
                    <h1 class="title">What We Do</h1>
                </div>
            </div> 
        </div>

        <div class="background-image"></div>
        <div class="para">
            <p>
                Registered under the Canadian Charities Act, Buddhist Vihara Society in BC, 
                Reg#89234 2775RT0001,  (BVS) is an organization which provides various charitable services to the Canadian 
                Society and to other communities who are in need of help. For over twenty years (20 years) BVS has provided and helped in 
                various ways to fellow Canadians and other communities around the world such as earth quake victims of Nepal, flood victims of Sri Lanka, 
                fellow Canadians who were affected by wild fire in Fort Mc Murray, Alberta, just to name a few.
            </p>
            <p>
                Our main funding source is the generous support by our members and well wishers by way of cash donations , 
                volunteer labour contribution and various fund raising events held throughout the year.
            </p>
            <p>Our main activities include:
            </p>
            <ul>
                <li>Organizing fund raising events to support various communities in need of help</li>  
                <li>Operating a Sunday School for kids from grade 1 to 10</li>
                <li>Counselling services for members</li>
                <li>Organize and participate in various cultural activities with other communities in the province
                    of British Columbia and across the country</li>
                <li>Maintain an organic community garden to promote the green concept</li>
                <li>Organize public speeches on various topics such as promoting peace and harmony, compassion based
                    predominantly on Buddhist teachings and philosophy etc.</li>
                <li>Organize retreats and meditation programs for those who seek inner-peace</li>
            </ul>
            <p></p>
            <p>All of the above activities are provided for free and by donation.
            </p>
            <p>Fundamental value of  BVS is to always promote peaceful co-existence among members and other 
                communities through volunteer work and spiritual guidance. This principle is the main reason for the very 
                existence of BVS for over twenty years and many more years to come. This is achieved with many thanks to dedicated
                members and board members of BVS who are responsible for the management of the Buddhist Vihara Society in BC.
            </p>
            <p>As good Canadian citizens we all have a duty to spare a few hours of our busy life in helping our 
                fellow citizens who are in need of help. In line with that great thought, BVS welcome all those who wish to 
                join our effort to promote mutual support and respect, uplifting livelihood of our fellow citizens and friends in need. 
                So, please join us to give a helping hand to fellow citizens, brothers and sisters.
            </p>
            <p>You can help them by way of cash donations or by volunteering your valuable time. 
                All cash donations over $20 will be issued a Tax Receipt. All volunteers may use their volunteer 
                time spent with BVS for prospecting new job opportunities in their respective career path. 
            </p>
            <p>For inquiries, use appropriate e-mail links below and all inquiries will be answered as soon as possible.
            </p>

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
