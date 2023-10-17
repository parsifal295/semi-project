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
    <title>공지사항 수정</title>
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
          <form action="<%= contextPath %>/updateNotice.no" method="post">
            <input type="hidden" name="noticeNo" value="<%= n.getNoticeNo() %>">
          <tr>
            <td colspan="6">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">제목</span>
                </div>
                <input type="text" class="form-control" name="title" required value="<%=n.getNoticeTitle()%>" />
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="6">
              <div class="form-group">
                <label for="comment">글 수정: </label>
                <textarea
                  class="form-control"
                  rows="10"
                  id="article"
                  name="content"
                  required
                  style="resize:none"
                ><%=n.getNoticeContent()%></textarea>
              </div>
            </td>
          </tr>
          <tr>
              <td colspan="6">
                <button type="submit" class="btn btn-primary btn-warning" >
                    수정하기
                </button>
              </form>
              </td>
          </tr>
        </tbody>
      </table>
    </div>
    <%@ include file = "../common/footer.jsp" %>
  </body>
</html>
