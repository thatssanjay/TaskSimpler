var memberid = 1;
window.onload = loadStatus();
var StatusColorCode = {};

function getStatuaJSSON(callback) {
    $.ajax({
        type: "GET",
        url: GetRESTUrl() + "/GetStatus/" + memberid,
        contentType: 'json',
        dataType: 'json',
        success: function (resp) {
            localStorage.Status = resp;
            callback(JSON.parse(resp));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus); alert("Error: " + errorThrown);
        }
    });
}
function loadStatus()
{
    getStatuaJSSON(function (JSONdata) {
        $.each(JSONdata, function (index, value) {
            StatusColorCode[value.StatusID] = value.ColorCode;
           

        });
       // alert(result['1']);
    });
}