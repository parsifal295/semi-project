<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광코스 메인페이지</title>
	<style>
	.outer{
		width : 1200px;
		height : 2500px;
		margin : auto;
		margin-top : 250px;
	}
	
	.total_check{
		height : 40px;
		width : 600px;
		float : left;
	}
	
	.btn_text{
		margin-left : 1000px;
		align: right;
	}
	
	.btn_text> button {
		border:none;
	}

	
	.listbox-area{
		width : 1200px;
		height : 300px;
		
	
	}
	
	.content1_1{
		width : 400px;
		height : 250px;
		float : left;
	}
	
	.content1_2{
		width : 700px;
		height : 250px;
		float : left;
		margin-left : 30px;
	}
	
	#content1_22 {
		list-style : none;
		
	}
	
	
	</style>




</head>
<body>
	<%@ include file="../common/menubar.jsp" %>


	<div class="outer">
		<br><br><br><br>
		<h4 align="center">관광코스</h4>
		<h2 align="center">#보성</h2>
	
		<br><br><br>
	
		
		
		
			<hr style="border:solid 0.5px grey;">
			<div class="total_check">
				<strong>"총"</strong>
				<span id="totalcount">50</span>
				<strong>"건"</strong>
			</div>
				<!--  
				<div class="btn_text">
					<button type="button" style="background-color : white" class="on" id="1">최신순</button>
					|
					<button type="button" style="background-color : white" id="2">인기순</button>
				</div>
				 -->
				 <br>
			<hr>
			
			
			
			
			
			
			
			<div class="listbox-area">
			<br>
				
				<div class="content1_1">
					<img src="https://ssl.pstatic.net/melona/libs/1461/1461549/9359c33988d46c2dd1b2_20230804165709829.jpg" alt="예시1" width="400" height="250" id="img1">
				</div>
							
				<div class="content1_2">
					<ul id="content1_22">
						<li>
							<div class="area_text">
							<br>
							<div class="title"><h2>제목제목제목</h2></div>
							<br>
							<p><h5>위치</h5></p>
							<p><h5>한줄소개</h5></p>
							</div>
						</li>
					</ul>
				
				</div>
				
				
				
			</div>
			
			<hr>
			
			<!-- -------------------------------------------------- -->
			
			<div class="listbox-area">
			<br>
				
				<div class="content1_1">
					<img src="https://ssl.pstatic.net/melona/libs/1461/1461549/9359c33988d46c2dd1b2_20230804165709829.jpg" alt="예시1" width="400" height="250" id="img1">
				</div>
							
				<div class="content1_2">
					<ul id="content1_22">
						<li>
							<div class="area_text">
							<br>
							<div class="title"><h2>제목제목제목</h2></div>
							<br>
							<p><h5>위치</h5></p>
							<p><h5>한줄소개</h5></p>
							</div>
						</li>
					</ul>
				
				</div>
				
				
				
			</div>
			
			<hr>
			
			<!-- -------------------------------------------------- -->
			
			<div class="listbox-area">
			<br>
				
				<div class="content1_1">
					<img src="https://ssl.pstatic.net/melona/libs/1461/1461549/9359c33988d46c2dd1b2_20230804165709829.jpg" alt="예시1" width="400" height="250" id="img1">
				</div>
							
				<div class="content1_2">
					<ul id="content1_22">
						<li>
							<div class="area_text">
							<br>
							<div class="title"><h2>제목제목제목</h2></div>
							<br>
							<p><h5>위치</h5></p>
							<p><h5>한줄소개</h5></p>
							</div>
						</li>
					</ul>
				
				</div>
				
				
				
			</div>
			
			<hr>
			
			<!-- -------------------------------------------------- -->
			
			<div class="listbox-area">
			<br>
				
				<div class="content1_1">
					<img src="https://ssl.pstatic.net/melona/libs/1461/1461549/9359c33988d46c2dd1b2_20230804165709829.jpg" alt="예시1" width="400" height="250" id="img1">
				</div>
							
				<div class="content1_2">
					<ul id="content1_22">
						<li>
							<div class="area_text">
							<br>
							<div class="title"><h2>제목제목제목</h2></div>
							<br>
							<p><h5>위치</h5></p>
							<p><h5>한줄소개</h5></p>
							</div>
						</li>
					</ul>
				
				</div>
				
				
				
			</div>
			
			<hr>
			
			<!-- -------------------------------------------------- -->
			
			<div class="listbox-area">
			<br>
				
				<div class="content1_1">
					<img src="https://ssl.pstatic.net/melona/libs/1461/1461549/9359c33988d46c2dd1b2_20230804165709829.jpg" alt="예시1" width="400" height="250" id="img1">
				</div>
							
				<div class="content1_2">
					<ul id="content1_22">
						<li>
							<div class="area_text">
							<br>
							<div class="title"><h2>제목제목제목</h2></div>
							<br>
							<p><h5>위치</h5></p>
							<p><h5>한줄소개</h5></p>
							</div>
						</li>
					</ul>
				
				</div>
				
				
				
			</div>
			
			<hr>
			
			
			
	</div>
	
		
	
		
	
	</div>







	<%@ include file="../common/footer.jsp" %>
</body>
</html>