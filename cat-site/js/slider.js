$(document).ready(function () {
/* instantiates the year range selection slider  */
    /* some problem here: the slider seems to choke ("closestHandle is undefined") if min_year and max_year are not hardcoded */  
    var min_year = $("#minyear").val();
    var max_year = $("#maxyear").val();
    $("#year_slider").slider({
        range: true,
        min: min_year,
        max: max_year,
        values: [ $("#notbefore").val() || min_year, $("#notafter").val() || max_year],
        slide: function (event, ui) {
            $("#notbefore").val(ui.values[0]);
            $("#notafter").val(ui.values[1]);
        }
    });
    $("#notbefore").val($("#year_slider").slider("values",0));
    $("#notafter").val($("#year_slider").slider("values",1));
});

function setYearSlider(notbefore, notafter) {
/* call without arguments to update slider according to notebefore/notafter inputs   */
/* or call with year values to set or change selected range                          */
    notbefore = notbefore || $("#notbefore").val();
    notafter  = notafter  || $("#notafter").val();
    $("#year_slider").slider( "values", [ notbefore, notafter ] );
    $("#notbefore").val(notbefore);
    $("#notafter").val(notafter);
}