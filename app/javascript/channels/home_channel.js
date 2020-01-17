$(function () {
    $('#year').datepicker({
        format: 'yyyy',
        viewMode: "years",
        minViewMode: "years",
    }).on('changeYear', function(e){
        // console.log(e)
        // $('#filter-btn').click()
    });

    $('#fromMonth, #toMonth').datepicker({
        format: 'm',
        minViewMode: 'months',
        maxViewMode: 'months',
        startView: 'months'
    });

    // $( "select" ).change(function() {
    //     let $value = $( "select option:checked" ).val();
    //     console.log($value)
    //     if ($value == ''){
    //         $(this).css('backgroud-color: red')
    //     }
    // });

});