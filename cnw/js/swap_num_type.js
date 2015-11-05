 var current_num_type = "CNW";

function swap_num_type() {
    var type_id     = document.getElementById("scheme_selector").value;
    var old_select  = document.getElementById(current_num_type);
    var new_select  = document.getElementById(type_id);

    old_select.name = "noname";
    new_select.name = "workno";

    old_select.style.display = "none";
    new_select.style.display = "inline";

    current_num_type = type_id;
}
