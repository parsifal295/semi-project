$(() => {
  $("#tb > tbody > tr").click(function () {
    location.href = "<%=contextPath%>/detailView.fb?bno=" + $(this).children().eq(0).text();
  })
})
