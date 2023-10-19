<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, 
    		com.boseong.jsp.reservation.model.vo.MonthlivingReservation,
    		com.boseong.jsp.reservation.model.vo.Monthlivinginfo"
    %>
    
    <%
    ArrayList<MonthlivingReservation> list = (ArrayList<MonthlivingReservation>)request.getAttribute("list");
	%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한달살기 예약확인페이지</title>

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
		
			<div class="title1"><h4>한달살기 예약</h4></div>
			
			<%
				if(list.isEmpty()){
			%>
			
			<h2 align="center">예약이 없습니다.</h2>
			
			<% } else { %>
			
			
			<table border="1" id="table2">
			<tr bgcolor="#DCDCDC">
				<th width="300" height="40">숙소명</th>
				<th width="350">예약 월</th>
				<th width="250">인원</th>
				<th width="250">가격</th>
				<th width="100">예약번호 </th>
				<th width="100">예약취소 </th>
			</tr>
			
			<% for(int i = 0; i < list.size(); i++) {%>
			
			
			<tr>
			
				<td height="50"><%=list.get(i).getLodgeNo() %> </td>
				<td><%= list.get(i).getStartDate() %></td>
				<td><%=list.get(i).getPeopleNum() %></td>
				<td><%=list.get(i).getPrice() %></td>
				<td><%=list.get(i).getReservationNo() %></td>
				
				<!-- 예약 취소하기 -->
				<!-- 로그인이 되어있고 + 이미 리스트로 위에 들어왓고.  -->
				
				<td>
					<a href="<%= contextPath %>/month.del?nno=<%= list.get(i).getReservationNo()%>" class="btn btn-danger btn-sm" >삭제하기</a>
				</td>
			</tr>
			<%} %>
		<%} %>
			</table>
			
	</div>
	
	</div>
	







	<%@ include file="../common/footer.jsp" %>
</body>
</html>