document.getElementById('btnReset').onclick = Reset;
document.getElementById('btnSetTime').onclick = SetTime;

var time;
var hourse = 0;
var minute = 0
var apPM = '';
window.setInterval(function () {
    getTime();
}, 1000);

function getTime() {

    var user = [{
        Name: 'sanjay',
        Age: 32
    },
    {
        Name: 'Vinay',
        Age: 30
    }
    ];
    
    
    var storage = chrome.storage.local;
    var channels = "Intelliswift";
    var keywords = "SharePoint";

    storage.set({
        "Users": user
    });
    storage.get('Users', function (result) {
        debugger
        var name = result.Users[0].Name;
      //  alert(result);
        //console output = {v1:'s1'}
    })


    if (localStorage.EnterTime != '')
    {
        Startprocess();
        time = localStorage.EnterTime;
        hourse = parseInt(time.substr(0, 2));
        minute = parseInt(time.substr(3, 2));
        apPM = time.substr(6, 2);
        if (apPM == 'PM')
            hourse += 12;
        var curretnTime = new Date();
        curretnTime.setHours(hourse);
        var baseTime = new Date();
        baseTime.setHours(9);
        baseTime.setMinutes(minute);
        baseTime.setSeconds(1);
      
        timeDifference(baseTime,curretnTime);
    }
}

function SetTime()
{
    localStorage.EnterTime = $('#txtTime').val();
    Startprocess();
    getTime();
}

function Reset()
{
    localStorage.EnterTime = '';
    $("#divTime").css("display", "none");
    $("#divEnterTime").css("display", "block");
}

function Startprocess()
{
    $("#divEnterTime").css("display", "none");
    $("#divTime").css("display", "block");
    
}



function timeDifference(date1, date2)
{
    var extrahours = '';
    var difference = date1.getTime() - date2.getTime();
    if (difference < 0) {
        var difference = date2.getTime() - date1.getTime();
        $("#spnTimeValue").css("color", "red");
        extrahours = '+';
    }
    else {
        $("#spnTimeValue").css("color", "green");
        extrahours = '-';
    }

    var daysDifference = Math.floor(difference / 1000 / 60 / 60 / 24);
    difference -= daysDifference * 1000 * 60 * 60 * 24;

    var hoursDifference = Math.floor(difference / 1000 / 60 / 60);
    difference -= hoursDifference * 1000 * 60 * 60;

    var minutesDifference = Math.floor(difference / 1000 / 60);
    difference -= minutesDifference * 1000 * 60;

    var secondsDifference = Math.floor(difference / 1000);
    $('#spnTimeValue').text(extrahours+hoursDifference + ':' + minutesDifference + ':' + secondsDifference);
    $('#spnEnterTime').text("Enttry Time: "+localStorage.EnterTime);
   
}




