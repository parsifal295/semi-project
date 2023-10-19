<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.boseong.jsp.reservation.model.vo.HorseReservation"
%>

<% 
	HorseReservation selectedRsv = (HorseReservation)(request.getAttribute("selectedRsv"));
	int reservNo = (selectedRsv.getReservNo()==0)? 0 : selectedRsv.getReservNo();
	String programNo = (selectedRsv.getProgramNo()==null)? "2" : selectedRsv.getProgramNo();
	String horseDate = (selectedRsv.getHorseDate()==null)? "" : selectedRsv.getHorseDate();
	int horseTime = (selectedRsv.getHorseTime() == 0)? 10 : selectedRsv.getHorseTime();
	int riderNum = (selectedRsv.getRiderNum() == 0)? 1 : selectedRsv.getRiderNum();
	String message = (selectedRsv.getMessage()==null)? "요청사항 없음" : selectedRsv.getMessage();
	int cpage = (request.getAttribute("cpage")==null)? 1 : (Integer)request.getAttribute("cpage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승마예약 변경</title>

<style>
#ride-info>table th {
	width: 300px;
	text-align: center;
	font-size:20px;
}
#ride-info>table td{
	text-align:center;
	font-size:20px;
	padding-left:30px;
}

#ride-info input {
	width: 80%;
}

#confirm {
	margin: auto;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/reservation/horseScript.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">
		<form action="<%=contextPath%>/update.hs" method="get">
			<input type="hidden" name="cpage" value="<%=cpage%>">
			<input type = "hidden" name="reservNo" value="<%=reservNo%>">
			<div id="ride-info">
				<h2>승마예약 변경</h2>
				<table>
					<tr>
						<th>프로그램 종류</th>
						<th>예약일</th>
						<th>예약 시간</th>
						<th>인원</th>
					</tr>
					<tr>
						<td><select name="programNo" value="1" id="programNo">
								<option value="1">유소년 승마 프로그램</option>
								<option value="2">일반 체험</option>
								<option value="3">장애물 레슨</option>
						</select></td>
						<td><input type="date" name="horseDate" id="horseDate">
						</td>
						<td><select name="horseTime" id="horseTime">
								<option value="0">시간</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
						</select>시</td>
				<script>
			$(function(){
				$('#horseTime>option').each(function(){
					let horseTime = "<%=horseTime%>";
					if($(this).val() == horseTime){$(this).attr('selected', true);}
				})	
				$('#programNo>option').each(function(){
					if($(this).val() == <%=programNo%>){$(this).attr('selected', true);}
				})
				$('#riderNum>option').each(function(){
					if($(this).val() == <%=riderNum%>){$(this).attr('selected', true);}
				})
			})
				</script>
						<td><select name="riderNum" id="riderNum">
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
						</select></td>

					</tr>
					<tr>
						<td></td>
						<td><h6>※당일 예약 신청 및 변경 주의</h6></td>
						<td><h6>※예약 가능시간 : 10AM ~ 8PM</h6></td>
						<td><h6>※최대인원 : 5명</h6></td>
					<tr>
				</table>
			</div>
			<div id="clientInfo">
				<h2>예약자 정보 입력</h2>
				<table>
					<%if(loginUser != null){ %>
					<tr>
						<th>예약자 성함</th>
						<td><input type="text" name="userName"
									placeholder="<%=loginUser.getMemName() %>"
							readonly></td>
						<input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" placeholder="<%=loginUser.getPhone() %>"
							readonly></td>
					</tr>
					<%}else{ %>
					<tr>
						<td colspan = "2">로그인 후 이용가능한 서비스입니다.</td>
					</tr>
					<%} %>
					<tr>
						<th>요청사항</th>
						<td><textarea name="message"cols="100" rows="5"><%=message %></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<h4>체험 안내 및 주의사항</h4>
				<pre>
	승마체험을 시작하기 전에 적혀있는 모든 주의사항을 꼭 지켜주세요. 시작하기 전 면책동의서에 사인을 받습니다.
	핸드폰, 카메라 등 개인 소모품은 스스로 잘 챙겨야합니다.
	마장에서는 필수 금연입니다.
	1 : 1 마부 요청시 비용이 추가됩니다.
	기상 상황에 따라 시간이 조정 될 수 있으며, 심한 우천 시에는 진행이 불가능합니다.
	차량 픽업이 불포함된 상품입니다. 이동은 개별적으로 하셔야합니다.
	차량 픽업은 별도의 선택옵션으로 이용이 가능합니다.
	운영에 대한 책임은 승마장에 있습니다. 개인 부주의 또는 적혀있는 사항을 위반하여 발생된 사고는 당사와 승마장은 책임지지 않습니다.
				</pre>
			</div>
			<div id="confirm" align="center">
				<input type="checkbox" required>주의사항을 읽었고 확인하였습니다. <br>
				<button type="submit" >예약하기</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
</body>
</html>
