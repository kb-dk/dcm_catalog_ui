let openness = new Array();
let coll = document.getElementsByClassName("collapsible");
let i;

function toggle(id) {
    let img  = document.getElementById("img" + id);
    let para = document.getElementById("p"   + id);
    if(id in openness && openness[id]) {
    	para.title = "Click to open";
    	img.alt = "+";
    	img.src = "/dcm/cnw/style/images/plus.png";
    	hide(id);
    	openness[id] = false;
    } else if(id in openness && !openness[id]) {
    	para.title = "Click to close";
    	img.alt = "-";
    	img.src = "/dcm/cnw/style/images/minus.png";
    	show(id);
    	openness[id] = true;
    } else {
    	para.title = "Click to open";
    	img.alt = "+";
    	img.src = "/dcm/cnw/style/images/plus.png";
    	show(id);
    	openness[id] = true;
    }
}

function show(id) {
    let e = document.getElementById(id);
    e.style.display = 'block';
}

function hide(id) {
    let e = document.getElementById(id);
    e.style.display = 'none';
}

function loadcssfile(filename){
    let fileref=document.createElement("link");
    fileref.setAttribute("rel", "stylesheet");
    fileref.setAttribute("type", "text/css");
    fileref.setAttribute("href", filename);
    if (typeof fileref!="undefined") document.getElementsByTagName("head")[0].appendChild(fileref);
}

function removecssfile(filename){
    let allsuspects=document.getElementsByTagName("link");
    for (let i=allsuspects.length; i>=0; i--){ //search backwards within nodelist for matching elements to remove
  	if (allsuspects[i] && allsuspects[i].getAttribute("href")!=null && allsuspects[i].getAttribute("href").indexOf(filename)!=-1)
 	    allsuspects[i].parentNode.removeChild(allsuspects[i]) //remove element by calling parentNode.removeChild()
    }
}


// Load an image into the overlay
function incipit_load(src) {
    document.getElementById("overlay").innerHTML = '<img src="' + src + '" alt="Music incipit"/>';
    overlay_on();
}

function overlay_on() {
    document.getElementById("overlay").style.display = "block";
}

function overlay_off() {
    document.getElementById("overlay").style.display = "none";
    document.getElementById("overlay").innerHTML = '&nbsp;'
    
} 

// Prepare collapsible sections
function init_collapsible() {
    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
      });
    }
}

