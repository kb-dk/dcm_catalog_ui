// Layout-related js


// Resize neighbouring work list divs the same height (the height of the tallest one)
// cf. https://stackoverflow.com/questions/526294/how-might-i-force-a-floating-div-to-match-the-height-of-another-floating-div

function adjustLayout() {

    var currentTallest = 0;
    var currentRowStart = 0;
    var rowDivs = [];
    
    $('.result_row.main').each(function(index) {
    
        //console.log('Y: ' + $(this).offset().top);
        //console.log('X: ' + $(this).offset().left);
        //console.log('Row height: ' + $(this).height());
    
        if(currentRowStart != $(this).offset().top) {
    
            // we just came to a new row.  Set all the heights on the completed row
            for(currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) rowDivs[currentDiv].height(currentTallest);
    
            //rowDivs.length = 0; // empty the array
            rowDivs = []; // empty the array
            currentRowStart = $(this).offset().top;
            currentTallest = $(this).height();
            rowDivs.push($(this));
            
    
        } else {
    
            // another div on the current row.  Add it to the list and check if it is taller
            rowDivs.push($(this));
            currentTallest = (currentTallest < $(this).height()) ? ($(this).height()) : (currentTallest);
    
        }
        // do the last row
        for(currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) rowDivs[currentDiv].height(currentTallest);
    });
};


window.onload = adjustLayout;

