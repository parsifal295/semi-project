<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>한달살기 메인페이지</title>
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
	  $( function() {
	    $("#datepicker").datepicker();
	  } );
  </script>
  
  
<style>
	.allouter{
	margin-top : 250px;
	height : 2500px;
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
			width : 1500px;
			height : 1800px;
			margin : auto;
			margin-top : 100px;
		}
		
	.content1{
 		width:100%;
 		height:200px;
 		
 		
	}
		
	.content1_1{
		width:450px;
		height:100px;
		margin:23px;
		float : left;
	
	}	
		
	.content1_2{
		width:450px;
		height:100px;
		margin:23px;
		float : left;
	
	}		
	
	.content1_3{
		width:450px;
		height:100px;
		margin:23px;
		float : left;
	
	}		
		
	
	
	 .list-area {
        text-align : center;
        border : 1px solid red;
    }
	
		
	.thumbnail {
        border : 1px solid black;
        width : 400px;
        display : inline-block;
        margin : 10px;
        text-align : center;
    }
    
    .thumbnail > img {
        width : 300px;
        height : 300px;
        padding : 10px;
    }

    .thumbnail:hover{
        cursor : pointer;
        opacity : 0.9;
    }	
		
		
</style>




</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="allouter">
	
	<div class="main_image">
		<div class="mainpic">
		<img src="https://tour.paju.go.kr/upload/tour/2020/6/18/bdbe4c95-1f51-4c6b-b8c9-5eed17edd422.jpg" width="2000" height="780" id="img9">
		</div>
		<div class="main_image_text"><h2 align=center style="font-size:60px;">한달 살기</h2></div>
		
		<div class="box1" style="border:1px solid white;" >예약하기</h3></div>
		<div class="box2" style="border:1px solid white;">예약조회</h3></div>
	</div>
	
	
	
	<div class="outer">
		<div class="content1">
			<div class="content1_1">
			<h5>날짜<br></h5>
			
			<p>Date: <input type="text" id="datepicker"></p>
			
			</div>
			<div class="content1_2">
			<h5>인원<br></h5>
			<input type="number" name="amount" min="0" max="50" value="1" step="1">
			
			</div>
			<div class="content1_3">
			<h5><br></h5>
			
			
			</div>
		
		
		</div>
		
	
	
		<div class="list-area">
		
			<div class="thumbnail" align="center">
			<img src="https://www.yupdduk.com/images/menu/2020_hotmenuY01.png" alt="메로나망고맛">
                    <p>
                    <h5><b>숙소이름 </b><br></h5>
                       	 방 소개
                    </p>
			</div>
			
			<div class="thumbnail" align="center">
			<img src="https://www.yupdduk.com/images/menu/2020_hotmenuY01.png" alt="메로나망고맛">
                     <p>
                    <h5><b>숙소이름 </b><br></h5>
                       	 방 소개
                    </p>
			</div>
			
			<div class="thumbnail" align="center">
			<img src="https://www.yupdduk.com/images/menu/2020_hotmenuY01.png" alt="메로나망고맛">
                    <p>
                    <h5><b>숙소이름 </b><br></h5>
                       	 방 소개
                    </p>
			</div>
			
			<div class="thumbnail" align="center">
			<img src="https://www.yupdduk.com/images/menu/2020_hotmenuY01.png" alt="메로나망고맛">
                    <p>
                    <h5><b>숙소이름 </b><br></h5>
                       	 방 소개
                    </p>
			</div>
			
			<div class="thumbnail" align="center">
			<img src="https://www.yupdduk.com/images/menu/2020_hotmenuY01.png" alt="메로나망고맛">
                    <p>
                    <h5><b>숙소이름 </b><br></h5>
                       	 방 소개
                    </p>
			</div>
			
			<div class="thumbnail" align="center">
			<img src="https://www.yupdduk.com/images/menu/2020_hotmenuY01.png" alt="메로나망고맛">
                    <p>
                    <h5><b>숙소이름 </b><br></h5>
                       	 방 소개
                    </p>
			</div>
		
		</div>
		
		
		
	</div>	
	
	
</div>
	






<%@ include file="../common/footer.jsp" %>
</body>
</html>