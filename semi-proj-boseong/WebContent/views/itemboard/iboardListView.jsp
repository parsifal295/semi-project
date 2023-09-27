<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성마켓</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="front-page" id="background-image"></div>
	<div class="page" id="content">
	<div style="height : 300px; text-align: center;"></div>
		<div class="page">
			<a type="submit" href="<%= contextPath %>/enrollform.ib">글작성</a>
			<table class="table">
		    <thead class="thead-light">
		      <tr>
		        <th>No.</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일시</th>
		        <th>가격</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>공지</td>
		        <td>욕설,폭언 등..은 안됩니다...</td>
		        <td>관리자</td>
		        <td>2023-05-12</td>
		        <td> - </td>
		      </tr>
		      <tr>
		        <td>1</td>
		        <td>호미 팔아요</td>
		        <td>보성토박이</td>
		        <td>2023-06-12</td>
		        <td>80,000원</td>
		      </tr>
		    </tbody>
		  </table>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>