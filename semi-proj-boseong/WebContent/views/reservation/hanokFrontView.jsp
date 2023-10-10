<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성 한옥스테이</title>

<style>
@font-face {
	font-family: 'Hangeuljaemin4-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#content *{
	font-family: 'Hangeuljaemin4-Regular';
}

#main-pic {
	width: 100%;
	height: 70%;
	box-sizing: border-box;
	background:
		url("<%=request.getContextPath() %>/resources/image/reservation/building1.jpeg");
	background-size: cover;
}

#main-pic>button {
	margin-top: 500px;
	border: lightblue;
}

#main-pic>div{
	padding : 100px;
	color:white;
}
#main-pic>a{text-decoration:none;}
#main-pic h1{
text-shadow: 1px 2px 2px gray;
}

#rooms {
	width: 100%;
	height: 30%;
	box-sizing: border-box;
}

.room {
	float: left;
	width: 415px;
	height: 260px;
	box-sizing: border-box;
	margin: 8px;
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

</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="page" id="content">
		<div id="box"></div>
		<div class="page">
			<div id="main-pic">
			<%if(loginUser != null){ %>
				<button class="btn btn-info btn-lg btn-block" id="reserv-hanok">
					<h1>예약 하기</h1>
				</button>
			<%}else{ %>
				<div><h1>예약하려면 로그인하세요!</h1></div>
			<%} %>
			</div>
			<div id="rooms">
				<div class="room">
					<img src="<%=contextPath %>/resources/image/reservation/room1.avif"
						alt="">
					<h1>room1</h1>
				</div>
				<div class="room">
					<img src="<%=contextPath %>/resources/image/reservation/room2.avif"
						alt="">
					<h1>room2</h1>
				</div>
				<div class="room">
					<img src="<%=contextPath %>/resources/image/reservation/room4.jpeg"
						alt="">
					<h1>room3</h1>
				</div>
			</div>

		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script>
    let rooms = document.getElementsByClassName("room");
    for(i=0; i<rooms.length;i++){
    	let roomNo = i+1;
        rooms[i].onclick= function(){
            location.href="<%=contextPath%>/roomdetail.rsv?roomNo="+roomNo;
            return;
        }
    }
    $(function(){
    	$('#main-pic')
    	.css('background', 'url="<%=contextPath%>/resources/image/reservation/horsewide.jpg"');
    	$('#reserv-hanok').click(function(){location.href="<%=contextPath%>/hanokForm.rsv"});
    })
	</script>


</body>
</html>








































