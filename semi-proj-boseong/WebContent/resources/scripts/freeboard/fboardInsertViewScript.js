$(() => {
  $('[data-toggle="tooltip"]').tooltip();
  $(".custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  });
});
// GET IP ADDRESS
$.getJSON("https://jsonip.com/", function (data) {
  var obj = JSON.stringify(data, null, 2);
  var temp = JSON.parse(obj, null, 2);
  console.log(obj);
  var ip = temp.ip;
  $("#ipvalue").val(ip);
  $("#ipaddr").val(ip);
});
