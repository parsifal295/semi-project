<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </div>
</body>
</html>