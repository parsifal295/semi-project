<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>공지사항 작성하기</title>
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
          <form action="<%= contextPath %>/write.no" method="post">
            <input type="hidden" name="category" value="10">
          <tr>
            <td colspan="6">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">제목</span>
                </div>
                <input type="text" class="form-control" name="title" required />
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="6">
              <div class="form-group">
                <label for="comment">글 작성하기: </label>
                <textarea
                  class="form-control"
                  rows="10"
                  id="article"
                  name="content"
                  required
                  style="resize:none"
                ></textarea>
              </div>
            </td>
          </tr>
          <tr>
              <td colspan="6">
                <button type="submit" class="btn btn-primary btn-warning" >
                    작성하기
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
