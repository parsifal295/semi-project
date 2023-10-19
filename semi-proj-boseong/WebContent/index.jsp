<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- swiper.js 라이브러리추가 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<title>www.Boseong.com</title>
<style>
	
	/* --------------------- */
	.front-page{
		padding : 0;
        margin : 0;
        width: 100%;
        height: 100vh;
        color: black;
	}
	.background-video{
		width: 100%;
		height: 100vh;
		background-color: rgba(0, 0, 0, 0.176);
	}
	.back-video{
		position: absolute;
		right: 0;
		bottom: 0;
		z-index: -1;
	}
	@media (min-aspect-ratio: 16/9) {
		.back-video{
			width: 100%;
			height: auto;
		}
	}
	@media (max-aspect-ratio: 16/9) {
		.back-video{
			width: auto;
			height: 100%;
		}
	}
	.boseong-intro-area{
		width: 100%;
		height: 700px;
	}
	.boseong-intro-image{
		width : 40%;
		height: 300px;
		float: left;
		margin-top: 200px;
		margin-left: 50px;
		background-image: url('resources/image/boseong-image-2.jpg');
		background-size: cover;
	}
	.boseong-intro-write{
		width : 50%;
		height: 300px;
		float: right;
		margin-top: 200px;
		margin-right: 50px;
	}
	#background-color-div{
		width: 100%;
		height: 100vh;
		background-color: rgba(0, 0, 0, 0.351);
		z-index: 1;
	}
	.hanok-intro-image{
		width : 40%;
		height: 300px;
		float: left;
		margin-top: 200px;
		margin-left: 50px;
		background-size: cover;
		background-image: url('https://www.gazi.net/upload_img/bbs/20230302/2_20230302060126.jpeg');
	}
	.hanok-intro-image:hover{
		transition:transform 550ms ease-in-out;
		cursor : pointer;
		transform : scale(1.1);
	}
	#hanok-intro-area{
		width: 100%;
		height: 700px;
	}
	.intro-write{
		width : 50%;
		height: 300px;
		float: right;
		margin-top: 200px;
		margin-right: 50px;
	}
	.reginal-intro-area{
		width: 100%;
		height: 700px;
	}
	.regional-intro-image{
		width : 40%;
		height: 300px;
		float: right;
		margin-top: 200px;
		margin-left: 50px;
		background-size: cover;
		background-image: url('https://fujiya-chaho.jp/_img/ja/article/799/image/770_510__ffffff/');
	}
	.regional-intro-image:hover{
		transition:transform 550ms ease-in-out;
		cursor : pointer;
		transform : scale(1.1);
	}
	.reginal-intro-write{
		width : 50%;
		height: 300px;
		float: left;
		margin-top: 200px;
		margin-right: 50px;
		text-align: right;
	}
	.blank{
		width: 10px;
		height: 40px;
		background-color: rgb(8, 41, 8);
		float : left;
	}
	.stayblank{
		width: 630px;
		height: 40px;
		float : left;
	}
	#contentOuter{
		width: 1302px;
		height: 100%;
		margin: auto;
	}
	/* 이미지 영역 사이즈 조절 */
	.swiper {
		width: 100%;
		height: 100vh;
    }
​
    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }
​
    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
</style>
</head>
<body>
	<%@ include file="../views/common/menubar.jsp" %>
	
	<div class="background-video">
		<video autoplay loop muted plays-inline class="back-video">
			<source src="<%= contextPath %>/resources/video/Boseong.mp4" type="video/mp4">
		</video>
	</div>

	<div id="contentOuter">

		<div class="boseong-intro-area">
			<div class="boseong-intro-image"></div>
			<div class="boseong-intro-write" id="font">
				<span>
					<br>
					<h6>Here, in Boseong, we can find solace, peace, <br><br>
						and a gentle reminder of life's simple joys</h6><br>
					<p>
						녹음이 우거진 도로를 달리다 보면, 어느덧 푸르른 향기가 돋는 작은 마을 보성 도달합니다.
						<br><br>
						푸른 바다 와 울창한 숲과 산들로 둘러싸인 보성읍은
						<br><br>
						촉촉한 바람과 짙은 숲 내음을 머금은 시골의 또 다른 매력을 품고 있습니다.
						<br><br>
						보성농원은 이러한 영묘한 자연과 따뜻한 마을 주민들과 함께합니다.
					</p>
				</span>
			</div>
		</div>

		<div id="hanok-intro-area">
			<div class="hanok-intro-image" onclick="hanokTagClick('<%= contextPath %>');"></div>
			<div class="intro-write" id="font">
				<div class="blank"></div>
				<div class="stayblank">
					<h4 id="font">Stay</h4>
				</div>
				<h3>당신의 느긋한 안식처</h3>
				<br>
				<span>
					<p>
						lifeStyle stay
						<br>
						보성 한옥 stay는 동양 사상의 큰 교훈 중 하나인 '비움'이 동양적 <br>
						고요함을 전달하는 가장 중심적인 <br>
						한국의 아름다움이라고 생각합니다. 장자의 소요유에는 <br>
						"무위이무불위<無爲而無不爲>"라는 말이 있습니다. <br>
						이는 '하는 것은 없지만 이루지 못하는 것도 없다'라는 의미로 '비움의 <br>
						지혜로 일상의 짐을 내려놓고 스스로 행복해니는 법'을 말하고 있습니다. <br>
					</p>
				</span>
			</div>
		</div>

		<div id="regional-intro-area">
			<div class="reginal-intro-write" id="font">
				<div class="stayblank">
					<h4 id="font">reginal</h4>
				</div>
				<div class="blank"></div>
				<h3>당신의 느긋한 안식처</h3>
				<br>
				<span>
					<p>
						lifeStyle stay
						<br>
						보성 한옥 stay는 동양 사상의 큰 교훈 중 하나인 '비움'이 동양적 <br>
						고요함을 전달하는 가장 중심적인 <br>
						한국의 아름다움이라고 생각합니다. 장자의 소요유에는 <br>
						"무위이무불위<無爲而無不爲>"라는 말이 있습니다. <br>
						이는 '하는 것은 없지만 이루지 못하는 것도 없다'라는 의미로 '비움의 <br>
						지혜로 일상의 짐을 내려놓고 스스로 행복해니는 법'을 말하고 있습니다. <br>
					</p>
				</span>
			</div>
			<div class="regional-intro-image" onclick="reginalTagClick('<%= contextPath %>');"></div>
		</div>
		
		
	</div>

		<div id="content_1">
			<!-- Slider main container -->
			<div class="swiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"></div>
					<div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"></div>
					<div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
					<div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
					<div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
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
	​
		<script>
			// 슬라이더 동작 정의
			const swiper = new Swiper('.swiper', {
				autoplay : {
					delay : 3000 // 3초마다 이미지 변경
				},
				loop : true, //반복 재생 여부
				slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
				pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
					el: '.swiper-pagination',
					clickable: true
				},
				navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
					prevEl: '.swiper-button-prev',
					nextEl: '.swiper-button-next'
				}
			}); 
		</script>
	<div style="height: 700px;"></div>
	<script type="text/javascript" src="resources/scripts/index/indexScript.js"></script>
	<%@ include file="../views/common/footer.jsp" %>
</body>
</html>
