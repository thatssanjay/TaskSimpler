var memberid = 1;
window.onload = bindPriority();
function getPriorityJSSON(callback)
{   
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/GetPriority/" +  memberid ,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            //alert(resp);
            localStorage.priority = resp;
            callback(JSON.parse(resp));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    }); 
}

function bindPriority()
{
    getPriorityJSSON(function (JSONdata) {
        $('#ddlPriority').empty();
        $.each(JSONdata, function (index, value) {
            $('#ddlPriority').append($('<option>').text(value.Priority).attr('value', value.ID));
        });
    });
}