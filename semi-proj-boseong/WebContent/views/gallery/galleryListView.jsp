<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<style>
	/*--------------------------gallery part----------------------------*/
	#ig-logo{
	    background-image:url('resources/image/ig-logo.png');
	    background-position: center;
	    background-size: cover;
	    width: 100px;
	    height: 100px;
	    margin: auto;
	}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!---------------------인스타그램 갤러리 페이지---------------->
    <div style="height: 200px;"></div>
   	<form action="/gallery.gy" method="post">
       <div id="content">
		<% if(loginUser != null) { %>
			<div style="width : 870;" align="right">
				<a href="<%=contextPath%>/enrollForm.gy" class="btn btn-outline-danger">글작성</a>
			</div>
		<%}%>
		<!-- <% if(list.isEmpty()){ %> -->
		<div class="list-area">
			<!-- 등록된 사진이 없을 경우 -->
			<p>등록된 사진이 없습니다</p>
		<!-- <%}else{ %> -->
			<!-- <% for(Board b : list){ %> -->
			<!-- 등록된 사진이 있을 경우 -->
			<div class="thumbnail" align="center">
				<img src="<%=b.getTitleImg() %>">
			</div>
			<!-- <%} %> -->
		<!-- <%}%>  -->
       </div>
  	 </form>


	<%@ include file="../common/footer.jsp" %>
</body>
</html>