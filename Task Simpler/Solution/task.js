/// <reference path="jquery.contextmenu.min.js" />

var memberid = 1;
var trId;
var previousecolorcode;
window.onload = bindtask();
document.getElementById('ddlProjects').onchange = bindtask;
document.getElementById('btnSaveTask').onclick = CreateNewTask;
//document.getElementById('divTaskDetails').ondblclick = editTask;
document.getElementById('btnupdateTask').onclick = updateTask;
//document.getElementById('btncall1').onclick = CheckData;
//window.setTimeout(CreateContextMenu, 8000);




function editTask()
{
    alert( localStorage.priority );
}
function gettaskjson(callback) {
    var projectid = $("#ddlProjects option:selected").val();
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/GetTask/" + memberid + "/" + projectid,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            callback(JSON.parse(resp));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}

function UpdateTaskId() {
    var taskid=1;
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/UpdateTaskStatus/"+taskid+"/"+memberid+"/3",
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            bindtask();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });

}

function CreateNewTask()
{
    
    

    var  description=null;
    if ($('#txtTaskDescription').val().trim() != "")
        {
         description = $('#txtTaskDescription').val();
    }

    
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/AddTask/" + $('#txtTask').val() + "/" + memberid + "/" + $("#ddlProjects option:selected").val() + "/" + $("#ddlPriority option:selected").val() + "/" + description + "/" + null,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            bindtask();
            emptyFields();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}

function emptyFields()
{
    $('#txtTaskDescription').val('');
    $('#txtTask').val('');
    $("#ddlPriority").prop('selectedIndex', 0);
}

function getPriorityJson(priority,id)
{
    
    var divRow = ' <select class="PriorityddlinTaskListitems Editbox" id="ddlPriorityInTask-' + id + '" class="Editbox" >';
    var JSONdata = JSON.parse(localStorage.priority)
    $.each(JSONdata, function (index, value) {
        if (priority == value.Priority) {
            divRow += ' <option selected="selected" value="' + value.ID + '">' + value.Priority + '</option>';
        }
        else {
            divRow += ' <option  value="' + value.ID + '">' + value.Priority + '</option>';
        }
        });
    divRow += ' </select>';
    return divRow;
}

function getStatusJson(status, id) {
    var divRow = ' <select class="StatusddlinTaskListitems Editbox" id="ddlStatusInTask-' + id + '" >';
    var JSONdata = JSON.parse(localStorage.Status)
    $.each(JSONdata, function (index, value) {
        if (status == value.Status) {
            divRow += ' <option selected="selected" value="' + value.StatusID + '">' + value.Status + '</option>';
        }
        else {
            divRow += ' <option  value="' + value.StatusID + '">' + value.Status + '</option>';
        }
    });
    divRow += ' </select>';
    return divRow;

}

function bindtask() {
    gettaskjson(function (JSONdata) {
        var tbl = '<table id="table1" class="table table-striped table-bordered hover" cellspacing="0" width="100%">' +
                                 '<thead><tr>'+
                                 //'<th>SN</th>' +
                                 '<th>Task ID</th>' +
                                 '<th>Task</th>'+
                                 '<th>CreatedOn</th>' +
                                  '<th>Status</th>'+
                                  '<th>Priority</th>'+
                                  '<th>Description</th>'+
                                  '</tr></thead>';
        $.each(JSONdata, function (index, value) {
            tbl += '<tr style="background-color:' + value.ColorCode + '" id="TaskRow-' + value.ID + '" class="contextmenu" >' +
                //'<td>' + value.ItemNo + '</td>' +
                '<td>' + value.ID + '</td>' +
                '<td>' + value.Task + '</td>' +
                '<td>' + value.Addedon + '</td>' +
              '<td>' + getStatusJson(value.Status, value.ID) + '</td>' +
                '<td>' + getPriorityJson(value.Priority, value.ID) + '</td>' +
                '<td>' + value.Description + '</td>' +
                  '</tr>';
        })
        tbl += '<tbody></tbody></table>';
        $('#divTaskDetails').empty();
        $('#divTaskDetails').append(tbl);
        
        CreatePriorityEvent();
        
    });
    
    CreateContextMenu();
    SetContextMenuRowID();
    
}

