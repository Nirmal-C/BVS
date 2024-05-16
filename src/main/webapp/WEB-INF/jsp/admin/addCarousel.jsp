

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BVS | Dhamma Carousel</title>
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

            @media only screen and (max-width: 449px) {
                /* Adjust styles for smaller screens */
                .para {
                    padding-left: 1em;
                    padding-right: 1em;
                }
                .container-s {
                    padding-left: 1em;
                }
                .form-group{
                    width: 20rem;
                }


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
                                        <h1 class="title">Dhamma Carousel - Admin</h1>
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
                                                <th>Grade</th>
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
                                    <button id="addCarouselBtn" class="btn btn-sm waves-effect waves-light btn-danger"><i class="icon feather icon-plus"></i>Add Carousel</button>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="" id="formSection" style="display: none">
                        <div class="card">
                            <div class="card-block p-b-0">
                                <div class="card-header">
                                    <div class="card-header-left">
                                        <ul class="list-unstyled card-option">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label for="heading">Please Enter Heading Here<span class="text-danger">*</span></label>
                                        <input id="heading" type="text" name="heading" class="form-control"  required autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label for="heading">Please Enter Content Here<span class="text-danger">*</span></label>
                                        <textarea id="para" type="text" name="para" class="form-control"  required autocomplete="off"></textarea>
                                    </div>
                                </div>




                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group" >
                                        <label for="file">Upload Your File Here<span class="text-danger">*</span></label>
                                        <input id="file" type="file" >
                                        <div class="card-footer d-flex justify-content-end">
                                            <button id="saveBtn" class="btn btn-sm waves-effect waves-light btn-primary"><i class="icon feather icon-save"></i>Save</button>
                                        </div>
                                    </div>



                                    <div class="col-lg-6 col-md-12 ">

                                    </div> 
                                </div>
                            </div>
                        </div></div>
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
                    "url": "carousel/carousels",
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
                    {"data": "heading"},
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



            $(document).on('click', '.delrec', function () {
                let id = $(this).parents('tr').data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This Carousel Will be Deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('carousel/deactivate-carousel', {
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
                            Swal.fire('Successfull!', 'Carousel has been Deactivated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });



            $(document).ready(function () {
                // Add click event handler to both close buttons
                $(' .close').click(function () {
                    $('#formSection').hide();
                    $('#tableSection').fadeIn();
                });
            });
            $(document).on('click', '.rerec', function () {
                let id = $(this).parents('tr').data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Carousel Will be Activated!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('carousel/reactivate-carousel', {
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
                            Swal.fire('Successfull!', 'Carousel has been Activated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });
            // Add an event listener to the "Add Carousel" button
            $('#addCarouselBtn').click(function () {
                clearForm(); // Clear the form fields
                $('#saveBtn').data('mode', 'save');
                $('#saveBtn').html('<i class="icon feather icon-save"></i>Save');
                $('#tableSection').hide();
                $('#formSection').fadeIn();
            });

            // Add a function to clear the form fields
            function clearForm() {
                $('#formSection').find('input[type!=search]').val('');
                $('#formSection').find('textarea').val('');
                $('#formSection').find('select').each(function () {
                    if ($(this).data('select')) {
                        if ($(this).data('select').ajax) {
                            $(this).data('select').data.data = [];
                        }
                        $(this).data('select').set('');
                    }
                });
            }


            $(document).on('click', '.editrec', function () {
                loadDiv($('#tableSection'));
                let id = $(this).parents('tr').data('id');
                fetch('carousel/details/' + id)
                        .then(resp => resp.json())
                        .then((resp) => {
                            let data = resp.data;
                            $('#heading').val(data.heading)
                            $('#para').val(data.para)

                            $('#saveBtn').data('mode', 'update'); // Set the mode to 'update'
                            $('#saveBtn').data('id', id);
                            $('#saveBtn').html('<i class="icon feather icon-save"></i>Update'); // Change button text to 'Update'
                            $('#formSection').fadeIn();
                            $('#tableSection').hide();
                            finishLoadDiv($('#tableSection'));
                        });
            });

            document.getElementById('saveBtn').addEventListener('click', function () {
                if ($('#heading').val().trim() === '') {
                    Swal.fire("Empty Heading!", "Please Enter a Valid Heading!", "warning");
                    return;
                }
                let mode = $('#saveBtn').data('mode'); // Get the mode (save or update) from the button's data

                if (mode === 'save') {
                    // Handle the 'save' action
                    let fd = new FormData();
                    let file = document.getElementById('file').files;
                    let heading = document.getElementById('heading').value;
                    fd.append('heading', heading);
                    let para = document.getElementById('para').value;
                    fd.append('para', para);
                    for (var i = 0; i < file.length; i++) {
                        fd.append('file', file[i]);
                    }
                    fetch('carousel/save', {
                        method: 'POST',
                        body: fd
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Carousel has been successfully saved', 'success');
                            clearForm();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                            dtable.ajax.reload();
                        }
                        return response.json();
                    });
                } else if (mode === 'update') {
                    // Handle the 'update' action
                    let id = $('#saveBtn').data('id');
                    let heading = $('#heading').val();
                    let para = $('#para').val();
                    let fileInput = document.getElementById('file');
                    let files = fileInput.files;

                    let formData = new FormData();
                    formData.append('id', id);
                    formData.append('heading', heading);
                    formData.append('para', para);

                    for (let i = 0; i < files.length; i++) {
                        formData.append('file', files[i]);
                    }

                    $.ajax({
                        url: 'carousel/update', // Replace with the actual update endpoint
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            if (response.status === 200) {
                                Swal.fire('Successful!', 'Carousel details updated successfully', 'success');
                                clearForm();
                                $('#formSection').hide();
                                $('#tableSection').fadeIn();
                                dtable.ajax.reload();
                            } else {
                                Swal.fire('Successful!', 'Carousel details updated successfully', 'success');
                                clearForm();
                                $('#formSection').hide();
                                $('#tableSection').fadeIn();
                                dtable.ajax.reload();
                            }
                        },
                        error: function (xhr, status, error) {
                            console.log(xhr);
                            console.log(status);
                            console.log(error);
                            Swal.fire('Error!', 'Failed to update Carousel details', 'error');
                        }
                    });
                }
            });



        </script>
    </body>
</html>


