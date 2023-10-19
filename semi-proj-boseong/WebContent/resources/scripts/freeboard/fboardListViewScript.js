$(() => {
  $("#tb > tbody > tr").click(function () {
    var index = $(this).children().eq(0).text();
    var contextPath = <%= contextPath %>;
    if (index == '공지') {
      index = $(this).attr("value");
      console.log(index);
      location.href = contextPath + "/noticeView.no?nno=" + index;
    }
    else {
      location.href = contextPath + "/detailView.fb?bno=" + index;
    }
  })
})