function SetContextMenuRowID()
{
  
    $('#divTaskDetails').on('contextmenu', 'tr', function (e) { //Get li under ul and invoke on contextmenu
        if (trId != '') { $('#' + trId).css('background-color', previousecolorcode); }
        e.preventDefault(); //Prevent defaults
        trId = this.id;
        var statusid = $("#ddlStatusInTask-" + GetTaskId (this.id)+ " option:selected").val();
        previousecolorcode = StatusColorCode[statusid]
        $('#' + this.id).css('background-color', '#feff3b');

    });
}

function CreatePriorityEvent()
{
    var priorityid = '';
    $('.PriorityddlinTaskListitems').on('change', function () {
        
        priorityid = $('#' + this.id).val();
        
        updateTaskPriority(GetTaskId(this.id), priorityid);
        
    });

    $('.StatusddlinTaskListitems').on('change', function () {
        statusid = $('#' + this.id).val();
        updateTaskStatus(GetTaskId(this.id), statusid);
    }); 
}

function GetTaskId(trid)
{
    return trid.split('-')[1];
}

function CreateContextMenu()
{
    $('#divTaskDetails').contextMenu('myMenu1', {
        bindings: {
            'edit': function (t) {
                getTaskDetails();
               
                          
                       },

                       'email': function (t) {

                           alert('Trigger was ' + trId + '\nAction was Email');

                       },

                       'details': function (t) {
                           showTaskDetails();
                          

                       },

                       'delete': function (t) {
                           deleteTask(GetTaskId(trId));

                       }

                   }

               });
}


         

   


function updateTaskPriority(taskid, statusid)
{
    
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/UpdateTaskPriority/" + taskid + "/" + memberid + "/" + statusid,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            bindtask();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}

function BindTaskUpdatemodel()
{
    
}

function getTaskDetailsJson(callback) {
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/TaskDetails/" + GetTaskId(trId),
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            callback(JSON.parse(resp));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}

function showTaskDetails()
{
    getTaskDetailsJson(function (JSONdata) {
        $.each(JSONdata, function (index, value) {
            $('#spnTask').text(value.Task);

            $('#spnDescription').text(value.Description);
            $('#spnProject').text(value.ProjectName);
            $('#spnName').text(value.MemberName);
            $('#spnStatus').text(value.Status);
            $('#spnPriority').text(value.Priority);
            $('#spnCreatedon').text(value.Addedon);
            $('#spnUpdatedOn').text(value.UpdatedOn);
        });
    });
    showDialogbox('divTaskDescription');
}

function getTaskDetails() {

    getTaskDetailsJson(function (JSONdata) {
        $.each(JSONdata, function (index, value) {
            $('#txtTaskNameupdate').val(value.Task);
            $('#txtTaskDescriptionUpdate').val(value.Description);
            $('#divEditTask').modal('show');
            showDialogbox('divEditTask');
        });
    });
        
         
}

function updateTask()
{
   
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/UpdateTask/" +  GetTaskId(trId)+ "/" + $('#txtTaskNameupdate').val() + "/" + $('#txtTaskDescriptionUpdate').val(),
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            bindtask();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}

function updateTaskStatus(taskid, statusid) {
    //alert(GetRESTUrl() + "/UpdateTaskStatus/" + taskid + "/" + memberid + "/" + statusid);
    $.ajax({
        type: "GET",
        
        url: GetRESTUrl() + "/UpdateTaskStatus/" + taskid + "/" + memberid + "/" + statusid,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            
            $('#TaskRow-' + taskid).css('background-color', StatusColorCode[statusid]);
            bindtask();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}

function deleteTask(taskid)
{
    if(confirm('Are sure to delete task'))
    {
        $.ajax({
            type: "GET",
            url: GetRESTUrl() + "/DeleteTask/" + taskid,
            contentType: 'json',
            dataType: 'json',
            success: function (resp) {
                bindtask();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                
                alert("Status: " + textStatus); alert("Error: " + errorThrown);
            }
        });
    }
}
