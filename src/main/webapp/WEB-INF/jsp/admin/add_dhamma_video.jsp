

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BVS | Dhamma Videos</title>
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

            <div class="page-wrapper" id="units">
                <div class="page-body">

                    <div class="row" id="tableSection">
                        <div class="title-bg">
                            <div class="container-s">
                                <div class="container_12">
                                    <div class="grid_12">
                                        <h1 class="title">Dhamma Videos - Admin</h1>
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
                                                <th>Video Heading </th>
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
                                    <button id="addContentBtn" class="btn btn-sm waves-effect waves-light btn-danger"><i class="icon feather icon-plus"></i>Add Content</button>
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
                                            <button type="button" class="close" id="closeButton2" data-dismiss="modal">&times;</button>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                    <div class="form-group"style="width: 75rem">
                                        <label for="heading">Please Add Your Content Heading Here<span class="text-danger">*</span></label>
                                        <input id="heading" type="text" name="heading" class="form-control"  required autocomplete="off">
                                    </div>
                                </div>
                                <table class="table table-hover table-bordered m-b-0" id="tbladdAtt">

                                    <thead>
                                        <tr>
                                            <th>Dhamma Content Name</th>
                                            <th>Dhamma Content Link</th>
                                            <th style="width:1px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>

                                </table>

                                <div class="row justify-content-end" style="padding-top: 2em;">
                                    <div class="col-lg-6 col-12">
                                        <div class="text-right">
                                            <button id="addBtn" class="btn btn-sm waves-effect waves-light btn-danger">
                                                <i class="icon feather icon-plus"></i>Add Attachment
                                            </button>
                                        </div>
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
            // Function to handle the "Add Attachment" button click
            document.getElementById('addBtn').addEventListener('click', function () {
                // Get the table body
                var tableBody = document.querySelector('#tbladdAtt tbody');

                // Create a new row
                var newRow = tableBody.insertRow();

                // Create cells in the new row
                var fileNameCell = newRow.insertCell(0);
                var fileCell = newRow.insertCell(1);
                var actionCell = newRow.insertCell(2);

                // Create input for "File Name" in cell 1
                var fileNameInput = document.createElement('input');
                fileNameInput.type = 'text';
                fileNameInput.name = 'fileName';
                fileNameInput.classList.add('form-control');
                fileNameInput.required = true;
                fileNameInput.autocomplete = 'off';

                // Create input for "File Description" in cell 2
                var fileDescInput = document.createElement('input');
                fileDescInput.type = 'text';
                fileDescInput.name = 'fileLink';
                fileDescInput.classList.add('form-control');
                fileDescInput.required = true;
                fileDescInput.autocomplete = 'off';

                // Append input elements to respective cells
                fileNameCell.appendChild(fileNameInput);
                fileCell.appendChild(fileDescInput);

                // Create a delete button in the action cell
                var deleteButton = document.createElement('button');
                deleteButton.classList.add('btn', 'btn-sm', 'btn-danger');
                deleteButton.textContent = 'Delete';
                deleteButton.name = 'dele';

                // Add a click event listener to the delete button
                deleteButton.addEventListener('click', function () {
                    // Remove the row when the delete button is clicked
                    tableBody.removeChild(newRow);
                });

                // Append the delete button to the action cell
                actionCell.appendChild(deleteButton);

                // Call the addAttachmentRow function with the input values
                addAttachmentRow(fileNameInput.value, fileDescInput.value);
            });

            function clearForms() {
                // Clear Unit Name input
                document.getElementById('heading').value = '';

                // Clear table rows
                var tableBody = document.querySelector('#tbladdAtt tbody');
                tableBody.innerHTML = '';
            }
            $(document).ready(function () {
                // Add click event handler to both close buttons
                $('#closeButton2').click(function () {
                    $('#formSection').hide();
                    $('#tableSection').fadeIn();
                    $('#navTab').fadeIn();
                    clearForms();

                });
            });
        </script>
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
                    "url": "dhamma/dhamma-content",
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
                    text: "This Content Will be Deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('dhamma/deactivate-content', {
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
                            Swal.fire('Successfull!', 'Content has been Deactivated !', 'success');
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
                    text: "Content Will be Activated!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('dhamma/reactivate-content', {
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
                            Swal.fire('Successfull!', 'Content has been Activated !', 'success');
                            dtable.ajax.reload();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                        }
                    }
                });
            });
            $('#addContentBtn').click(function () {
                $('#saveBtn').data('mode', 'save');
                $('#saveBtn').html('<i class="icon feather icon-save"></i>Save');
                clearForms();
                $('#tableSection').hide();
                $('#formSection').fadeIn();
            });
            $('.cls-card').click(function () {
                $('#formSection').hide();
                $('#tableSection').fadeIn();
            });
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

            var deleted = [];

            function clearForms() {
                // Clear Unit Name input
                deleted = [];
                document.getElementById('heading').value = '';

                // Clear table rows
                var tableBody = document.querySelector('#tbladdAtt tbody');
                tableBody.innerHTML = '';
            }
            $(document).on('click', '.editrec', function () {
                loadDiv($('#tableSection'));
                let id = $(this).parents('tr').data('id');

                // Fetch heading and attachment details
                fetch('dhamma/content-details/' + id)
                        .then(resp => resp.json())
                        .then((resp) => {
                            let content = resp.data.content;
                            $('#heading').val(content.heading);
                            let attachments = resp.data.videos;


                            // Clear existing rows in the attachment table
                            $('#tbladdAtt tbody').empty();

                            // Populate the attachment table with fetched data
                            attachments.forEach((attachment) => {
                                // Get the table body
                                var tableBody = document.querySelector('#tbladdAtt tbody');

                                // Create a new row
                                var newRow = tableBody.insertRow();

                                // Create cells in the new row
                                var fileNameCell = newRow.insertCell(0);
                                var fileCell = newRow.insertCell(1);
                                var actionCell = newRow.insertCell(2);

                                // Set the text content of the cells with the fetched values
                                fileNameCell.textContent = attachment.name;

                                var fileLink = document.createElement('a');
                                fileLink.href = 'https://www.youtube.com/embed/' + attachment.link;  // Set the link to the file using the path from attachment.att_path
                                fileLink.target = '_blank';  // Open the link in a new tab
                                fileLink.textContent = 'View Video';
                                fileCell.appendChild(fileLink);

                                // Create a delete button in the action cell
                                var deleteButton = document.createElement('button');
                                deleteButton.classList.add('btn', 'btn-sm', 'btn-danger');
                                deleteButton.textContent = 'Delete';

                                // Add a click event listener to the delete button
                                let videoId = attachment.id;
                                deleteButton.addEventListener('click', function () {

                                    deleted.push(videoId + "");

                                    // Remove the row when the delete button is clicked
                                    tableBody.removeChild(newRow);
                                });

                                // Append the delete button to the action cell
                                actionCell.appendChild(deleteButton);
                            });

                            // Show the form section
                            $('#saveBtn').data('mode', 'update');
                            $('#saveBtn').data('id', id);
                            $('#saveBtn').html('<i class="icon feather icon-save"></i>Update');
                            $('#formSection').fadeIn();
                            $('#tableSection').hide();
                            finishLoadDiv($('#tableSection'));

                        });
            });



            function handleAttachmentDeletion() {
                let deleteIds = [];

                $('#tbladdAtt').on('click', '.btn-danger', function () {
                    let deleteRowId = $(this).closest('tr').attr('id');
                    deleteIds.push(deleteRowId);
                    $(this).closest('tr').remove();
                });

                return deleteIds;
            }

            document.getElementById('saveBtn').addEventListener('click', function () {
                let mode = $('#saveBtn').data('mode');
                if (mode === 'save') {
                    let heading = document.getElementById('heading').value;

                    let tableRows = document.querySelectorAll('#tbladdAtt tbody tr');
                    let attachmentData = [];
                    let formData = {};

                    let i = 1;
                    tableRows.forEach((row, index) => {
                        let fileName = row.querySelector('input[name="fileName"]').value;
                        let fileLink = row.querySelector('input[name="fileLink"]').value;

                        attachmentData.push({
                            name: fileName,
                            link: fileLink
                        });
                    });
                    let desclist = JSON.stringify(attachmentData);

                    formData.desclist = desclist;
                    formData.heading = heading;



                    fetch('dhamma/save-attachment', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Content has been successfully saved', 'success');
                            clearForms();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                            $('#navTab').fadeIn();
                            dtable.ajax.reload();
                            clearForms();
                        }
                        return response.json();
                    });
                } else if (mode === 'update') {
                    let heading = document.getElementById('heading').value;
                    let id = $('#saveBtn').data('id');

                    let deleteIds = handleAttachmentDeletion();
                    let tableRows = document.querySelectorAll('#tbladdAtt tbody tr');
                    let attachmentData = [];

                    let formData = {};

                    tableRows.forEach((row, index) => {
                        let fileNameInput = row.querySelector('input[name="fileName"]');
                        let fileLinkInput = row.querySelector('input[name="fileLink"]');

                        if (fileNameInput && fileLinkInput) {
                            let fileName = fileNameInput.value;
                            let fileLink = fileLinkInput.value;

                            attachmentData.push({
                                name: fileName,
                                link: fileLink

                            });
                        }
                    });

                    let desclist = JSON.stringify(attachmentData);

                    formData.desclist = desclist;
                    formData.id = id;
                    formData.heading = heading;
                    formData.deleteIds = JSON.stringify(deleted);

                    fetch('dhamma/update-attachment', {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        } else {
                            Swal.fire('Successful!', 'Unit details updated successfully', 'success');
                            clearForms();
                            $('#formSection').hide();
                            $('#tableSection').fadeIn();
                            $('#navTab').fadeIn();
                            dtable.ajax.reload();
                        }
                        return response.json();
                    }).catch(error => {
                        console.error('Error updating unit details:', error);
                        Swal.fire('Error!', 'Failed to update Unit details', 'error');
                    });
                }



            });

        </script>
    </body>
</html>


