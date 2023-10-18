<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList,
            com.boseong.jsp.reservation.model.vo.Monthlivinginfo"
%>
<%@ page import="com.boseong.jsp.reservation.model.vo.Monthlivinginfo" %>    
    
<%
	ArrayList<Monthlivinginfo> list = (ArrayList<Monthlivinginfo>)request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한달살기 예약페이지</title>

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
            	$("#startMonth").val(info.dateStr);
            	console.log(info);
            	
            	 var str = info.dateStr;
            	 var result1 = str.substring(0,7);
            	 console.log(result1);
            	 $("#startDate").val(result1);
            	 //자바스크립트로 값을 지정해줘야댄다고 하심
            	 //method를 써서...substr 써서..
            	 //2023-10-14
            },
 
          });
        calendar.render();
      });
		
     
      
      
      
      
    </script>
	<!-- 스크립트끝 -->
	
	
	<%@ include file="../common/menubar.jsp" %>


	<div class="page" id="content">
	<form action="<%=contextPath %>/month.in" method="get">
	<div style="height:200px;"></div>
	<div class="page" style="height:800px;">
	<hr style="border:solid 0.5px grey;">
	<h2 align="center">한달살기 예약하기</h2>
	<hr style="border:solid 0.5px grey;">
	
	<br><br>
	<div class="content12">
	
		<div class="content1">
		
		<div id='calendar'></div>
		</div>
		
		<div class="content2">
			<h3><strong>내 예약 정보</strong></h3>
			<hr>
			  
				<a>예약 숙소: 
	        	<select name="lodgeNo"> 
		            <option value="1">수진한옥팬션</option>
		            <option value="2">이진래 고택</option>
		            <option value="3">큰기와집</option>
				</select>
        	</a>
        	
        	<br><br>
				
				
				예약 월: 
				<input id="startDate" name="startDate"><a id="startDate"> </a>
				
				
				
				

			<br><br>
			<a>인원:
				<input type="number" name="peopleNum" min="0" max="10" value="1" step="1">
			명(최대인원:10명)</a>
			<br>
			
		</div>
		</div>
		
	</div>
	<br><br>
	

	<div class="page"><!-- div class="content3_1"엿던것 -->
	<h2>예약자 세부 정보 입력</h2>
	
		<div class="content3_2">
		<br>
		<!-- 
		<input type="checkbox" id="same" name="same" value="same"><label for="same">예약자와 투숙객이 일치하다면 체크해주세요</label>
		 -->
		<!-- 이거 쉽다고 나중에 해도된다고 하심 -->
	
		</div>
	
	
	<hr style="border:solid 1px grey;">
	
	
	<div class="content3">
	<br>
	 이름 : <input type="text" name="memName" placeholder="이름을 입력해주세요." required>
	 <br><br>
	 전화번호 : <input type="text" name="phone" placeholder="전화번호를 입력해주세요." required>
	</div>
	<br><br><br>
	
	<div class="content4">
	<h2>한달 살기 규칙 검토</h2><br>
	<div class="content4_1" align="right">
	<input type="checkbox" value="체험확인" name="mustCheck" required>규칙을 확인하였습니다.
	</div>
	<hr>
		체크인<br>
		15:00~21:00<br>
		
		체크아웃<br>
		08:00~11:00<br>

		숙소 유형에 따라 취소 및 선결제 정책이 달라집니다. 옵션을 선택할 때는 반드시 예약조건을 확인해주시기 바랍니다.<br>
		
		아동 투숙이 불가합니다.<br>
		
		이 숙소에서는 엑스트라 베드를 이용하실 수 없습니다.<br>
		
		만 18세 이상만 체크인 가능합니다.<br>

		숙소에서 흡연이 불가능합니다.<br>

		파티/행사를 허용하지 않습니다.<br>

		반려동물 동반이 불가능합니다.<br>
		<hr>
		<br><br>
		
		<input type="hidden" id="memNo1" name="memNo" value="<%= loginUser.getMemNo() %>">											
		
		<div class="button">
		<button type="submit" class="btn btn-primary">예약하기</button>
		</div>
	</div>
	</div>
	</form>
	
	
	</div>
	
	<script>
		function list(memNo){
			location.href = "<%=contextPath%>/month.li?memNo="+memNo;
		}
		</script>








	<%@ include file="../common/footer.jsp" %>
</body>
</html>