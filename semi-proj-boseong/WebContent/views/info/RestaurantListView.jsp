<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보성의 맛</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
@font-face {
	font-family: 'Hangeuljaemin4-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'Hangeuljaemin4-Regular';
}

table {
	width: 100%;
}

img {
	width: 450px;
	height: 300px;
	margin: auto;
}

th {
	font-size: 26px;
	text-align: left;
}
td{
	font-size: 22px;
}
#box {
	height: 200px;
}
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">
		<h1>보성의 맛</h1>
		<table>
			<tr>
				<td rowspan="5" width="50%" align="center"><img
					src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13279199&filePath=L2Rpc2sxL25ld2RhdGEvMjAyMC8yMS9DTFMxMDAwNi8xMzI3OTE5OV9XUlRfMjFfQ0xTMTAwMDZfMjAyMDEyMThfMQ==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006"
					alt=""></td>
				<th>보성 녹차 떡갈비</th>
			</tr>
			<tr></tr>
			<tr>
				<td>전라남도 보성군 보성읍 흥성로 2541-4</td>
			</tr>
			<tr>
				<td>061-853-0300</td>
			</tr>
			<tr>
				<td>한식</td>
			</tr>

			<tr>
				<td rowspan="5" width="40%" align="center"><img
					src="https://img.siksinhot.com/place/1499990936640921.jpg" alt=""></td>
				<th>청광도예원</th>
			</tr>
			<tr></tr>
			<tr>
				<td>전라남도 보성군 보성읍 봉산리 1154-1</td>
			</tr>
			<tr>
				<td>061-853-4125</td>
			</tr>
			<tr>
				<td>한식</td>
			</tr>

			<tr>
				<td rowspan="5" width="40%" align="center"><img
					src="https://mblogthumb-phinf.pstatic.net/MjAxODA5MTlfMTk1/MDAxNTM3MzUwMTM5MTEw.tJaRieIWXcRgxxggg6mVDl_voaT2d9jFVGc6bdEgSW0g.Jqq9yzGj63u7ZaprudAO06i8XknKWZN6tgyJump9PN8g.JPEG.boseonglove/IMG_0103.jpg?type=w800"
					alt=""></td>
				<th>수복식당</th>
			</tr>
			<tr></tr>

			<tr>
				<td>전라남도 보성군 보성읍 보성리 767-7</td>
			</tr>
			<tr>
				<td>061-853-3032</td>
			</tr>
			<tr>
				<td>한식</td>
			</tr>

		</table>
		<br>
	</div>
	<script>
    	$(function(){
    		$('table img').click(function(){
    			let food = $(this).parent().parent().children('th').text();
    			alert(food);
    			location.href = "<%=contextPath%>/detail.rs?food=" + food;
			})
		})
	</script>

</body>
</html>