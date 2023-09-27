<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>www.Boseong.com</title>
<style>
	.front-page{
		padding : 0;
        margin : 0;
        width: 100%;
        height: 100vh;
        color: black;
	}
	#background-image{
		background-image: url(https://t1.daumcdn.net/cfile/blog/1357444D4F66A32929);
		background-repeat : no-repeat;
        background-position : center;
        background-size : 100%
	}
</style>
</head>
<body>
	<%@ include file="../views/common/menubar.jsp" %>
	
	<div class="front-page" id="background-image"></div>
	<div class="page" id="content">
		<div class="page">
			
		</div>
	
		<div class="page">02</div>
	
		<div class="page">03</div>
	</div>
	
	<%@ include file="../views/common/footer.jsp" %>
</body>
</html>
