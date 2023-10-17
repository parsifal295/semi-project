<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.boseong.jsp.notice.model.vo.*" %>
<%
  Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>공지사항 View</title>
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
            <td colspan="6">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">제목</span>
                    </div>
                    <p class="form-control" name="title" style="cursor : default"><%=n.getNoticeTitle() %></p>
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
                    ><%=n.getNoticeContent() %></p>
                </div>
            </td>
          </tr>
          <tr>
            <% if ((loginUser != null) && (loginUser.getStatus().equals("A"))) { %>
              <!--관리자 로그인시-->
              <td colspan="2">
                <form action="<%=contextPath%>/updateView.no" method="post">
                  <input type="hidden" name="noticeNo" value="<%= n.getNoticeNo() %>">
                  <input type="hidden" name="title" value="<%= n.getNoticeTitle() %>">
                  <input type="hidden" name="content" value="<%= n.getNoticeContent() %>">
                  <button type="submit" class="btn btn-primary btn-block btn-warning">수정</button>
                </form>
              </td>
              <td colspan="2">
                <a href="<%= contextPath %>/delete.no" class="btn btn-primary btn-block btn-danger" >
                    삭제
                </a>
              </td>
              <td colspan="2">
                <a href="<%= contextPath %>/fboard.fb?cpage=1" class="btn btn-primary btn-block" >
                    목록으로
                </a>
              </td>
            <% } else { %>
              <!--비로그인 상태 혹은 관리자가 아닌 사람이 로그인했을시-->
              <td colspan="6">
                <a href="<%= contextPath %>/fboard.fb?cpage=1" class="btn btn-primary btn-block" >
                    목록으로
                </a>
              </td>
          <% } %>
          </tr>
        </tbody>
      </table>
    </div>
    <%@ include file = "../common/footer.jsp" %>
  </body>
</html>