$(() => {
  $("#tb > tbody > tr").click(function () {
    location.href = "detailView.fb?bno=" + $(this).children().eq(0).text();
  })
})
