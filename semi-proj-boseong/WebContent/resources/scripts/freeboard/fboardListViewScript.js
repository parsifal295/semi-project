$(() => {
  $("#tb > tbody > tr").click(function () {
    var index = $(this).children().eq(0).text();
    if (index == '공지') {
      index = $(this).attr("value");
      console.log(index);
      location.href = "noticeView.no?nno=" + index;
    }
    else {
      location.href = "detailView.fb?bno=" + index;
    }
  })
})