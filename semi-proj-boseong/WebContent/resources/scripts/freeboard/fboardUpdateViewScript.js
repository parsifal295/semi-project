$(() => {
  $('[data-toggle="tooltip"]').tooltip();

  // 첨부파일이 있을 경우 => 첨부파일의 이름을 표시
  var attFile;
 <% if (att != null) { %>
    attFile = "<%=att.getOriginName()%>";
   <% } %> 
 if (attFile != undefined) {
    $(".custom-file-label").addClass("selected").html(attFile);
  } else {

  }

  $(".custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  });
})
