var types = ["CNW", "HartW", "NWGW", "SchW", "Demo", "Opus", "FS"];

function swap_num_type() {
    var type_id     = document.getElementById("scheme_selector").value;

    for (var i in types) {
        if (document.getElementById(types[i])) {
        	var old_select  = document.getElementById(types[i]);	
        	old_select.name = "noname";
        	old_select.style.display = "none";
	   }
    }

    var new_select  = document.getElementById(type_id);
    new_select.name = "workno";
    new_select.style.display = "inline";

    current_num_type = type_id;

}
