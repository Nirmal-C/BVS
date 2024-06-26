

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BVS | Staff </title>
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
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
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
            /* Style for the table */
            .table {
                width: 100%;
                border-collapse: collapse; /* Collapse border spacing */
            }

            /* Style for table header */
            .table thead th {
                background-color: #1968B1;
                color: white;
                font-weight: bold;
                padding: 10px;
                text-align: left;
                border-bottom: 2px solid #ccc; /* Bottom border for table header */
                border-right: 1px solid #ccc; /* Right border for table header cells */
            }

            /* Style for table body */
            .table tbody td {
                padding: 10px;
                border-bottom: 1px solid #ccc; /* Bottom border for table body */
                border-right: 1px solid #ccc; /* Right border for table body cells */
            }

            /* Style for alternating row background color */
            .table tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            /* Hover effect */
            .table tbody tr:hover {
                background-color: #ddd;
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
                        <h1 class="title">Staff</h1>
                    </div>
                </div> 
            </div>

        </div>
        <div class="background-image"></div>
        <div class="para">


            <p>
                The following is the current assembly of teachers for the Dhamma School
            </p>
            <p style="font-weight: 900;">
                Principal : Rev M. Saranapala
            </p>
            <p style="font-weight: 900;">
                Vice-Principal : Rev D. Somawansha
            </p>

            <div class="card" style="padding: 0.5rem; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);border-radius: 10px;">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Grade</th>
                                <th scope="col">Teacher(s)</th>
                                <th scope="col">Substitute Teacher(s)</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <tr>
                                <!-- Your table data goes here -->
                            </tr>
                        </tbody>
                    </table>  
                </div>
            </div>


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
            async function fetchDataAndPopulateTable() {
                try {
                    const response = await fetch('staff/details');
                    const data = await response.json();
                    const tableBody = document.getElementById('tableBody');

                    // Check if data is empty
                    if (!data || data.length === 0) {
                        throw new Error('No data available.');
                    }

                    // Clear existing table rows
                    tableBody.innerHTML = '';

                    // Populate table rows with fetched data
                    data.forEach(record => {
                        const row = document.createElement('tr');
                        const gradeCell = document.createElement('td');
                        const teacherCell = document.createElement('td');
                        const subTeacherCell = document.createElement('td');

                        gradeCell.textContent = record.grade;
                        teacherCell.textContent = record.teacher;
                        subTeacherCell.textContent = record.sub_teacher;

                        row.appendChild(gradeCell);
                        row.appendChild(teacherCell);
                        row.appendChild(subTeacherCell);

                        tableBody.appendChild(row);
                    });
                } catch (error) {
                    console.error('Error fetching data:', error);
                }
            }

// Call the function to fetch and populate data on page load
            window.onload = fetchDataAndPopulateTable;

        </script>
    </body>
</html>


