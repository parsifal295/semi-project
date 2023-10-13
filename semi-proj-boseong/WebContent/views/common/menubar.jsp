<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% String contextPath =request.getContextPath(); %>
<%@ page import="com.boseong.jsp.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>menubar.jsp</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Kirang+Haerang&family=Nanum+Gothic&display=swap" rel="stylesheet"/>
<!--Bootstrap 4-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
	#menubar {
		margin: 0;
		padding: 0;
		font-size: 30px;
		color: black;
		font-family: "Kirang Haerang", cursive;
		font-family: "Nanum Gothic", sans-serif;
	}
	div {
		box-sizing: border-box;
		border: 1px solid red;
	}
	#wrap {
		width: 100%;
		height: 100vh;
		background-size: cover;
		/* 예시) 사진 → 영상 */
		/* background-image: url("resources/image/semi-boseong/보성사진.jpg");*/
	}
	.page {
		padding: 0;
		margin: 0;
		width: 100%;
		height: 100vh;
		color: black;
	}
	#header {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 200px;
		/* ↓ 스크롤을 해도 같이 내려오는 효과 */
		position: fixed;
		top: 0;
	}
	#content {
		width: 1302px;
		height: 100%;
		margin: auto;
	}
	#login-form {
		font-size: 16px;
		width: 100%;
		text-align: right;
		float: right;
	}
	/* ---------------- navigator 영역 부분 ---------------- */
	#navi {
		width: 60%;
		padding: 0;
		padding-top: 110px;
		padding-right: 100px;
		margin: 0;
		list-style: none;
		text-decoration: none;
		font-size: 22px;
		text-align: right;
		float: right;
		display: block;
	}
	#navi > li {
		float: right;
		height: 100%;
		width: 15%;
		text-align: center;
	}
	#navi a {
		text-decoration: none;
		width: 100%;
		height: 100%;
		display: block;
		line-height: 30px;
	}
	#navi a:hover {
		color: orangered;
	}
	#navi > li > ul {
		background-color: rgba(0, 128, 0, 0.457);
		list-style: none;
		padding: 0;
		display: none;
	}
	#navi > li > a:hover + ul {
		display: block;
	}
	#navi > li > ul:hover {
		display: block;
	}
	#navi > li > ul a {
		font-size: 17px;
	}
	#navi > li > ul a:hover {
		font-size: 20px;
	}
	/* ---------------- navigator 영역 부분 end ---------------- */
	#userBox {
		width: 60px;
		height: 60px;
		position: fixed;
		bottom: 0;
	}
	#logoPlace {
		width: 200px;
		height: 200px;
		margin-left: 50px;
		background-image: url("<%= contextPath %>/resources/image/12.png");
		/*일단은 로고 사진은 임시 */
		background-repeat: no-repeat;
		background-position: center;
		background-size: 100%;
	}
	#box{
	height:210px;
	}
</style>
</head>
<body> 

	<script>
		var msg  = '<%= alertMsg %>';
		
		if(msg != 'null'){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	
	</script>
	
	<div id="menubar">
			
		<div id="header">
			<!-- 회원이 아닐때 보여지는 태그 -->
			<% if(loginUser == null) { %>
				<form action="<%= contextPath %>/login.me" method="post">
					<div id="login-form"><a data-toggle="modal" data-target="#loginForm">로그인</a> | 
					<a data-toggle="modal" data-target="#memberEnrollForm">회원가입</a></div>
				</form>
			<% } else { %>
			
			<!-- 로그인 성공시 보여지는 태그 -->
			
				<div id="user-info">
					<div>
						<a href="<%= contextPath %>/logout.me">로그아웃</a>
					</div>
				</div>
				
				<div id="userBox">
					
						<a style="font-size: 12px" href="<%= contextPath %>/myPage.me">마이페이지</a>
					
				</div>
			<% } %>

			<!-- navigator영역 start -->
			<ul id="navi">
				<li>
					<a href="">커뮤니티</a>
					<ul>
						<li><a href="<%= contextPath %>/fboard.fb?cpage=1">자유게시판</a></li>
						<li><a href="#">도움의 손</a></li>
						<li><a href="<%= contextPath %>/iboard.ib?cpage=1">보성 마켓</a></li>
					</ul>
				</li>
				<li>
					<a href="<%=contextPath%>">갤러리</a>
				</li>
				<li>
					<a href="">예약</a>
					<ul>
						<%if(loginUser!=null && (loginUser.getMemId()).equals("admin")){ %>
						<li><a href="<%=contextPath%>/adminHome.rsv">통합 예약관리</a></li>
						<%}else if(loginUser!=null){ %>
						<li><a href="<%=contextPath%>/resv.all">예약 전체조회</a></li>			
						<%} %>
						<li><a href="<%=contextPath%>/horse.rsv">승마장</a></li>
						<li><a href="<%=contextPath%>/green.ho">녹차밭체험</a></li>
						<li><a href="<%=contextPath%>/hanok.rsv">한옥</a></li>
						<li><a href="<%=contextPath%>/month.main">한달살기</a></li>
						
					</ul>
				</li>
				<li>
					<a href="">특산품</a>
					<ul>
						<li><a href="<%=contextPath%>/list.pr">레시피</a></li>
						<li><a href="<%=contextPath%>/list.rp">구매</a></li>
					</ul>
				</li>
				<li>
					<a href="">보성소개</a>
					<ul>
						<li><a href="<%=contextPath%>/transList.info">교통안내</a></li>
						<li><a href="<%=contextPath%>/tour.li">관광코스</a></li>
						<li><a href="<%=contextPath%>/list.rs">맛집</a></li>
						<li><a href="#">오시는길</a></li>
					</ul>
				</li>
			</ul>
			<!-- navi 영역 end -->
			<div id="logoPlace"></div>
		</div>
	</div>
	<%@ include file = "../member/memberLoginView.jsp" %>
	<%@ include file = "../member/memberEnrollForm.jsp" %>
</body>
</html>
