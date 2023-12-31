<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script type="text/javascript" src="resources/scripts/freeboard/fboardUpdateViewScript.js"></script>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <div class="outer" id="content">
    <div style="height: 250px"></div>
      <table class="table table-borderless table-sm" align="center" style="width: 50%">
        <form enctype="multipart/form-data" action="updateArticle.fb" method="post">
          <input type="hidden" name="bno" value="${requestScope.fb.boardNo}"/>
          <c:if test="${requestScope.att ne null}">
            <input type="hidden" name="originFileNo" value="${requestScope.att.fileNo}"/>
            <input type="hidden" name="originFileName" value="${requestScope.att.modifiedName}"/>
          </c:if>
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
                                  title="닉네임은 수정이 불가능합니다."
                                  >닉네임</span
                              >
                          </div>
                          <input class="form-control" name="nickname" style="cursor : default" value="${requestScope.fb.writer}" readonly/>
                      </div>
                  </td>
                  <td colspan="2">
                      <div class="input-group input-group-sm">
                          <div class="input-group-prepend">
                              <span
                                  class="input-group-text"
                                  data-toggle="tooltip"
                                  title="변경할 비밀번호를 입력해주세요."
                                  >비밀번호</span
                              >
                          </div>
                          <input class="form-control" type="password" name="password" style="cursor : default" value="${requestScope.fb.password}" required/>
                      </div>
                  </td>
                  <td colspan="2">
                      <div class="input-group input-group-sm">
                          <div class="input-group-prepend">
                              <span
                                  class="input-group-text"
                                  data-toggle="tooltip"
                                  title="현재 IP 주소(변경불가)"
                                  >IP주소</span
                              >
                          </div>
                          <input class="form-control" id="ipaddr" style="cursor : default" value="${requestScope.fb.ipAddress}" readonly/>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td colspan="6">
                      <div class="input-group">
                          <div class="input-group-prepend">
                              <span class="input-group-text">제목</span>
                          </div>
                          <input class="form-control" name="title" style="cursor : default" value="${requestScope.fb.title}" required/>
                      </div>
                  </td>
              </tr>
              <tr>
                  <td colspan="6">
                      <div class="form-group">
                          <label for="comment">글 내용: </label>
                          <textarea
                          class="form-control"
                          rows="10"
                          id="article"
                          name="content"
                          required
                        >${requestScope.fb.content}</textarea>
                      </div>
                  </td>
              </tr>
              <tr>
                <td colspan="6">
                  <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="upfile" />
                    <label class="custom-file-label" for="customFile">파일 첨부</label>
                  </div>
                </td>
              </tr>
              <tr>
                  <td colspan="3">
                      <button type="submit" class="btn btn-success btn-block">
                          수정 완료
                      </button>
                  </td>
                <td colspan="3">
                  <a href="fboard.fb?cpage=1" class="btn btn-primary btn-block" >
                      목록으로
                  </a>
              </td>
              </tr>
          </tbody>
        </form>
      </table>
    </div>
    <script>
   $(() => {
    $('[data-toggle="tooltip"]').tooltip();

  // 첨부파일이 있을 경우 => 첨부파일의 이름을 표시
    var attFile;
  <c:if test="${requestScope.att ne null}">
    attFile = "${requestScope.att.originName}"
  </c:if>
 if (attFile != undefined) {
    $(".custom-file-label").addClass("selected").html(attFile);
  } else {

  }

  $(".custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  });
})
    </script>
</body>
</html>