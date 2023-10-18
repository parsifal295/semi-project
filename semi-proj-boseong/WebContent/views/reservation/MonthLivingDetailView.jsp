<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boseong.jsp.reservation.model.vo.Monthlivinginfo" %>    
<%
	int lodgeNo = (int)request.getAttribute("lodgeNo");
	Monthlivinginfo m = (Monthlivinginfo)request.getAttribute("Monthlivinginfo");
	String img = "";
	switch(lodgeNo){
	case 1 : img = "house1.jpg"; break;
	case 2 : img = "house2.jpg"; break;
	case 3 : img = "house3.jpg"; break;
}
%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한달살기 상세페이지(예약하기에다가 lodgeno를 여기서 보내줘야댄다...) </title>
<style>

	.page{
		padding:0;
		margin:0;
		width:100%;
		height : 100vh;
		color : black;
	}

	#content{
		width : 1302px;
		height : 100%;
		margin : auto;
	}

	.allouter{
	width:1500px;
	height : 2000px;
	align : center;
	margin : auto;
	}

	.title{
	width:1340px;
	height:100px;
	float : left;
	}
	
	.reserv_btn{
	width:150px;
	height:100px;
	float : right;
	}

	.mainpic{
	margin-bottom:70px;
	
	}
	
	.room_info{
	margin-bottom:70px;
	}
	
	.map{
	margin-bottom:70px;
	width:700px;
	height:540px;
	}
	
	.calender{
	margin-bottom:70px;
	margin-left:90px;
	width:700px;
	height:540px;
	float:left;
	}
	

</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>

	<div class="page" style="height:1500px; width:1800px;">
		<div class="page" style="height:300px;" ></div>
		
		
		<div class="page" style="height:1500px; width:1800px; margin-left:1em;">
			<div class="title">
				<h3><strong><%=m.getLodgeName()%></strong></h3>
			</div>
				
				
			<% if(loginUser != null){ %>	
			<div class="reserv_btn">
				<form action="<%=contextPath%>/month.fo" method="post">
					<input type="hidden" id="memNo" name="memNo" value="<%= loginUser.getMemNo() %>">
					<input type="hidden" id="lodgeNo" name="lodgeNo" value="<%=m.getLodgeNo() %>">
							
					<button type="submit" class="btn btn-primary btn-lg" >예약하기</button>
				</form>
			</div>
			<% } %>
			
			
			<div class="main_image">
				<div class="mainpic">
					<img src="<%=contextPath %>/resources/image/reservation/<%=img %>" alt="Monthlivinginfo<%=lodgeNo%>" style="width:1800px; height:800px; ">
				</div>
			</div>
				

			<div class="room_info">
				<h2>숙소 소개</h2>
				<hr>
				
				<table>
					<tr>
						<th>위치:<%=m.getLodgeLocation()%></th>
						<th></th>
					</tr>
				
					<tr>
						<td><b>가격(1달):<%=m.getPrice()%></b></td>
						<td></td>
					</tr>
					
				</table>
				
				<b>상세정보:</b>
					<%=m.getLodgeInfo() %>
				<br>
				<b>공통 안내사항:</b>
					반려동물 입장은 불가합니다.<br>
					연락처 오기재로 미확인시 책임지지 않습니다.<br>
			</div>
		</div>	
	</div>
			
		<script>
		function list(memNo){
			location.href = "<%=contextPath%>/month.in?memNo="+memNo;
			location.href = "<%=contextPath%>/month.in?lodgeNo="+lodgeNo;
		}
		</script>
		
		
<%@ include file="../common/footer.jsp" %>

</body>
</html>