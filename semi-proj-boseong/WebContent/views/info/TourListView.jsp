<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광코스 메인페이지</title>
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
	
	
	
	
	.outer{
		width : 1200px;
		height : 2000px;
		margin : auto;
		margin-bottom : 1000px;
		
	}
	
	#img{
		width:400px;
		height:250px;
		margin-right:50px;
	}
	
	
	</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	
	<div class="page" style="height:2200px;"><!-- div class="outer"엿던것 -->
	
	<div style="height:200px;"></div>
	
	<div class="outer" >
		<br><br><br><br>
		<h4 align="center">관광코스</h4>
		<h2 align="center">#보성</h2>
	
		<br><br><br>
	
			<hr style="border:solid 0.5px grey;">
			<div class="total_check">
				<strong>총</strong>
				<span id="totalcount">5</span>
				<strong>건</strong>
			</div><!-- total_check -->
			
			<hr>
			
			
				<div class="listbox-area">
				<br>
					<table>
					
					<tr>
						<th colspan="2" width="500" height="5"></th>
					</tr>
					
					<tr>
						<td rowspan="3" width="500" height="300" id="img"><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f15bf573-fce5-4c35-8ef1-bfcf3cfda447" alt="" id="img" ></td>
						<td width="700" height="100"><h4>보성으로 떠나는 힐링여행</h4></td>
						
					</tr>
					
					<tr>
					<td height="60"><p><h6>전남 보성군</h6></p></td>
					</tr>
					
					<tr>
					<td ><p><h6>#1박2일 #2박3일 #겨울1박2일 #당일코스 #인증샷백만개_인스타_갬성여행</h6></p></td>
					</tr>
					
					<!-- 1끝 -->
					<tr>
						<th colspan="2" width="500" height="50"></th>
					</tr>
					
					<tr>
						<td rowspan="3" width="500" height="300" id="img"><img src="https://mblogthumb-phinf.pstatic.net/MjAxOTA0MDNfMTM0/MDAxNTU0MjgwMjIwODc5.pSA_G6rFo0KH4EnTsSpeR8GqHQSGC5aO1_B-pu7cMo8g.J5bTvvBG-ZmJVLhvwKCsd4aiC975Q-_Vm7ZbClnxm-4g.JPEG.boseonglove/2018.4.3.%EB%8C%80%EC%9B%90%EC%82%AC%EB%B2%9A%EA%BD%83%EA%B8%B8_(136).JPG?type=w800" alt="" id="img"></td>
						<td width="700" height="100"><h4>보성 대원사 벚꽃길</h4></td>
						
					</tr>
					
					<tr>
					<td height="60"><h6>전남 보성군</h6></td>
					</tr>
					
					<tr>
					<td><p><h6>#드라이브코스 #봄 #차타고 #추천코스</h6></p></td>
					</tr>
					<!-- 2끝 -->
					<tr>
						<th colspan="2" width="500" height="50"></th>
					</tr>
					
					<tr>
					
				
						<td rowspan="3" width="500" height="300" id="img"><img src="https://t1.daumcdn.net/cfile/tistory/26764E4A5708F0B81C" alt="" id="img"></td>
						<td width="700" height="100"><h4>보성 녹차밭에 깃든 짙은 녹차 향기를 따라 가는 길</h4></td>
						
					</tr>
					
					<tr>
					<td height="60"><p><h6>전남 보성군</h6></p></td>
					</tr>
					
					<tr>
					<td ><p><h6>#1박2일 #2박3일 #가족코스 #당일코스 #인증샷백만개_인스타_갬성</h6></p></td>
					</tr>
					<!-- 3끝 -->
					<tr>
						<th colspan="2" width="500" height="50"></th>
					</tr>
					
					<tr>
						<td rowspan="3" width="500" height="300" id="img"><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=0b94b539-6321-471b-9f66-5cd46f52a8ea" alt="" id="img"></td>
						<td width="700" height="100"><h4>청량한 남도의 숲</h4></td>
						
					</tr>
					
					<tr>
					<td height="60"><p><h6>전남 보성군</h6></p></td>
					</tr>
					
					<tr>
					<td ><p><h6>#가족여행 #구보성여관 #당일코스 #득량역추억의거리 #제암산자연휴가</h6></p></td>
					</tr>
					<!-- 4끝 -->
					<tr>
						<th colspan="2" width="500" height="50"></th>
					</tr>
					
					<tr>
						<td rowspan="3" width="500" height="300" id="img"><img src="https://image.foresttrip.go.kr/frip/e5d657f3-bcff-426b-8698-ef58e7aadff1.JPG" alt="" id="img"></td>
						<td width="700" height="100"><h4>몸과 마음이 즐거운 녹차 테마 투어</h4></td>
						
					</tr>
					
					<tr>
					<td height="60"><p><h6>전남 보성군</h6></p></td>
					</tr>
					
					<tr>
					<td ><p><h6>#3·1운동_100주년_가볼만한곳 #당일코스 #대한다원 #봇재 #율포해수</h6></p></td>
					</tr>
					
					
					
					</table>
					
				</div>
				
				</div>
				
	</div><!-- outer -->
	





	<script>
	$(function(){
		$('table img').click(function(){
			let tour = $(this).parent().parent().children('td').text();
			
			location.href="<%=contextPath%>/tour.de?tour=" + tour;
		})
		
	})
	</script>





	<%@ include file="../common/footer.jsp" %>
</body>
</html>