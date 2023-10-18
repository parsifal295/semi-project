<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>www.Boseong.com</title>
<style>
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
</style>
</head>
<body>
	<%@ include file="../views/common/menubar.jsp" %>
	
	<div class="background-video">
		<video autoplay loop muted plays-inline class="back-video">
			<source src="<%= contextPath %>/resources/video/Boseong.mp4" type="video/mp4">
		</video>
	</div>
	<div id="content">
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
		<div>02
		</div>
		<div >03
		</div>
	</div>
	
	<%@ include file="../views/common/footer.jsp" %>
</body>
</html>
