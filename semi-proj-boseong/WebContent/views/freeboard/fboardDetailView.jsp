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
<script type="text/javascript" src="resources/script.js"></script>
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
                 <input type="password" class="form-control" id="replyPw" autocomplete="off">
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
                        <input type="password" class="form-control" id="reply-passform" placeholder="댓글 등록시 입력한 비밀번호를 입력해주세요" autocomplete="off">
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
      <!--start of delete comment modal-->
      <div class="modal fade" id="delete-comment-modal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">댓글 비밀번호 입력</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
              댓글을 삭제하시려면 비밀번호를 입력해 주세요:
              <input type="password" class="form-control" id="pass-delete" placeholder="작성시 입력했던 비밀번호" required autocomplete="off">
              <form method="post" action="#">
                <input type="hidden" name="bno" value="<%=fb.getBoardNo()%>"></input>
                <button type="submit" style="float:right" class="btn btn-primary" onclick="checkDelete();">확인</button>
              </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <!-- end of delete comment modal-->

    </div>
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>