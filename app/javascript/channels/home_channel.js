$(function () {
    $('#year').datepicker({
        format: 'yyyy',
        viewMode: "years",
        minViewMode: "years",
    }).on('changeYear', function(e){
    });
});