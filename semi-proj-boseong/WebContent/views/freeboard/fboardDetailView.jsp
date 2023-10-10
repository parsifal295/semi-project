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
            <tr>
            <td>
              <div class="form-group">
                <label for="reply">Comment:</label>
                <textarea class="form-control" rows="3" id="reply" required style="resize:none"></textarea>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <button class="btn btn-primary btn-block">댓글등록</button>
            </td>
          </tr>
          </thead>
          <tbody></tbody>
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
      <!-- end of delete modal -->
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
      // function selectReplyList() {
      //   $.ajax({
      //     url : 'replylist.fb',
      //     data : {bno : <%= b.getBoardNo() %>},
      //     success : function(result) {
      //       // 댓글 개수만큼 루프반복 (댓글전체출력을 위해서..)
      //       let resultStr = '';
      //       for (let i in result) {
      //         resultStr += '<tr>'
      //                   + '<td>' + result[i].replyWriter + '</td>'
      //       }
      //       $('#reply-area tbody').html(resultStr);
      //     }
      //   })
      // }
    </script>
</body>
</html>