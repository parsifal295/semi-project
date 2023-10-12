<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, 
    		com.boseong.jsp.reservation.model.vo.GreenteaReservation"
    %>
    
    <%
    ArrayList<GreenteaReservation> list = (ArrayList<GreenteaReservation>) request.getAttribute("list");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹차밭 예약확인페이지</title>

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
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

	
	<div class="page" id="content">
	<div style="height:200px;"></div>
	
	<div class="page">
	<div class="title"><h2>예약 조회</h2></div>
	<br>
		
			
			<div class="title1"><h4>녹차밭 체험 예약</h4></div>
			
			<%
				if(list.isEmpty()){
			%>
			<h2 align="center">예약이 없습니다.</h2>
			
			<% } else { %>
			
			
			
			<% for(int i = 0; i < list.size(); i++) {%>
			<table border="1" id="table2">
			<tr bgcolor="#DCDCDC">
				<th width="300" height="60">예약 회차</th>
				<th width="350">예약 날짜</th>
				<th width="250">인원</th>
				<th width="250">가격</th>
				<th width="100">예약번호 </th>
				<th width="100">예약취소 </th>
			</tr>
			
			<tr>
				<td height="200"><%=list.get(i).getCourseNum() %> </td>
				<td><%= list.get(i).getStartDate() %></td>
				<td><%=list.get(i).getBookNum() %></td>
				<td>💸무료💸</td>
				<td><%=list.get(i).getReservationNo() %></td>
				
				<!-- 예약 취소하기 -->
				<% if(loginUser != null) && loginUser.getMemNo().equals(list.get(i).get%>
				<td><button type="button" class="btn btn-danger" >예약취소</button></td>
			</tr>
			
			</table>
	</div>
	<%} %>
	<%} %>
	</div>








	<%@ include file="../common/footer.jsp" %>
</body>
</html>