<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.boseong.jsp.freeboard.model.vo.*, com.boseong.jsp.Attachment.model.vo.*" %>
<%
   Freeboard fb = (Freeboard)request.getAttribute("fb");
   Attachment att = (Attachment)request.getAttribute("att");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 View</title>
<style>
    td {
        padding: 2px;
    }
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>
    <div class="outer" id="content">
    <div style="height: 250px"></div>
      <table class="table table-borderless table-sm" align="center" style="width: 50%">
          <thead>
              <tr>
                  <th width="100"></th>
                  <th width="100"></th>
                  <th width="100"></th>
                  <th width="100"></th>
                  <th width="100"></th>
                  <th width="100"></th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td colspan="2">
                      <div class="input-group input-group-sm">
                          <div class="input-group-prepend">
                              <span
                                  class="input-group-text"
                                  data-toggle="tooltip"
                                  title="닉네임을 입력해주세요."
                                  >닉네임</span
                              >
                          </div>
                          <p class="form-control" name="nickname" style="cursor : default"><%=fb.getWriter() %></p>
                      </div>
                  </td>
                  <td colspan="2">
                      <div class="input-group input-group-sm">
                          <div class="input-group-prepend">
                              <span
                                  class="input-group-text"
                                  data-toggle="tooltip"
                                  title="비밀번호를 잊어버리면 글 수정 및 삭제가 불가능합니다."
                                  >조회수</span
                              >
                          </div>
                          <p class="form-control" name="viewcount" style="cursor : default"><%=fb.getCount() %></p>
                      </div>
                  </td>
                  <td colspan="2">
                      <div class="input-group input-group-sm">
                          <div class="input-group-prepend">
                              <span
                                  class="input-group-text"
                                  data-toggle="tooltip"
                                  title="현재 IP 주소"
                                  >IP주소</span
                              >
                          </div>
                          <p class="form-control" id="ipaddr" style="cursor : default"><%=fb.getIpAddress() %></p>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td colspan="6">
                      <div class="input-group">
                          <div class="input-group-prepend">
                              <span class="input-group-text">제목</span>
                          </div>
                          <p class="form-control" name="title" style="cursor : default"><%=fb.getTitle() %></p>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td colspan="6">
                      <div class="form-group">
                          <label for="comment">글 내용: </label>
                          <p
                              class="form-control"
                              id="article"
                              name="content"
                              style="cursor : default"
                          ><%=fb.getContent() %></p>
                      </div>
                  </td>
              </tr>
              <tr>
                <td colspan="6">
                  <div class="input-group input-group-sm">
                      <div class="input-group-prepend">
                          <span
                              class="input-group-text"
                              data-toggle="tooltip"
                              title="비밀번호를 잊어버리면 글 수정 및 삭제가 불가능합니다."
                              >첨부파일</span
                          >
                      </div>
                      <% if (att == null) { %>
                        <p class="form-control" name="viewcount" style="cursor : default">첨부파일 없음</p>
                      <% } else { %>
                        <a href="<%=contextPath %>/<%=att.getSavePath()%>/<%= att.getModifiedName()%>" download="<%= att.getOriginName()%>"><%= att.getOriginName()%></a>
                      <% } %>
                      
                  </div>
              </td>
              </tr>
              <tr>
                  <td colspan="2">
                      <button type="button" class="btn btn-warning btn-block" data-toggle="modal" data-target="#updateModal">
                          수정
                      </button>
                  </td>
                  <td colspan="2">
                    <button type="submit" class="btn btn-danger btn-block" data-toggle="modal" data-target="#deleteModal" >
                        삭제
                    </button>
                </td>
                <td colspan="2">
                  <a href="<%= contextPath %>/fboard.fb?cpage=1" class="btn btn-primary btn-block" >
                      목록으로
                  </a>
              </td>
              </tr>
          </tbody>
      </table>
      <div id="reply-area">
        <table align="center" style="width: 50%">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td width="200">
                  <input type="hidden" name="ip" id="ipvalue" value=""></input>
                  <div class="input-group mb-3 input-group-sm">
                     <div class="input-group-prepend">
                       <span class="input-group-text">닉네임</span>
                    </div>
                    <input type="text" class="form-control" id="replyId">
                  </div>
              </td>
              <td width="200">
                <div class="input-group mb-3 input-group-sm">
                  <div class="input-group-prepend">
                    <span class="input-group-text">비밀번호</span>
                 </div>
                 <input type="password" class="form-control" id="replyPw">
               </div>
              </td>
              <td width="200">
                <div class="input-group mb-3 input-group-sm">
                  <div class="input-group-prepend">
                    <span class="input-group-text">IP 주소</span>
                 </div>
                 <input type="text" class="form-control" readonly id="displayIp" name="replyIp">
               </div>
              </td>
            
            </tr>
            <tr >
            <td colspan ="3">
              <div class="form-group">
                <label for="reply">Comment:</label>
                <textarea class="form-control" id="replyContent" rows="3" name="reply" required style="resize:none"></textarea>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan ="3">
              <button onclick="insertReply();"class="btn btn-primary btn-block">댓글등록</button>
            </td>
          </tr>
        </tbody>
        <input type="hidden" name="bno" value="<%=fb.getBoardNo()%>"></input>
        </table>
      </div>
      <!--update modal-->
      <div class="modal fade" id="updateModal">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">게시글 암호 입력</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
              <div class="form-group">
                <label for="passwd">게시글을 수정하시려면 암호를 입력해 주세요:</label>
                <input type="text" class="form-control" id="passwd" required>
              </div>
              <form action="" method="post" id="checker" method="post">
                <input type="hidden" name="bno" value="<%=fb.getBoardNo()%>"></input>
                <button type="submit" style="float:right" class="btn btn-primary" onclick="passwordCheck();">확인</button>
              </form>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
            
          </div>
        </div>
      </div>
      <!-- end of update modal -->
      <!--delete modal-->
      <div class="modal fade" id="deleteModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">게시글 암호 입력</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
              게시글을 삭제하시려면 암호를 입력해 주세요:
              <input type="text" class="form-control" id="pass" required>
              <form action="" method="post" id="chkr" method="post">
                <input type="hidden" name="bno" value="<%=fb.getBoardNo()%>"></input>
                <button type="submit" style="float:right" class="btn btn-primary" onclick="passwordCheck();">확인</button>
              </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <!--start of edit comment modal-->
      <div class="modal fade" id="editCommentModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">댓글수정</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body" id="edit-reply-area">
              <form method="post" action="<%=contextPath%>/updateReply.fb" >
                <input type="hidden" name="bno" value="<%=fb.getBoardNo()%>">
                <input type="hidden" id="reply-password" name="replyPass" value=""> 
                <input type="hidden" id="reply-number" name="rNum" value=""> 
              <table align="center" style="width: 90%">
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td colspan = "3">
                      <div class="input-group mb-3 input-group-sm">
                        <div class="input-group-prepend">
                          <span class="input-group-text" >비밀번호</span>
                        </div>
                        <input type="password" class="form-control" id="reply-passform" placeholder="댓글 등록시 입력한 비밀번호를 입력해주세요">
                      </div>
                    </td>
                  </tr>
                  <tr >
                  <td colspan ="3">
                    <div class="form-group">
                      <label for="reply">Comment:</label>
                      <textarea class="form-control" id="replyEdit" rows="3" name="reply" required style="resize:none"></textarea>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan ="3">
                    <button onclick="checkReplyPassword();"class="btn btn-primary btn-block">댓글수정</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <!--end of edit comment modal-->

    </div>
    <%@ include file = "../common/footer.jsp" %>
    <script>
      function passwordCheck() {
        var temp = <%= fb.getPassword() %>;
        var pw1 = $("#passwd").val();
        var pw2 = $("#pass").val();

        if (pw1 == temp) {
          // 암호 일치시 : 수정 페이지로 가기
          $("#checker").submit(function(e) {
            $(this).attr("action", "<%=contextPath %>/updateForm.fb");
          })
        }

        if (pw2 == temp) {
          $("#chkr").submit(function(f) {
            $(this).attr("action", "<%=contextPath %>/deleteForm.fb");
          })
        }
      };
    </script>
    <script>
      function insertReply() {
        $.ajax({
          url : 'replyinsert.fb',
          type : 'POST',
          data : { 
            bno : <%= fb.getBoardNo() %>,
            id : $('#replyId').val(),
            pw : $('#replyPw').val(),
            content : $('#replyContent').val(),
            ip : $('#displayIp').val()
        },
          success : function (result) {
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
    </script>
    <script>
      function selectReplyList() {
        $.ajax({
          url : 'replylist.fb',
          data : {bno : <%= fb.getBoardNo() %>},
          success : function(result) {
            // 댓글 개수만큼 루프반복 (댓글전체출력을 위해서..)
            let resultStr = '';
            for (let i in result) {
              resultStr += '<tr>'
                        + '<td width="200">' + result[i].writer + "(" + result[i].ipAddress + ")" + '</td>'
                        + '<td width="300" align="center">' + result[i].createDate + '</td>'
                        + '<td width="100" align="right">'
                        + '<a href = "#" onclick="showEditReply(this);" data-toggle="modal" data-target="#editCommentModal" value="' + result[i].replyNo + '">수정</a>' + ' | ' + '<a href=#>삭제</a>' + '</td>'
                        + '</tr>'
                        + '<tr>'
                        + '<td colspan="3" id="comment-text'+result[i].replyNo+'">' + result[i].content + '</td>'
                        + '</tr>'+ '</hr>';
            }
            $('#reply-area thead').html(resultStr);
          },
          error : function(e, msg){
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
          url : 'replyUpdateForm.fb',
          data : {
            replyNo : rNum,
            bno : <%= fb.getBoardNo() %>
          },
          success : function(result) {
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
            url : 'updateReply.fb',
            data : {
              replyNo : $('#reply-number').val(),
              bno : boardNo,
              reply : replyToUpdate
            },
            success : $(()=>{
              alert('댓글이 성공적으로 수정되었습니다.'),
              location.href = "<%=contextPath%>/detailView.fb?bno=" + boardNo
            })
          })
        } else {
          alert('비밀번호가 틀립니다.');
        }
      };  
    </script>
    <script>
      // GET IP ADDRESS
      $.getJSON("https://jsonip.com/", function (data) {
        var obj = JSON.stringify(data, null, 2);
        var temp = JSON.parse(obj, null, 2);
        console.log(obj);
        var ip = temp.ip;
        $("#ipvalue").val(ip);
        $("#displayIp").val(ip);
      });
    </script>
</body>
</html>