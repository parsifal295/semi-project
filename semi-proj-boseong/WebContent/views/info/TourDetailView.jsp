<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광상세페이지</title>



<style>
	.outer{
		width : 1200px;
		height : 2370px;
		margin : auto;
		margin-top : 250px;
	}
	
	.area_address{
	align : center;
	
	}
	
	.views, views1{
	float:right;
	}
	
	
	
	.map{
	width:1200px;
	height:800px;
	margin:auto;
	
	}
	
	.thumbpic{
	width : 1200px;
	height: 300px;
	margin : auto;
	
	}
	
	.thumbpicinfo{
	width : 1200px;
	height : 700px;
	background-color: rgb(211, 211, 211);
	}
	
	
	
	.pic1, pic2{
	float : left;
	margin-left:80px;
	margin-right:20px;
	
	}
	
	
	#img1_1, #img1_2, #img1_3{
	float:left;
	margin-left:24px;
	margin-right:24px;
	align:center;
	}
	
	
	
</style>




</head>
<body>

<%@ include file="../common/menubar.jsp" %>


<div class="outer">
		<br><br><br><br>
		<h2 align="center">코스 이름</h2>
		
		<div class="area_address" align="center">
			<span class="address" align="center">장소</span>
			<span id="distance" align="center">
			 |
			거리</span>
		</div>
		
		<div class="views" align="right">
		얼마   
		</div>
		<div class="views" align="right">
		👀 조회수 : 
		</div>
		<br>
		<hr>
		<br>
		<p style="font-size:20px";>
		강골마을에 가면 ‘전통 가옥에서 보내는 특별한 하룻밤’을 체험할 수 있다. 행정구역상으로는 전남 보성군 득량면 오봉리지만 강골마을이라 부르기도 하고 체험마을로 지정되면서 득량마을로 불리기도 하는 이 마을은 광주 이씨 집성촌이다.
		</p>
		
		<div class="map">
		<img src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4434870053/B.jpg?25000000" width="1180" height="780" id="img2">
		</div>
		
		<br><br>
		
		<div class="thumbpic">
			<div class="thumbpic1">
			<img src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4434870053/B.jpg?25000000" width="350" height="200" id="img1_1">
			</div>
			<div class="thumbpic2">
			<img src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4434870053/B.jpg?25000000" width="350" height="200" id="img1_2">
			</div>
			<div class="thumbpic3">
			<img src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4434870053/B.jpg?25000000" width="350" height="200" id="img1_3">
			</div>
		</div>
		<br>
		
		
		<div class="thumbpicinfo">
			<br><br><br><br>
			<div class="nametitle"><h3 align="center">코스1 지명</h3></div>
			<div class="pic1">
			<img src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4434870053/B.jpg?25000000" width="500" height="300" id="img3">
			</div>
			<div class="pic2">
			<img src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4434870053/B.jpg?25000000" width="500" height="300" id="img4">
			</div>
			<br>
			<div class="miniinfo" align="center"><h5>코스1 소개</h5></div>
			<br>
			<div class="infolong"><p>로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.</p></div>
		
		</div>
		
		
		
		
		
		
		
		
		
		
		
</div>
		








<%@ include file="../common/footer.jsp" %>
</body>
</html>