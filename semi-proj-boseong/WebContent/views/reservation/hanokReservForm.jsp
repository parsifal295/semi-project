<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.ArrayList, com.boseong.jsp.reservation.model.vo.Room"
%>
    
<%
	ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한옥 예약</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/hanokScript.js"></script>
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
#useInfo{
width:80%;
height:auto;
box-sizing : border-box;
float:left;
}
#confirm-button{
padding-top:220px;
width:20%;
height:auto;
float:left;
box-sizing : border-box;
}
</style>
</head>
<body>

<%@ include file = "../common/menubar.jsp" %>
	<div id ="box"></div>
	
	<div id="content" class="page">
		<div class="page">
			<form action="insertHanok.rsv">
				<input type="hidden" name="userNo" 
				<%if(loginUser != null){ %> value="<%=loginUser.getMemNo()%>" <%} %>>
				<h2>객실 선택</h2>
				<table class="table">
					<tr>
						<th>객실 타입</th>
						<th colspan="2">숙박 기간</th>
						<th>숙박 인원</th>
						<th>기준 금액</th>
						<th>기준인원 초과 시</th>
					</tr>

					<tr id="reserv-info">
						<td>
							<select name="roomType" id="roomType" required>
									<option value="0">객실 타입 선택</option>
								<%for(Room r : list){ %>
									<option value="<%=r.getRoomNo()%>"><%=r.getRoomType() %></option>
								<%} %>
							</select>
						</td>
						<td>
							<input type="date" name="fromDate" id="fromDate">
						</td>

						<td>
							<input type="date" name="toDate" id="toDate">
							<button type = "button" id="date-check">예약 가능 확인</button>
						</td>
						<td>
							<input type ="number" max=4 min =2 placeholder=2 name="clientNum" id="clientNum" value="2" required>
							<span>인원 선택</span>
						</td>
						<td>
							객실 타입을 선택하세요.
						</td>
						<td>
							객실 타입을 선택하세요.
						</td>
					</tr>
				</table>
				<h2>투숙객 정보</h2>
				 <table class="table">
				 <%if(loginUser!=null){ %>
					<tr>
						<th>투숙객 성함</th>
						<td><input type="text" readonly value="<%=loginUser.getMemName() %>"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" readonly value="<%=loginUser.getPhone()%>"></td>
					</tr>
				<%}else{ %>
					<tr>
						<td>예약하시려면 로그인해주세요.</td>
					</tr>
				<%} %>
					<tr>
						<th>요청사항</th>
						<td>
							<textarea name="message" id="" cols="100" rows="8"></textarea>
						</td>
					</tr>
				 </table>
		<div id="useInfo">
				 			<h3>입/퇴실 안내 및 주의사항</h3>
			<pre>
[이용시 주의사항]
 보호자를 동반하지 않은 미성년자는 어떠한 경우에도 입실하실 수 없습니다
 객실 내에서는 금연입니다
 화재 및 냄새로 인한 타 손님 배려 차원에서 객실 내 돼지고기, 생선, 청국장등의 조리를 금하오니 실외 지정된 장소 및 자연과 벗한 바베큐장을 이용하시길 부탁드립니다
[예약 및 이용 시 주의사항]
체크아웃은 11시, 체크인은 15시입니다.
실시간예약 특성상 간혹 예약이 중복될 수 있으며, 바로 연락드려 전액환불 도와드리겠습니다.
이용불가 안내를 받았을 경우 직접 취소 시 수수료가 발생하니 고객센터로 연락바랍니다.
예약변경 시 고객센터로 연락바라며, 업체규정에 따라 변경이 불가하거나 수수료가 발생할 수 있습니다.
추가인원요금이 예약 시 결제되지 않을 수 있으며, 이 경우 현장결제 부탁드립니다.
당일예약 후 당일이용건일 경우 이용이 불가할 수 있으니 업체에 사전확인 부탁드립니다.
사전예약취소 없이 사용하지 않은 예약건에 대해서는 환불이 불가합니다.
			</pre>
			</div>
			<div id="confirm-button" align="center">
				<input type="checkbox" required> 주의사항을 읽었고 확인하였습니다. <br>
				<button type="submit" class="btn btn-outline-danger" disabled>예약하기</button>
			</div>

			</form>		
		</div>
	</div>

<%@ include file = "../common/footer.jsp" %>
<script>
	$(function(){

	});

	

</script>
</body>
</html>