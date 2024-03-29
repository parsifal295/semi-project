<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성 한옥스테이</title>

<style>
@font-face {
    font-family: '국립박물관문화재단클래식B';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/국립박물관문화재단클래식B.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#main-pic {
	width: 100%;
	height: 70%;
	box-sizing: border-box;
	background:
		url("<%=request.getContextPath() %>/resources/image/reservation/building1.jpg");
	background-size: contain;
}
#main-pic button{
position: relative;
font-family: '국립박물관문화재단클래식B';
top : 430px;
}

#main-pic>div{
	padding : 100px;
	color:white;
}
#main-pic>a{text-decoration:none;}

#rooms {
	width: 100%;
	height: 30%;
	box-sizing: border-box;
}

.room {
	float: left;
	width: 432px;
	height: 260px;
	box-sizing: border-box;
	margin: 1px;
}

.room>img {
	width: 100%;
	height: 100%;
}

.room>h1 {
	color: white;
	text-shadow: 1px 2px 2px gray;
	position: relative;
	top: -150px;
	left: 150px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/reservation/hanokScript.js"></script>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">
		<div class="page">
			<div id="main-pic">
			<c:choose>
			<c:when test="${empty loginUser }">
			<div><h1>예약하려면 로그인하세요!</h1></div>
			</c:when>
			<c:otherwise>
				<button class="btn btn-outline-light btn-block" id="reserv-hanok">
					<h1>예약 하기</h1>
				</button>
				<button class="btn btn-outline-light btn-block" id="hk-reserv-list"><h1>예약 조회</h1></button>
				<script>
				$(function(){
			    	$('#hk-reserv-list').click(function(){location.href="<%=contextPath%>/list.hk?memNo=${loginUser.memNo}&cpage=1"});
				})
				</script>
				</c:otherwise>
			</c:choose>	
			</div>
			<div id="rooms">
				<div class="room">
					<img src="../../resources/image/reservation/room1.avif"
						alt="">
					<h1>room1</h1>
				</div>
				<div class="room">
					<img src="../../resources/image/reservation/room2.avif"
						alt="">
					<h1>room2</h1>
				</div>
				<div class="room">
					<img src="../../resources/image/reservation/room4.jpeg"
						alt="">
					<h1>room3</h1>
				</div>
			</div>

		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>








































