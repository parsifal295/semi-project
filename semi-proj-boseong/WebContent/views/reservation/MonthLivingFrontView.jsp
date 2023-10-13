<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
<title>한달살기 메인페이지</title>
  
  
  
  
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
		height : 100%;
		margin : auto;
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
	transform:translate(-50%, 50%);
	color:white;
	
	}

	.box2{
		background-color : white;
		font-size:30px;
		width : 200px;
		height : 210px;
		text-align:center;
		position:absolute;
		line-height: 200px;
		top:60%;
		left:90%;
		transform:translate(-50%, -60%);
		
	}
	



	.outer{
			width : 1400px;
			height : 1000px;
			margin : auto;
			
		}
		
	
		
	 .list-area {
        text-align : center;
        
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

	
	<div class="page">
	<div style="height:200px;"></div>
	
		<div class="page" style="height:900px;">
			<div class="mainpic">
				<img src="https://tour.paju.go.kr/upload/tour/2020/6/18/bdbe4c95-1f51-4c6b-b8c9-5eed17edd422.jpg" width="2000" height="780" id="img9">
			</div>
			<div class="main_image_text"><h2 align=center style="font-size:60px;">한달 살기</h2></div>
			

			<% if(loginUser != null){ %>
			
			<form action="<%=contextPath%>/resv.all" method="post">
							<input type="hidden" id="memNo" name="memNo" value="<%= loginUser.getMemNo() %>">
							<div class="box2" style="border:1px solid white;" ><button type="submit" style="background-color:white; border:none;" >예약조회</button></div>
						</form>
			<% } %>
				
		</div>
		
		
		<div class="page" style="height:1200px" clear="both">
			<div class="content1_0" align="center">
			<h2>🏠숙소 정보🏠</h2>
			<hr>
				<div class="content1" align="center">
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
			
			
			
			
			</div>
		
		</div>
		</div>
				
				
				</div>
				
				
			</div>
		
		
		
		
		<div class="page" clear="both" style="height:700px">
		
			
		</div>
		<br><br>
	
		
		</div>
		</div>
			
		
	
		
	
	
	
	
	
	
	
	
	






<%@ include file="../common/footer.jsp" %>
</body>
</html>