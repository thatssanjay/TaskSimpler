var memberid = 1;
var JSONObjLocal = null;
document.getElementById('btnAddnewProject').onclick = SaveNewProject;
document.getElementById('Cancel').onclick = GetAllProjects;
document.getElementById('btnEditProject').onclick = BindProjectTable;
window.onload = BindProjects();



function SaveNewProject() {
    debugger
    GetProjectJSON(function (JSONObj) {
        $.ajax({
            type: "GET",
            url: GetRESTUrl() + "/AddProject/" + memberid + "/" + $('#txtProjectName').val() + "/" + $('#txtProjectDescription').val(),
            contentType: 'json',
            dataType: 'json',
            success: function (resp) {
                //alert success
                BindProjects();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                
                alert("Status: " + textStatus); alert("Error: " + errorThrown);
            }
        });
    });
}


function GetProjectJSON(callback) {
    $.ajax({
        type: "GET",
        url: GetRESTUrl()+"/GetProjects/"+memberid,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            callback(JSON.parse(resp));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    }); // ajax asynchronus request 
}



// Get project details based on the member login
//function GetProjectJSON()
//{
//    //alert( GetRESTUrl()+"/GetProjects/"+memberid);
//    $.ajax({
//        type: "GET",
//        url: "http://localhost:66/TaskSimpler.svc/GetProjects/2",
//        contentType: 'json',
//        dataType: 'json',
//        success: function (data) {
//            JSONObj = JSON.parse(data);
//            //return jsondata;
//            //$.each(jsondata, function (key, value) {
//            //    alert(value.ProjectName);
//            //});

//        },
//        error: function (XMLHttpRequest, textStatus, errorThrown) {
//            debugger
//            alert("Status: " + textStatus); alert("Error: " + errorThrown);
//        }
//    });
//    }
function GetAllProjects()
{
    //alert(localStorage.ProjectsTable);
    clearField();
}

function BindProjects()
{
    GetProjectJSON(function (JSONdata) {
        JSONObjLocal = JSONdata;
    $('#ddlProjects').empty()
    $.each(JSONdata, function (index, value) {
        $('#ddlProjects').append($('<option>').text(value.ProjectName).attr('value', value.ID));
    });
    if ($('#txtProjectName').val() != '')
        //$("#ddlProjects option:selected").text($('#txtProjectName').val());
       // $("#ddlProjects").val($('#txtProjectName').val());
    clearField();
    });
    
}

function clearField()
{
    $('#txtProjectName').val("");
    $('#txtProjectDescription').val("");
}
function DeleteProject(id)
{
    var confirmvalue = confirm("Are you sure want to delete?");
    if (confirmvalue) {
        $.ajax({
            type: "GET",
            url: GetRESTUrl() + "/DeleteProject/" + id + "/" + memberid,
            contentType: 'json',
            dataType: 'json',
            success: function (resp) {
               // alert(resp);
                BindProjects();
                BindProjectTable();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {

                alert("Status: " + textStatus); alert("Error: " + errorThrown);
            }
        });
    }
}

function EditProject(id)
{
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/UpdateProject/" + id + "/" + memberid + "/" + $('#txtProjectValue'+id).val() + "/" + $('#txtDescriptionvalue' + id).val(),
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            alert(resp);
            BindProjects();
            BindProjectTable();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
    
}
function BindProjectTable()
{
    GetProjectJSON(function (JSONdata) {
        var tbl = '<table id="table1" class="table table-striped table-bordered hover" cellspacing="0" width="100%">' +
                                 '<thead><tr><th>ID</th><th>Project Name</th><th>Description</th>' +
                                         '<th>Actioin</th></tr></thead>';
        $.each(JSONdata, function (index, value) {
            tbl += '<tr>' +
                  '<td>' + value.ID + '</td>' +
                  //'<td>' + value.ProjectName + '</td>' +
                   '<td  ><input type="text" class="Editbox" id="txtProjectValue' + value.ID + '"  value=' + value.ProjectName + ' /></td>' +
                  //'<td>' + value.Description + '</td>' +
                  '<td><input type="text" class="Editbox" id="txtDescriptionvalue' + value.ID + '" value=' + value.Description + ' /></td>' +
                  '<td><a href="#" id="btnEditProjectItems-' + value.ID + '"  class="fa fa-edit edit-btn fa-lg EditDataProp " title="Edit Project"></a>' +
                  '<a  href="#" id="btnDeleteProjectItems-' + value.ID + '"  class="fa fa-trash delete-user-btn fa-lg DeleteDataProp " title="Delete Project"></a></td>' +

                  '</tr>';
        })
        tbl += '<tbody></tbody></table>';
        $('#divProjectTable').empty();
        $('#divProjectTable').append(tbl);
        CreateRuntimeEvent();
    });
}
function CreateRuntimeEvent()
{
    $('.EditDataProp').on('click', function () {
        debugger
        EditProject(this.id.split('-')[1]);
    });
    $('.DeleteDataProp').on('click', function () {
        DeleteProject(this.id.split('-')[1]);
        
    });
}

//function GetBook()
//{
//    $.ajax({  
//        type: "GET",  
//        url: "http://localhost:66/IBookService.svc/GetBooksNames",
//        contentType: 'json',  
//        dataType: 'json',  
//        success: function (data) {
//            debugger
//            $.each(data, function (key, value) {  
//                alert(value);
//            });
//        },
//        error: function (XMLHttpRequest, textStatus, errorThrown) {
//            debugger
//        alert("Status: " + textStatus); alert("Error: " + errorThrown); 
//    }       
//    });
//}
