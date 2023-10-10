<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹차밭메인페이지</title>
<style>
	.allouter{
	margin-top : 250px;
	}
	

	.mainpic{
			width : 2000px;
			height : 800px;
			margin : auto;
			
		}

	.main_image{
	position:relative;
	}
	
	.main_image_text{
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	color:white;
	
	}

	


	.box1{
		background-color : white;
		font-size:30px;
		width : 200px;
		height : 200px;
		text-align:center;
		position:absolute;
		top:30%;
		left:90%;
		line-height: 200px;
		transform:translate(-50%, -50%);
		
	}
	
	.box2{
		background-color : white;
		font-size:30px;
		width : 200px;
		height : 200px;
		text-align:center;
		position:absolute;
		line-height: 200px;
		top:60%;
		left:90%;
		transform:translate(-50%, -50%);
		
	}
	

	.outer{
			width : 1400px;
			height : 1400px;
			margin : auto;
			margin-top : 200px;
		}
		
	.content1{
 		width:700px; 
 		height:500px;
 		float : left;
 		
	}
		
	.content2{
 		width:580px; 
 		height:600px;
 		margin-left:100px;
 		float : left;
 		margin-bottom:50px;
	}
		
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="allouter">
	
	<div class="main_image">
		<div class="mainpic">
		<img src="https://blog.kakaocdn.net/dn/LD4SQ/btqESqHavW4/0ll3OGWhaVkEwtQRWPT391/img.jpg" width="2000" height="780" id="img9">
		</div>
		<div class="main_image_text"><h2 align=center style="font-size:60px;">녹차밭 체험하기</h2></div>
		
		<div class="box1" style="border:1px solid white;" ><a href="<%=contextPath %>/green.re">예약하기</a></h3></div>
		<div class="box2" style="border:1px solid white;"><a href="<%=contextPath %>/resv.all">예약조회</a></div>
	</div>
	
	
	<div class="outer">
	<div class="content1">
	<img src="https://blog.kakaocdn.net/dn/LD4SQ/btqESqHavW4/0ll3OGWhaVkEwtQRWPT391/img.jpg" width="700" height="500" id="img10">
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
	
	<br><br><br><br>
	
	<div class="content3">
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
	<!--  
	<br><br>
	<div class="content4">
		<h1>녹차밭 체험 소개(오후)</h1>
		<hr>
		<p>
		가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는

		쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고
		</p>
	</div>
	-->
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









	<%@ include file="../common/footer.jsp" %>
</body>
</html>