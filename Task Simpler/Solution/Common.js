
// REST Service url 
function GetRESTUrl()
{
    return "http://10.222.11.8:88/TaskSimpler.svc";
}

document.onkeyup = function (e) {
    var e = e || window.event; // for IE to cover IEs window event-object
    if (e.ctrlKey && e.which == 110 || e.ctrlKey && e.which == 78) {
        //alert('Keyboard shortcut working!');
        $('#ProjectModel').modal('show');
        return false;
    }
}

function showDialogbox(id)
{
    $('#'+id).modal('show');
}