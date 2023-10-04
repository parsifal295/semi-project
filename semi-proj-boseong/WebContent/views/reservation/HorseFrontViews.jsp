<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승마장 소개</title>

<style>
	#horse-top{
	width:100%;
	height:45%;
	background-image: url("resources/image/reservation/horsewide.jpg");
	background-size: cover;
	float:left;
	}
	#horse-top>div{
	float:left;}
	#left{
	width:60%;
	height:100%;
	padding-top :250px;
	padding-left:300px;
	}
	#right1{
	width : 20%;
	height:100%;
	}
	#right2{
	width : 20%;
	height : 100%;
	padding-top : 120px;
	padding-left : 20px;}
	#right2>button{
	width:200px;
	height:160px;
	border-radius : 10px;
	margin-bottom:50px;
	}
	
	#horse-bottom{
	width:100%;
	height:55%;
	}
</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
	<div id="box"></div>
	<div class="page" id="content">
			<div id="horse-top">
				<div id="left">
					<h1>승마장 예약</h1>
				</div>
				<div id="right1">
				</div>
				<div id="right2">
					<button onclick="reserveAride();"><h2>예약하기</h2></button>
					<button onclick="rideList();"><h2>예약조회</h2></button>
				</div>
			</div>
			
			<div id="horse-bottom">
				<h2>승마장 소개</h2>
				<hr>
				<pre>
				승마장 소개소개
				</pre>
				<h2>프로그램 소개</h2>
				<hr>
				<pre>
				프로그램 소개소개
				</pre>
				<h3>이용 안내</h3>
				<hr>
				<pre>
				이용 안내안내
				</pre>
		
			</div>
		

	</div>
<%@ include file = "../common/footer.jsp" %>

<script>
//원래는 여기서 둘 다 회원번호를 가져가야 해
	function reserveAride(){
		location.href = "<%=contextPath%>/horseForm.rsv";
	}
	function rideList(){
		location.href = "<%=contextPath%>/list.hs";
	}
</script>

</body>
</html>