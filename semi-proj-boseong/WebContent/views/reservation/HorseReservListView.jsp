<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.boseong.jsp.reservation.model.vo.HorseReservation,
	com.boseong.jsp.freeboard.model.vo.PageInfo"%>

<%
	ArrayList<HorseReservation> list = (ArrayList<HorseReservation>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승마장 예약 확인</title>
<style>
@font-face {
    font-family: 'GangwonEduHyeonokT_OTFMediumA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduHyeonokT_OTFMediumA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#content *{
font-family: 'GangwonEduHyeonokT_OTFMediumA';}
ul, li {
	list-style: none;
	padding:0;
	margin:0;
}
h1{font-size:35px;}

#horse-reserv-list {
	font-size: 30px;
}

#horse-reserv-list fieldset {
	width: 90%;
	padding-left: 0;
	margin-bottom:10px;
	margin-left:50px;
}

#horse-reserv-list th, #horse-reserv-list td {
	padding-left: 50px;
	padding-top:5px;
	padding-bottom:5px;
	width: 300px;
}

#horse-reserv-list div {
	border-radius: 20px;
	margin-right: 15px;
	margin-bottom : 10px;
}
.horse-reserv{
border:5px solid white;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/reservation/horseScript.js"></script>

</head>
<body>

	<%@include file="../common/menubar.jsp"%>
	<%int memNo = (loginUser == null)? 0 : loginUser.getMemNo(); %>
	<div id="box"></div>
	<div class="reserv-page">
	<div class="page" id="content">
		
		<div class="page">
			<h1>예약 조회</h1>
			<div class="reserv-paging-area btn-group">
				<%if(currentPage!=1){ %>
					<button class="btn btn-lg" onclick="reservPageShift('<%=currentPage-1%>','<%=memNo%>');">&lt;</button>
				<%} %>
				<%for(int i=startPage;i<endPage+1;i++){ %>
					<%if(currentPage != i){ %>
					<button class="btn btn-lg" onclick="reservPageShift('<%=i%>','<%=memNo%>');"><%=i %></button>
					<%}else{ %>
					<button class="btn btn-lg" disabled><%=i%></button>
					<%} %>
				<%} %>
				<%if(currentPage != maxPage){ %>
					<button class="btn btn-lg" onclick="reservPageShift('<%=currentPage+1%>','<%=memNo%>');">&gt;</button>
				<%} %>
			</div>	
			<ul id="horse-reserv-list">
					<%
						if (list.isEmpty()) {
					%>
					<h1>예약이 없습니다.</h1> 
					<%} else {%> 
						<%for (HorseReservation hr : list) {%>
						<%System.out.println(hr); %>
				<li>
					<fieldset>
						<legend>
							<h2><%=hr.getProgramNo() %></h2>
						</legend>
						<div class="horse-reserv">
							<table>

								<tr>
									<td><%=hr.getReservNo() %></td>
									<td><h5>예약일</h5><%=hr.getHorseDate() %></td>
									<td><h5>예약 시간</h5><%=hr.getHorseTime() %></td>
									<td><h5>예약 인원</h5><%=hr.getRiderNum() %></td>
									<td>
									<button class="btn btn-warning update-hs">예약 변경</button>
									<button class="btn btn-danger" data-toggle="modal" data-target="#delete-hs">예약 취소</button>
									</td>
								</tr>

							</table>
						</div>

					</fieldset>
				</li>
							<%}%>
						<%}%>
			</ul>

	</div>
	</div>
	</div>
	
	<!-- 모다루~~~ -->
	<div class="modal" id="delete-hs">
		<div class="modal-dialog">
			<div class = "modal-content">
			<!-- Modal Header -->
			<div class = "modal-header">
				<h4 class="modal-title">승마예약 취소</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class= "modal-body">
				<form action="delete.hs">
					<h5>확인을 위해 예약 번호를 입력해주세요.</h5>
					<label for = "reservNo">예약 번호 :</label>
					<input type = "text" name="reservNo" id="reservNo" required>
					<input type="hidden" name="memNo" value="<%=memNo%>">
					<input type="hidden" name="cpage" value="<%=currentPage%>">
			</div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="submit" class="btn btn-danger">삭제</button>
			</div>
				</form>
			</div>
		</div>

	</div>

	<%@include file="../common/footer.jsp"%>

</body>
</html>