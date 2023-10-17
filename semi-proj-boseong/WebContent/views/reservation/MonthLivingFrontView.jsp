<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import=" com.boseong.jsp.reservation.model.vo.Monthlivinginfo" %>    
 
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

	.box1{
		background-color : white;
		font-size:30px;
		width : 200px;
		height : 210px;
		text-align:center;
		position:absolute;
		top:30%;
		left:90%;
		line-height: 200px;
		transform:translate(-50%, 40%);
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
		transform:translate(-50%, 50%);
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
				<img src="<%=contextPath %>/resources/image/reservation/monthlivingmain.jpg" width="2000" height="780" id="img9">
			</div>
			<div class="main_image_text"><h2 align=center style="font-size:60px;">한달 살기</h2></div>
			

			<% if(loginUser != null){ %>
			
				<form action="<%=contextPath%>/month.fo" method="get">
					<input type="hidden" id="memNo1" name="memNo" value="<%= loginUser.getMemNo() %>">											
					<div class="box1" style="border:1px solid white;" ><button type="submit" style="background-color:white; border:none;" >예약하기</button></div>
				</form>
			
			
			
				<form action="<%=contextPath%>/month.li" method="post">
							<input type="hidden" id="memNo" name="memNo" value="<%= loginUser.getMemNo() %>">
							
							<div class="box2" style="border:1px solid white;" ><button type="submit" style="background-color:white; border:none;" >예약조회</button></div>
				</form>
			<% } %>
				
		</div>
		
		
		<div class="page" style="height:1200px" clear="both">
			<div class="content1_0" align="center">
			<h2>🏠숙소 정보🏠</h2>
			<hr>
			
			
		<div class="content1" align="center" id="thumbnails">
					
		<div class="list-area">
		
			<div class="thumbnail" align="center">
			<!--  <input type="hidden" >-->
			<!-- <img src="https://image.goodchoice.kr/resize_490x348/affiliate/2019/06/20/11/ec67d36c-9413-d75c-dcdf-7d937a576a17-original.jpg" alt="메로나망고맛"> -->
			<img src="<%=contextPath %>/resources/image/reservation/house1.jpg" alt="">
                    <p>
                    <h5><b>수진한옥팬션</b><br></h5>
                       보성의 득량면에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다.
                    </p>
			</div>
			
			
			<div class="thumbnail" align="center">
			<!--  <input type="hidden" >-->
			
            <img src="<%=contextPath %>/resources/image/reservation/house2.jpg" alt="">
                   <p>
                    <h5><b>이진래 고택</b><br></h5>
                       	 보성의 득량면에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다.
                    </p>
			</div>
			
			<div class="thumbnail" align="center">
			<!--  <input type="hidden" >-->
			<img src="<%=contextPath %>/resources/image/reservation/house3.jpg" alt="">
                    <p>
                    <h5><b>큰기와집</b><br></h5>
                       	 보성의 조성면에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다.
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
	
		
		

		
	
		
	
	
<%@ include file="../common/footer.jsp" %>


	<script>
        	 let thumbnails = document.getElementsByClassName("thumbnail");
        	    for(i=0; i<thumbnails.length;i++){
        	    	let lodgeNo = i+1;
        	    	thumbnails[i].onclick= function(){
        	            location.href="<%=contextPath%>/month.de?lodgeNo=" + lodgeNo;
        	            return;
        	        }
        	    }
        	    
        	    function list(memNo){
        			location.href = "<%=contextPath%>/month.li?memNo="+memNo;
        		}
        	    
    </script>  









</body>
</html>