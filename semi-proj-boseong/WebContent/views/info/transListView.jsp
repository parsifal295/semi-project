<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교통정보 안내</title>
<style>
	#box{
	height:200px
	}
	#content{
		font-family: "Kirang Haerang", cursive;
		font-family: "Nanum Gothic", sans-serif;
	}
	#trans-list>div{
		float: left;
		width: 250px;
		height: 600px;
		box-sizing: border-box;
		margin-left: 60px;
	}
	#trans-list{
	padding-top : 50px;
	}
	#trans-list>div{
	border-radius : 5px;}
	#trans-list img{
		width:100%;
		height :250px;
	}
	#trans-list h3{
		text-align: center;
		font-weight : 500;
	}
	.empty-box{
		width:100%;
		height:140px;
	}
	
</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
	<div id="box"></div>
	<div class="page" id="content">
		<h1>교통정보 안내</h1>
		<br>
		<div class="page" id="trans-list">
			<div>
				<div class="empty-box" onclick="showMore(toBus);"></div>
				<div><img src="<%=contextPath %>/resources/image/transportation/toBus.jpg" alt=""></div>
				<p><h3>시외 버스</h3></p>
				<div class="empty-box"></div>
			</div>
			
			<div>
				<div class="empty-box"></div>
				<div><img src="<%=contextPath %>/resources/image/transportation/train.png" alt=""></div>
				<p><h3>기차</h3></p>
				<div class="empty-box"></div>
			</div>
			
			<div>
				<div class="empty-box"></div>
				<div><img src="<%=contextPath %>/resources/image/transportation/taxi.png" alt=""></div>
				<p><h3>택시</h3></p>
				<div class="empty-box"></div>
			</div>
			
			<div>
				<div class="empty-box"></div>
				<div><img src="<%=contextPath %>/resources/image/transportation/inBus.png" alt=""></div>
				<p><h3>시내 버스</h3></p>
				<div class="empty-box"></div>
			</div>
		</div>	
	</div>
	<script>
		function showMore(type){
			
		}
	</script>
<%@ include file = "../common/footer.jsp" %>
</body>
</html>