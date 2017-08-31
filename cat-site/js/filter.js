function checkYearRange () {
    minVal = document.getElementById('minyear').value;
    maxVal = document.getElementById('maxyear').value;
    if (document.getElementById('notbefore').value < minVal) 
        {  document.getElementById('notbefore').value = minVal; }
    else 
        { if (document.getElementById('notbefore').value > maxVal) 
            {  document.getElementById('notbefore').value = maxVal; }
        }
    if (document.getElementById('notafter').value < minVal) 
        {  document.getElementById('notafter').value = minVal; }
    else 
        { if (document.getElementById('notafter').value > maxVal) 
            {  document.getElementById('notafter').value = maxVal; }
        }
};

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function initialize() {
    if (getParameterByName("notbefore")) 
        { document.getElementById('notbefore').value = getParameterByName("notbefore"); } 
    if (getParameterByName("notafter")) 
        { document.getElementById('notafter').value = getParameterByName("notafter"); } 
}