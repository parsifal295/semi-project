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
</style>
</head>
<body>

<%@ include file = "../common/menubar.jsp" %>
	<div id ="box"></div>
	
	<div id="content" class="page">
		<div class="page">
			<form action="">
				<table class="table">
					<tr>
						<th>객실 타입</th>
						<th colspan="2">숙박 기간</th>
						<th>숙박 인원</th>
						<th>금액</th>
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
							<input type="date" name="fromDate">
						</td>
						<td>
							<input type="date" name="toDate">
						</td>
						<td>
							<input type ="number" max=4 min =2 placeholder=2 name="clientNum" id="clientNum">
							<span>최대 인원 : </span>
						</td>
						<td>
							오조오억원
						</td>
					</tr>
				</table>
				<h2>투숙객 정보</h2>
				 <table class="table">
					<tr>
						<th>투숙객 성함</th>
						<td><input type="text" readonly value="회원 이름"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" readonly value="회원 전화번호"></td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td>
							<textarea name="message" id="" cols="100" rows="10"></textarea>
						</td>
					</tr>
				 </table>




			</form>
		
		</div>
	</div>

<%@ include file = "../common/footer.jsp" %>
<script>
	$(function(){
		$('#roomType').change(function(){
			let roomNo = $(this).val();
//			let index = $(this).children('option:selected').val();
//			let maxNum = $('#reserv-info').children().eq(3).children().text();
			$.ajax({
				url : 'detail.hk',
				data : {roomNo : roomNo},
				success : function(e){
					alert('성공');
					console.log(e);
				}
			})
			})
			$('#clientNum').attr({min :1, placeholder:1, max : 4}).val('');
		});
	})
</script>
</body>
</html>