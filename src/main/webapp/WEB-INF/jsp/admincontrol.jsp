<%-- 
    Document   : admincontrol
    Created on : Aug 28, 2023, 8:39:56 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">        
        <link href="assets/css/style_kasun.css" rel="stylesheet">
        <link rel="shortcut icon" href="https://bvs.org/sites/all/themes/bluemasters/favicon.ico" type="image/vnd.microsoft.icon" />

        <title>BVS - Admin Dashboard</title>
        <link rel="icon" href="files/images/logo1.ico" type="images/x-icon">

    </head>
    <body>
        <%@include file="jspf/nav.jspf" %>
        <style>

            .pagetitle {
                margin-bottom: 10px;
                margin-top: -37px;
                margin-bottom: -59px;
            }

            .pagetitle h1 {
                font-size: 28px;
                margin-bottom: 0;
                font-weight: 600;
                color: #31d422;
            }
            .placeholder {
                display: inline-block;
                min-height: 1em;
                vertical-align: middle;
                cursor: pointer;
                background-color: transparent;
                opacity: 2;
                /* color: #0077ff; */
                font-weight: 600;
                font-size: 12px;
            }

            .allFontByCustomerEdit{
                font-size: 14px;
                color:#464242;
                font-weight: 600;
            }


            .allFontToComplaintViewPage{

                font-size: 14px;
                color: #020202;
                font-weight: 800;

            }



        </style>





        <section class="section">

            <div class="row">
                <style>
                    body {
                        background-color: #f9f9fa
                    }

                </style>


                <div class="row" style="justify-content: center;">
                    <div class="pagetitle" style=" padding-left: 5rem;padding-top: 4rem "><h1>Admin Dashboard</h1>
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="home">Home</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a >Admin</a> 
                                </li>

                            </ol>
                        </nav>
                    </div>
                    <div class="row d-flex align-items-center justify-content-center" id="sysss" style="margin-top: 3rem;">

                    </div>
                    <!--                    <div class="row d-flex align-items-center justify-content-center" id="sysss" style="margin-top: 3rem;">
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Staff</h5> 
                                                        <p class="card-text">Update Staff,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="staff" style="position: absolute;bottom: 1rem">Update Staff</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Dhamma School Syllabus</h5> 
                                                        <p class="card-text">Update Dhamma School Syllabus,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="syllabus" style="position: absolute;bottom: 1rem">Update Syllabus</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Dhamma Resources</h5> 
                                                        <p class="card-text">Update Dhamma Resources,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="resource" style="position: absolute;bottom: 1rem">Update Dhamma Resources</button>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Forms</h5> 
                                                        <p class="card-text">Update Forms,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="forms" style="position: absolute;bottom: 1rem">Update Forms</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update School Calendar</h5> 
                                                        <p class="card-text">Update School Calendar,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="schCal" style="position: absolute;bottom: 1rem">Update School Calendar</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Users</h5> 
                                                        <p class="card-text">Update Users,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="users" style="position: absolute;bottom: 1rem">Update Users</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Newsletters</h5> 
                                                        <p class="card-text">Update Newsletters,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="letter" style="position: absolute;bottom: 1rem">Update Newsletters</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6 "style="width: 25rem;margin-top: 1rem;">
                                                <div class="card" style="height: 12rem">
                                                    <div class="card-body">
                                                        <h5 class="card-header">Update Team Members</h5> 
                                                        <p class="card-text">Update Team Members,Please go through below button</p>
                                                        <button class="btn btn-primary updateButton" data-target="team" style="position: absolute;bottom: 1rem">Update Team Members</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->


                </div>


            </div>

        </section>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <%@include file="jspf/scripts.jspf" %>
        <script type="text/javascript" src="files/js/slimselect.js"></script>
        <script type="text/javascript" src="files/js/datatables.min.js"></script>
        <script type="text/javascript" src="files/js/sweetalert2.js"></script>
        <script type="text/javascript" src="files/js/func.js"></script>
        <script type="text/javascript" src="files/js/autoNumeric.js"></script>
        <script type="text/javascript" src="files/js/dataTables.responsive.min.js"></script>
        <script>
        </script>
        <script>
            fetch('user/page-access')
                    .then(res => res.json())
                    .then(data => {
                        console.log(data);

                        for (var i = 0; i < data.length; i++) {
                            var card = '<div class="col-6 "style="width: 25rem;margin-top: 1rem;"><div class="card" style="height: 12rem"><div class="card-body"><h5 class="card-header">' + data[i].name + '</h5> <p class="card-text">Update ' + data[i].name + ',Please go through below button</p><button data-url="' + data[i].url + '" class="btn btn-primary updateButton" style="position: absolute;bottom: 1rem">Update ' + data[i].name + '</button></div></div></div>';
                            $('#sysss').append(card);
                        }

                        // Add click event listener to the buttons
                        $('.updateButton').click(function () {
                            var url = $(this).data('url');
                            window.location.href = url;
                        });
                    });




        </script>
        <!--        <script>
                    // Add event listener to all update buttons
                    document.querySelectorAll('.updateButton').forEach(function (button) {
                        button.addEventListener('click', function () {
                            // Get the target value from the data-target attribute
                            var target = this.getAttribute('data-target');
                            // Redirect to the corresponding JSP page based on the target value
                            switch (target) {
                                case 'staff':
                                    window.location.href = 'Admin-Staff';
                                    break;
                                case 'syllabus':
                                    window.location.href = 'Admin-Syllabus';
                                    break;
                                case 'resource':
                                    window.location.href = 'Admin-Videos';
                                    break;
                                case 'forms':
                                    window.location.href = 'Admin-Form';
                                    break;
                                case 'schCal':
                                    window.location.href = 'Admin-School-Calendar';
                                    break;
                                case 'users':
                                    window.location.href = 'Admin-User';
                                    break;
                                case 'letter':
                                    window.location.href = 'Admin-NewsLetters';
                                    break;
                                case 'team':
                                    window.location.href = 'Admin-OurTeam';
                                    break;
        
                                default:
        
                            }
                        });
                    });
                </script>-->

    </body>
</html>
