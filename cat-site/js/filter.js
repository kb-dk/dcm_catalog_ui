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

