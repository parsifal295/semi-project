<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.ArrayList, com.boseong.jsp.reservation.model.vo.HorseProgram"%>
<%
	ArrayList<HorseProgram> list = (ArrayList<HorseProgram>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승마장 소개</title>

<!--swiper.js 라이브러리 추기-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>


<style>
@font-face {
	font-family: 'Hangeuljaemin4-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#content * {
	font-family: 'Hangeuljaemin4-Regular';
}

/* 이미지 영역 사이즈 조절 */
.swiper {
	width: 1041px;
	height: 500px;
}

​ /* 이미지 사이즈 조절 */
.swiper-slide>img{
	width: 100%;
	height: 100%;
}

​ /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
	color: white;
	/* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
}

#horse-top {
	width: 100%;
	height: 45%;
	/*	background-image: url("resources/image/reservation/horsewide.jpg");
	background-size: cover;
	*/
}

#rsv-buttons {
	width: 250px;
	height: 100%;
	box-sizing: border-box;
	float: right;
}

.rsv {
	width: 240px;
	height: 240px;
	border-radius: 10px;
	font-size: 50px;
	font-weight: 600;
	margin-top:5px;
}

#horse-bottom {
	width: 100%;
	height: 55%;
}
.program{
	width:45%;
	padding : 10px;
	margin-bottom:10px;
	margin-left:40px;
	border-radius:5px;
	display:inline-block;
}
.program>table{
	width:100%;
	font-size:15px;
}
.program>table>th{
	width:200px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">
		<div id="horse-top">
			<div id="rsv-buttons">
			<button onclick="reserveAride();"class="btn-outline-secondary rsv top">
			예약하기
			</button>

			<button onclick="rideList();" class="btn-outline-secondary rsv">
			예약조회
			</button>
			</div>
			
			<!-- Slider main container -->
			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper top">
					<!-- Slides -->
					<div class="swiper-slide">
						<img src="<%=contextPath %>/resources/image/reservation/ride.jpg"
						width=100% height=100%>
					</div>
					<div class="swiper-slide">
						<img src="<%=contextPath %>/resources/image/reservation/huddleride.jpg"
						width=100% height=100%>
					</div>
					<div class="swiper-slide">
						<img src="<%=contextPath %>/resources/image/reservation/huddleride2.jpeg"
						width=100% height=100%>
					</div>
					<div class="swiper-slide">
						<img src="<%=contextPath %>/resources/image/reservation/kidsride.jpg"
						width=100% height=100%>
					</div>
					<div class="swiper-slide">
						<img src="<%=contextPath %>/resources/image/reservation/kidsride2.jpg"
						width=100% height=100%>
					</div>
				</div>

				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>

				<!-- If we need navigation buttons -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>

				<!-- If we need scrollbar -->
				<div class="swiper-scrollbar"></div>
			</div>
		</div>
		<!-- end of horse-top area -->

		<div id="horse-bottom">
			<h2>승마장 소개</h2>
			<hr>
			<pre>
	전남 보성읍에 위치한 승마장 입니다. 쾌적한 환경과 합리적인가격 , 기승자의 눈높이에 맞춘체계적인 교육을 통해 , 안전하고 즐거운 승마를 즐길수 있는 도심속의 힐링캠프입니다
			</pre>
			<h2>프로그램 소개</h2>
			<hr>
			<%if(list.isEmpty()){ %>
				<pre>
				진행중인 프로그램이 없습니다.
				</pre>
			<%}else{ %>
				<%for(HorseProgram hpro : list){ %>
					<div class="program">
						<h3><%=hpro.getHorseProName() %></h2>
						<table bordr="1">
							<tr>
							<th>설명</th>
							<td><%=hpro.getDescription() %></td>
							</tr>
							<tr></tr>
							<tr>
							<th>가격</th>
							<td><%=hpro.getPrice() %></td>
							</tr>
						</table>
					</div>
				<%} %>
			<%} %>
			<br>
			<h3>이용 안내</h3>
			<hr>
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


	</div>
	<%@ include file="../common/footer.jsp"%>

	<script>
//원래는 여기서 둘 다 회원번호를 가져가야 해
	function reserveAride(){
		location.href = "<%=contextPath%>/horseForm.rsv";
	}
	function rideList(){
		location.href = "<%=contextPath%>/list.hs";
		}

		// 슬라이더 동작 정의
		const swiper = new Swiper('.swiper', {
			autoplay : {
				delay : 3000
			// 3초마다 이미지 변경
			},
			loop : true, //반복 재생 여부
			slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
			pagination : { // 페이징 버튼 클릭 시 이미지 이동 가능
				el : '.swiper-pagination',
				clickable : true
			},
			navigation : { // 화살표 버튼 클릭 시 이미지 이동 가능
				prevEl : '.swiper-button-prev',
				nextEl : '.swiper-button-next'
			}
		});
	</script>

</body>
</html>