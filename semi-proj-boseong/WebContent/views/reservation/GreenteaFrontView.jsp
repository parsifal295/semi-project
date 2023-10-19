<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import="java.util.ArrayList, 
    		com.boseong.jsp.reservation.model.vo.GreenteaReservation"
%>

<%
    ArrayList<GreenteaReservation> list = (ArrayList<GreenteaReservation>)request.getAttribute("list");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹차밭메인페이지</title>
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
		height : 900px;
		margin : auto;
		
	}

	.mainpic{
		width : 1050px;
		height : 800px;
		float : left;
	}

	.main_image{
	float:left;
	}
	
	

	.box1{
		background-color : white;
		font-size:30px;
		width : 180px;
		height : 210px;
		text-align:center;
		top:30%;
		left:90%;
		line-height: 200px;
		float : left;
	}
	
	.box2{
		background-color : white;
		font-size:30px;
		width : 180px;
		height : 210px;
		text-align:center;
		line-height: 200px;
		top:60%;
		left:90%;
		float : left;
	}
	
	.formtag{
		align:left;
		width:190px;
		height:220px;
		float : left;
		margin-left:10px;
		margin-top:120px;
		
	}
	
	
	.outer{
			width : 1400px;
			height : 1400px;
			margin : auto;
			margin-top : 200px;
		}
		
	.content1_0{
			width:1500px;
			height:580px;
	}	
		
	.content1{
 		width:700px; 
 		height:500px;
 		float : left;
 	
	}
		
	.content2{
 		width:580px; 
 		height:500px;
 		margin-left:100px;
 		float : left;
 		margin-bottom:50px;
	}
		
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="page" id="content">
	<div style="height:200px;"></div>
	
		<div class="page" style="height:900px;">
		
			
				<div class="mainpic">
					<img src="<%=contextPath %>/resources/image/reservation/greenteamain.jpg" width="1300" height="780" id="img9" >
				</div>
				
				
				
				<% if(loginUser != null){ %>
				
				<div class="formtag">
					<form action="<%=contextPath%>/green.re" method="get">
						<input type="hidden" id="memNo1" name="memNo" value="<%= loginUser.getMemNo() %>">											
						<div class="box1" style="border:1px solid black;" ><button type="submit" style="background-color:white; border:none;" >예약하기</button></div>
					</form>
				</div>	
					
				<div class="formtag">	
					<form action="<%=contextPath%>/green.li" method="post">
						<input type="hidden" id="memNo" name="memNo" value="<%= loginUser.getMemNo() %>">
						<div class="box2" style="border:1px solid black;" ><button type="submit" style="background-color:white; border:none;" >예약조회</button></div>
					</form>
				</div>	
				
				<% } %>
					
				</div>
			
		
		<div class="page" style="height:550px;">
			<div class="content1_0">
				<div class="content1">
					<img src="https://blog.kakaocdn.net/dn/LD4SQ/btqESqHavW4/0ll3OGWhaVkEwtQRWPT391/img.jpg" width="600" height="500" id="img10">
				</div>
				
				<div class="content2">
					<h3><strong>녹차밭 체험 정보</strong></h3>
					<hr>
					<h5>주소 : 전남 보성군 보성읍 봉산리 1287-1</h5>
					<br>
					<h5>가격 : 무료</h5>
					<br>
					<h5>문의전화 : 061-852-4540</h5>
					<br>
					<h5>개장시간 : 오전 10:00~오후 18:00</h5>
					<br>
				</div>
			</div>
		</div>
		
		
	
		
		<div class="page"  style="height:650px;">
		
			<div class="content3" >
			<br>
			<h3><strong>녹차밭 체험 소개</strong></h3>
			<hr>
			<p>
				전라남도 보성은 우리나라 녹차의 약 40퍼센트를 생산하는 차의 고장으로,<br>
				기후, 토양, 지형, 호수, 바다 등 자연환경이 잘 어우러져 최고급 차(茶)를 재배하고 있습니다.<br>
				국내 최대 규모로 계단식으로 줄지어 늘어져있는 녹차 밭의 모습은 장관인데요.<br>
				보성 녹차 밭에서는 자연 그대로 재배하는 녹차의 맛도 볼 수 있고, 차를 말리는 공장도 살펴볼 수 있답니다.<br>
				끝없이 펼쳐지는 녹차 밭에서 신선한 공기를 마시며, 직접 찻잎을 따는 체험을 해보세요.<br>
					
			</p>
		</div>
		<br><br>
	
		<div class="content5">
			<h3><strong>공지사항 | 이용 안내 | 추천 인원</strong></h3>
			<hr>
			<strong>[공지사항]</strong><br>
			체험시 반려동물 입장은 불가합니다.
			체험시 체험지도사의 지시에 따라주시기 바랍니다.
			연락처 오기재로 미확인시 책임지지 않습니다.
			안전한 체험을 위하여 마스크를 착용해 주시기 바랍니다.
			신종 코로나 바이러스 감영증예방을 위해 발물관 출입시 발열체크 후 37.5도 이상일 경우 박물관 이용이 제한될 수 있으니 이용자분들의 양해 부탁드립니다.
			<br><br>
			<strong>[이용 안내]</strong><br>
			최소 체험시간 10분전까지 도착하시기 바랍니다.
			편안한 복장 및 트래킹화 착용 권장합니다.
			<br><br>
			<strong>[추천 인원]</strong><br>
			본 상품은 체험일 회당 최소인원(20명) 미만시 체험이 취소 될 수 있습니다.(모객 미달로 인한 체험 불가시 출발 2일전 별도 안내 드리오니, 구매시 연락처 확인 부탁드립니다.)
			<br><br>
		</div>
		</div>
</div>
		<script>
		function list(memNo){
			location.href = "<%=contextPath%>/green.li?memNo="+memNo;
		}
		</script>



	<%@ include file="../common/footer.jsp" %>
</body>
</html>