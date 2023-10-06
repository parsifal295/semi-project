<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한달살기 예약 페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

  
  <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.9/index.global.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.9/index.global.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>




<style>
	.outer{
				width : 1400px;
				height : 2370px;
				margin : auto;
				margin-top : 300px;
			}
			

	.content12{
			width : 1400px;
			height : 650px;
			
	}	
		
		
	.content1{
			width : 700px;
			height : 500px;
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
              right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            dateClick: function(info) {
              alert('clicked ' + info.dateStr);
            },
            select: function(info) {
              alert('selected ' + info.startStr + ' to ' + info.endStr);
            }
          });
        calendar.render();
      });

    </script>
	<!-- 스크립트끝 -->




<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
	<hr style="border:solid 0.5px grey;">
	<h2 align="center">한달살기 예약하기</h2>
	<hr style="border:solid 0.5px grey;">
	
	<br><br>
	
	<div class="content12">
	
		<div class="content1">
		<div id='calendar'></div>
		<!--  <img src="https://7calendar.com/calendar/monthly/png/9-2023-a4-l-0-24-kr.png" width="700", height="500";>-->
		</div>
		
		<div class="content2">
			<h2>내 예약 정보</h2>
			예약일:
			<!--  
			<select name="select-month"> 
			<option>2023년</option>
			<option>2024년</option>
			</select>
			
			
			
			<select name="select-month"> 
            <option>1월</option>
            <option>2월</option>
            <option>3월</option>
            <option>4월</option>
            <option>5월</option>
            <option>6월</option>
            <option>7월</option>
            <option>8월</option>
            <option>9월</option>
            <option>10월</option>
            <option>11월</option>
            <option>12월</option>
            
            </select>
            -->
			<br><br>
			
			
			인원:
				<input type="number" name="amount" min="0" max="50" value="1" step="1">

			<br>
			
		
		
		</div>
		
		
	</div>
	<br><br><br>
	
	<div class="content3_1">
	<h2>예약자 세부 정보 입력</h2>
		<div class="content3_2">
		<input type="checkbox" id="same" name="same" value="same"><label for="same"></label>
		예약자와 투숙객이 일치하다면 체크해주세요
	
		</div>
	
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
		
	</div>
	<br>
		<div class="button">
		<button type="button" class="btn btn-primary">예약하기</button>
		</div>
	
	
	</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>

















<%@ include file="../common/footer.jsp" %>
</body>
</html>