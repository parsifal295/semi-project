<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList,
            com.boseong.jsp.reservation.model.vo.greenteaInfo"
%>

<%@ page import="com.boseong.jsp.reservation.model.vo.greenteaInfo" %>    
    



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹차밭 예약페이지</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.9/index.global.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.9/index.global.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

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
	
	.content12{
		width : 1400px;
		height : 650px;	
	}	
		
	.content1{
		width : 700px;
		height : 600px;
		margin : auto;
		margin-top : 30px;
		float : left;
	}	
		
	.content2{
		width : 630px;
		height : 500px;
		margin : auto;
		margin-top : 30px;
		margin-left:50px;
		float : left;
	}	
		
	.content3_1{
		width:400px;
		height:70px;
		margin-top : 30px;
	}	
		
	.content3_2{
		width:500px;
		height:50px;
		float : left;
	}		
		
	.button{
		float:right;
	}	
		
</style>





</head>
<body>
<!-- 스크립트시작 -->
	<script>

	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            selectable: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth'
            },
            dateClick: function(info) {
            	$("#startDate").val(info.dateStr);
            	console.log(info);
            	
            	
            },
 
          });
        calendar.render();
      });
		
     
      
      
      
      
    </script>
	<!-- 스크립트끝 -->
	
	
	<%@ include file="../common/menubar.jsp" %>


	<div class="page" id="content">
	<form action="<%=contextPath %>/green.in" method="get">
	<div style="height:200px;"></div>
	<div class="page" style="height:800px;">
	<hr style="border:solid 0.5px grey;">
	<h2 align="center">녹차밭 예약하기</h2>
	<hr style="border:solid 0.5px grey;">
	
	<br><br>
	<div class="content12">
	
		<div class="content1">
		
		<div id='calendar'></div>
		</div>
		
		<div class="content2">
			<h3><strong>내 예약 정보</strong></h3>
			<hr>
			  
				예약 일자: 
				<input id="startDate" name="startDate"><a id="startDate"> </a>
				<br><br>
				
				<a>예약 회차: 
		        	<select name="courseNum"> 
			            <option value="AM">오전(9시~12시)</option>
			            <option value="PM">오후(12시~6시)</option>
					</select>
	        	</a>
	        	
				<br><br>
				<a>인원:
					<input type="number" name="bookNum" min="0" max="10" value="1" step="1">
					명(최대인원:10명)
				</a>
				<br>
				
			</div>
			</div>
		</div>
		<br><br>
		
	
		<div class="page">
		<h2>예약자 세부 정보 입력</h2>
		
			<div class="content3_2">
			<br>
			<!-- 
			<input type="checkbox" id="same" name="same" value="same"><label for="same">예약자와 투숙객이 일치하다면 체크해주세요</label>
			 -->
			<!-- 이거 쉽다고 나중에 해도된다고 하심 -->
		
			</div>
			<hr>
		<!--  <hr style="border:solid 1px grey;">-->
		
		<div class="content3">
			<br><br>
		 	이름 : <input type="text" name="memName" placeholder="이름을 입력해주세요." required>
			<br><br>
		 	전화번호 : <input type="text" name="phone" placeholder="전화번호를 입력해주세요." required>
			</div>
			<br><br><br>
		
		<div class="content4">
			<h2>녹차밭 체험 규칙 검토</h2>
			<div class="content4_1" align="right">
			<input type="checkbox" value="체험확인" name="mustCheck" required>규칙을 확인하였습니다.
		</div>
		<hr>
			체험시 반려동물 입장은 불가합니다.
			체험시 체험지도사의 지시에 따라주시기 바랍니다.
			연락처 오기재로 미확인시 책임지지 않습니다.
			안전한 체험을 위하여 마스크를 착용해 주시기 바랍니다.
			신종 코로나 바이러스 감영증예방을 위해 발물관 출입시 발열체크 후 37.5도 이상일 경우 박물관 이용이 제한될 수 있으니 이용자분들의 양해 부탁드립니다.
			<br><br>
			[이용 안내]
			<br>
			최소 체험시간 10분전까지 도착하시기 바랍니다.
			편안한 복장 및 트래킹화 착용 권장합니다.
			<br><br>
			[추천 인원]
			<br>
			본 상품은 체험일 회당 최소인원(20명) 미만시 체험이 취소 될 수 있습니다.(모객 미달로 인한 체험 불가시 출발 2일전 별도 안내 드리오니, 구매시 연락처 확인 부탁드립니다.)
			<br><br>
			
			<input type="hidden" id="memNo1" name="memNo" value="<%= loginUser.getMemNo() %>">											
			<div class="button">
				<button type="submit" class="btn btn-primary">예약하기</button>
			</div>
		</div>
	</div>
	</form>
	</div>
	
	
	</div>
	
	








	<%@ include file="../common/footer.jsp" %>
</body>
</html>