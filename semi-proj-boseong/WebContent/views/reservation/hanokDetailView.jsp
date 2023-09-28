<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room1 상세정</title>
<style>
	#box{height:200px}
	#detail>div{
	float:left;
	}
	#room-pictures>img{
		width: 100%;
		padding: 10px;
	}
</style>

</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
<div id="box"></div>
<div class="page" id="content">
	<div class="page">
		<div id="room-pictures">
			<img src="https://ak-d.tripcdn.com/images/1mj3c12000afkz4hxCEB4_C_800_600_R5.jpg_.webp?proc=autoorient" alt="">
		</div>
		
		<div>
		<h3>객실 특</h3>
		<p>
		어쩌고저쩌
		</p>
		</div>
		
		<div id="detail">
		<div>
			<h3>객실 정보 </h3>
		</div>
		<div>
			<h3>각 공간 설명 </h3>
		</div>
		</div>
	</div>

</div>
<%@ include file = "../common/footer.jsp" %>
</body>
</html>