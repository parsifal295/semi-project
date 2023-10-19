$(function(){
    $('#tbRs > tbody > tr').click(function(){
        location.href = 'detail.ib?bno=' + $(this).children().eq(0).text();
    });
});