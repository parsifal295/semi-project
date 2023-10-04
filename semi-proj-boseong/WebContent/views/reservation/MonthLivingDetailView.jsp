<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한달살기 상세페이지</title>
<style>
	.allouter{
	
	width:1500px;
	height : 2500px;
	align : center;
	
	margin : auto;
	margin-top : 400px;
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
	float:left;
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

	<div class="allouter">
	
		<div class="title">
		<h3><strong>숙소명1</strong></h3>
		
		</div>
		
		<div class="reserv_btn">
		<button type="button" class="btn btn-primary btn-lg">예약하기</button>
		</div>
	
		<div class="main_image">
			<div class="mainpic">
			<img src="https://tour.paju.go.kr/upload/tour/2020/6/18/bdbe4c95-1f51-4c6b-b8c9-5eed17edd422.jpg" width="1500" height="780" id="img9">
			</div>
			
		</div>
	
		<div class="room_info">
		<h2>숙소 소개</h2>
		<hr>
		체험시 반려동물 입장은 불가합니다.
		체험시 체험지도사의 지시에 따라주시기 바랍니다.
		연락처 오기재로 미확인시 책임지지 않습니다.
		안전한 체험을 위하여 마스크를 착용해 주시기 바랍니다.
		신종 코로나 바이러스 감영증예방을 위해 발물관 출입시 발열체크 후 37.5도 이상일 경우 박물관 이용이 제한될 수 있으니 이용자분들의 양해 부탁드립니다.
		</div>
	
		<div class="map">
		<h2>위치</h2>
		<hr>
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.4527423418394!2d126.97845458885494!3d37.5679554!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3871cf8e301%3A0xa4891da135337df4!2z6re466CI7J207LigIOyyreqzhChHUkVJVFMgQ0hFT05HR1lFKQ!5e0!3m2!1sko!2skr!4v1696385152980!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
	
		<div class="calender">
		<h2>달력</h2>
		<hr>
		
		</div>
	
	
	</div>

		










<%@ include file="../common/footer.jsp" %>

</body>
</html>