function passwordCheck() {
  var temp = <%= fb.getPassword() %>;
  var pw1 = $("#passwd").val();
  var pw2 = $("#pass").val();
  if (pw1 == temp) {
    // 암호 일치시 : 수정 페이지로 가기
    $("#checker").submit(function (e) {
      $(this).attr("action", "<%=contextPath %>/updateForm.fb");
    })
  }
  if (pw2 == temp) {
    $("#chkr").submit(function (f) {
      $(this).attr("action", "<%=contextPath %>/deleteForm.fb");
    })
  }
};

function checkDelete() {
  var rNum = $('#reply-number').attr("value");
  console.log(rNum);
  var usrPass = $('#pass-delete').val();
  var boardNo = <%=fb.getBoardNo() %>;
  $.ajax({
    url: 'deleteReply.fb',
    data: {
      bno: boardNo,
      rNum: rNum,
      usrPass: usrPass
    },
    success: function (result) {
      if (result == 1) {
        alert('댓글 삭제 성공');
      } else {
        alert('댓글 삭제 실패');
      }
    },
  })
  location.href = "<%=contextPath%>/detailView.fb?bno=" + boardNo;
};
function insertReply() {
  $.ajax({
    url: 'replyinsert.fb',
    type: 'POST',
    data: {
      bno: <%= fb.getBoardNo() %>,
      id: $('#replyId').val(),
      pw: $('#replyPw').val(),
      content: $('#replyContent').val(),
      ip: $('#displayIp').val()
    },
    success: function (result) {
      if (result > 0) {
        $('#replyId').val('');
        $('#replyPw').val('');
        $('#replyContent').val('');
        selectReplyList();
      }
    }
  });
  location.reload();
};
function selectReplyList() {
  $.ajax({
    url: 'replylist.fb',
    data: { bno: <%= fb.getBoardNo() %>},
    success: function (result) {
      // 댓글 개수만큼 루프반복 (댓글전체출력을 위해서..)
      let resultStr = '';
      for (let i in result) {
        resultStr += '<tr>'
          + '<td width="200">' + result[i].writer + "(" + result[i].ipAddress + ")" + '</td>'
          + '<td width="300" align="center">' + result[i].createDate + '</td>'
          + '<td width="100" align="right">'
          + '<a href = "#" onclick="showEditReply(this);" data-toggle="modal" data-target="#editCommentModal" value="'
          + result[i].replyNo + '">수정</a>' + ' | '
          + '<a href = "#" data-toggle="modal" id="reply-number" data-target="#delete-comment-modal" value="'
          + result[i].replyNo + '">삭제</a>' + '</td>'
          + '</tr>'
          + '<tr>'
          + '<td colspan="3" id="comment-text' + result[i].replyNo + '">' + result[i].content + '</td>'
          + '</tr>' + '</hr>';
      }
      $('#reply-area thead').html(resultStr);
    },
    error: function (e, msg) {
      console.log('댓글 읽어오기 실패~');
      console.log(msg);

    }
  })
};
$(() => {
  selectReplyList();
  //setInterval(selectReplyList, 1000);
});

function showEditReply(f) {
  var rNum = $(f).attr("value");
  $.ajax({
    url: 'replyUpdateForm.fb',
    data: {
      replyNo: rNum,
      bno: <%= fb.getBoardNo() %>
    },
    success: function (result) {
      $('#reply-number').attr("value", rNum);
      $('#replyEdit').val(result.content);
      $('#reply-password').attr("value", result.password);
    }
  })
};
function checkReplyPassword() {
  var userPwd = $('#reply-passform').val();
  var replyPwd = $('#reply-password').val();
  var replyToUpdate = $('#replyEdit').val();
  var boardNo = <%= fb.getBoardNo() %>
  // 암호 일치시 
  if (userPwd == replyPwd) {
    $.ajax({
      url: 'updateReply.fb',
      data: {
        replyNo: $('#reply-number').attr("value"),
        bno: boardNo,
        reply: replyToUpdate
      },
      success: $(() => {
        alert('댓글이 성공적으로 수정되었습니다.'),
          location.href = "<%=contextPath%>/detailView.fb?bno=" + boardNo
      })
    })
  } else {
    alert('비밀번호가 틀립니다.');
    $(() => {
      location.href = "<%=contextPath%>/detailView.fb?bno=" + boardNo;
    })
  }
};
// GET IP ADDRESS
$.getJSON("https://jsonip.com/", function (data) {
  var obj = JSON.stringify(data, null, 2);
  var temp = JSON.parse(obj, null, 2);
  console.log(obj);
  var ip = temp.ip;
  $("#ipvalue").val(ip);
  $("#displayIp").val(ip);
});
