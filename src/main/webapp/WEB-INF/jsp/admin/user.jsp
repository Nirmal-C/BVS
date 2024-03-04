<%-- 
    Document   : user
    Created on : 29 Feb 2024, 7:53:10 am
    Author     : Chirantha Prasad
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BVS | Users</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
                padding-left: 10em;
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

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }
            .card-registration .select-arrow {
                top: 13px;
            }
            .card{
                width: 90em;
                justify-content: center;
                margin: auto;

            }
            .pagetitle h3 {
                font-size: 28px;
                margin-bottom: 0;
                font-weight: 600;
                color: #31d422;
            }
            .ss-main .ss-single-selected .placeholder {
                background-color: white;
                color: black;
            }

            .nav-tabs .nav-item .nav-link {
                color: #000; /* Set the default text color for all tabs */
            }

            .nav-tabs .nav-item .nav-link:hover {
                background-color: #f8f9fa; /* Set the background color on hover for all tabs */
            }

            .nav-tabs .nav-item .nav-link.active {
                background-color: #4682b4; /* Set a darker background color for the active tab */
                color: #fff; /* Set the text color for the active tab */
            }

        </style>
    </head>
    <body>
        <%@include file="../jspf/header.jspf" %>

        <div class="tab-pane fade show active profile-overview" id="profile-overview">

            <div class="page-wrapper">
                <div class="page-body">

                    <div class="row" id="tableSection">
                        <div class="title-bg">
                            <div class="container-s">
                                <div class="container_12">
                                    <div class="grid_12">
                                        <h1 class="title">Users - Admin</h1>
                                    </div>
                                </div> 
                            </div>

                        </div>
                        <div class="card" >

                            <div class="card-block p-b-0">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered m-b-0" id="tbll">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th> 
                                                <th>Entered On</th>
                                                <th>Entered By</th>
                                                <th>Mod On</th>
                                                <th>Mod By</th>
                                                <th style="width:1px;">Status</th>
                                                <th style="width:1px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="text-right">
                                    <button id="addUserBtn" class="btn btn-sm waves-effect waves-light btn-danger"><i class="icon feather icon-plus"></i>Add User</button>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="" id="formSection" style="display: none">
                        <div class="card">
                            <div class="card-block p-b-0">
                                <div class="card-header">
                                    <div class="card-header-right">
                                        <ul class="list-unstyled card-option">
                                            <li><i class="feather icon-x cls-card"></i></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-12">
                                    <div class="form-group" style="width: 75rem">
                                        <label for="name">Please Enter the User;s Name Here<span class="text-danger">*</span></label>
                                        <input id="name" type="text" name="name" class="form-control"  required autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-group" style="width: 75rem">
                                        <label for="username">Please Enter the User's username Here<span class="text-danger">*</span></label>
                                        <input id="username" type="text" name="username" class="form-control"  required autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-group" style="width: 75rem">
                                        <label for="email">Please Enter the Users's email Here<span class="text-danger">*</span></label>
                                        <input id="email" type="text" name="email" class="form-control"  required autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-group" style="width: 75rem">
                                        <div class="card-footer d-flex justify-content-end">
                                            <button id="saveBtn" class="btn btn-sm waves-effect waves-light btn-primary"><i class="icon feather icon-save"></i>Save</button>
                                        </div>
                                    </div> 
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>




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



            $.fn.dataTable.ext.errMode = 'none';
            var dtable = $('#tbll').DataTable({
                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                "pageLength": 5,
                "ordering": true,
                "autoWidth": false,
                "processing": true,
                "serverSide": true,
                "order": [[0, "desc"]],
                "searchHighlight": true,
                "searchDelay": 350,
                "ajax": {
                    "url": "user/users",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        return JSON.stringify(d);
                    },
                    error: function (xhr, error, code) {
                        console.log(xhr);
                        console.log(code);
                    }
                },
                "columns": [
                    {"data": "id", className: "text-right", "visible": false},
                    {"data": "name"},
                    {"data": "ent_on"},
                    {"data": "ent_by"},
                    {"data": "mod_on"},
                    {"data": "mod_by"},
                    {"data": "status"}
                ], "language": {
                    'loadingRecords': '&nbsp;',
                    'processing': '<div class="loader2"></div>'
                },
                "createdRow": function (row, data) {
                    let action_td = document.createElement('td');
                    $(action_td).addClass('text-center');
                    if (data['status'] === 'deactivate') {
                        $(action_td).append('<a href="javascript:void(0)" class="rerec"><i class="feather icon-refresh-cw f-w-600 f-16 text-c-blue"></i></a>');
                    } else {
                        $(action_td).append('<a href="javascript:void(0)" id="update" class="editrec"><i class="icon feather icon-edit f-w-600 f-16 m-r-10 text-c-green"></i></a><a href="javascript:void(0)" class="delrec"><i class="feather icon-trash-2 f-w-600 f-16 text-danger"></i></a>');
                    }

                    $(row).append(action_td);
                    setTableStatus($(row).find('td').eq(5));
                    $(row).data('id', data['id']);
                }
            });
            function setTableStatus(td) {
                if ($(td).html().trim().startsWith('active')) {
                    $(td).html('<label class="label label-success" style="white-space: nowrap">Active</label>');
                } else if ($(td).html() === 'deactivate') {
                    $(td).html('<label class="label label-danger" style="white-space: nowrap">Deactivated</label>');
                }
            }


            $(document).on('click', '.editrec', function () {

                loadDiv($('#tableSection'));
                let id = $(this).parents('tr').data('id');
                fetch('user/update-user/' + id).then(resp => resp.json())
                        .then((data) => {
                            clearForm();

                            $('#name').val(data.name);
                            $('#username').val(data.username);
                            $('#email').val(data.email);
                            $('#saveBtn').data('mode', 'update');
                            $('#saveBtn').html('<i class="icon feather icon-save"></i>Update');
                            $('#saveBtn').data('id', id);
                            $('#formSection').fadeIn();
                            $('#tableSection').hide();
                            finishLoadDiv($('#tableSection'));
                        });
            });
            $(document).on('click', '.delrec', function () {
                let id = $(this).parents('tr').data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Will be Deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('user/deactivate-user', {
                            method: 'POST',
                            body: new URLSearchParams({
                                id: id
                            })
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()

                }).then((result) => {
                    if (result.value) {
                        if (result.value.status !== 200) {
                            Swal.fire('Error!', result.value.msg, 'error');
                        } else {
                            Swal.fire('Successfull!', 'User has been Deactivated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });
            $(document).on('click', '.rerec', function () {
                let id = $(this).parents('tr').data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "User Will be Activated!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('user/reactivate-user', {
                            method: 'POST',
                            body: new URLSearchParams({
                                id: id
                            })
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()

                }).then((result) => {
                    if (result.value) {
                        if (result.value.status !== 200) {
                            Swal.fire('Error!', result.value.msg, 'error');
                        } else {
                            Swal.fire('Successfull!', 'User has been Activated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });
            $('#addUserBtn').click(function () {
                $('#saveBtn').data('mode', 'save');
                $('#saveBtn').html('<i class="icon feather icon-save"></i>Save');
                clearForm();
                $('#tableSection').hide();
                $('#formSection').fadeIn();
            });
            $('.cls-card').click(function () {
                $('#formSection').hide();
                $('#tableSection').fadeIn();
            });
            function clearForm() {
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('select').each(function () {
                    if ($(this).data('select')) {
                        if ($(this).data('select').ajax) {
                            $(this).data('select').data.data = [];
                        }
                        $(this).data('select').set('');
                    }
                });
            }

            $('#saveBtn').click(function () {
                // Prepare the data to send in the request body
                var userData = {
                    id: $('#saveBtn').data('id'),
                    name: $('#name').val(),
                    username: $('#username').val(),
                    email: $('#email').val()
                };

                // Send the fetch request
                fetch((($('#saveBtn').data('mode') === 'save') ? 'user/save-user' : 'user/update-user'), {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json' // Set the Content-Type header to indicate JSON data
                    },
                    body: JSON.stringify(userData) // Convert the data object to JSON format
                })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            } else {
                                Swal.fire('Successfull!', 'User has been successfully saved');
                                clearForm();
                                $('#formSection').hide();
                                $('#tableSection').fadeIn();
                                dtable.ajax.reload();
                            }
                            return response.json();
                        })
                        .catch(error => {
                            // Handle error
                            console.error('Error:', error);
                        });
            });








//            $('#saveBtn').click(function () {
//
//                return fetch((($('#saveBtn').data('mode') === 'save') ? 'user/save-user' : 'user/update-user'), {
//                    method: 'POST',
//                    body: new URLSearchParams({
//                        id: $('#saveBtn').data('id'),
//                        name: document.getElementById('name').value,
//                        username: document.getElementById('username').value,
//                        email: document.getElementById('email').value,
//                    })
//                }).then(response => {
//                    if (!response.ok) {
//                        throw new Error(response.statusText);
//                    } else {
//                        Swal.fire('Successfull!', 'User has been successfully saved');
//                        clearForm();
//                        $('#formSection').hide();
//                        $('#tableSection').fadeIn();
//                        dtable.ajax.reload();
//                    }
//                    return response.json();
//                });
//            });

            $.fn.dataTable.Debounce = function (table) {
                var tableId = table.settings()[0].sTableId;
                $('.dataTables_filter input[aria-controls="' + tableId + '"]')
                        .unbind()
                        .bind('input', (delay(function (e) {
                            table.search($(this).val()).draw();
                            return;
                        }, 500)));
            };
            function delay(callback, ms) {
                var timer = 0;
                return function () {
                    var context = this, args = arguments;
                    clearTimeout(timer);
                    timer = setTimeout(function () {
                        callback.apply(context, args);
                    }, ms || 0);
                };
            }

            var debounce = new $.fn.dataTable.Debounce(dtable);



//            document.getElementById('save_whistle_btn').addEventListener('click', function () {
//
//                var whistleDescription = document.getElementById('whistle_field').value;
//
//
//                var employeeName = document.getElementById('emp_namewi').innerText;
//                var department = document.getElementById('departmentwi').innerText;
//
//
//                $.ajax({
//                    type: 'POST',
//                    url: 'whistle/submitWhistle',
//                    contentType: 'application/json',
//                    data: JSON.stringify({
//                        employeeName: employeeName,
//                        department: department,
//                        whistleDescription: whistleDescription
//                    }),
//                    success: function (response) {
//                        alert(response);
//                    }
//                });
//            });
        </script>
    </body>
</html>


