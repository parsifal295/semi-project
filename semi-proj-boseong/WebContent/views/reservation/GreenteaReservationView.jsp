<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹차밭 예약페이지</title>
<style>
	
	.outer{
			width : 1400px;
			height : 2370px;
			margin : auto;
			margin-top : 250px;
		}
		
	.content12{
			width : 1400px;
			height : 520px;
			
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
	<%@ include file="../common/menubar.jsp" %>

	
	<div class="outer">
	<hr style="border:solid 0.5px grey;">
	<h2 align="center">녹차밭 예약하기</h2>
	<hr style="border:solid 0.5px grey;">
	
	<br><br>
	<div class="content12">
	
		<div class="content1">
		<img src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/47uI/image/0Mp4oUq1ZFG7Q9VB61mP4GPBjg0.jpg" width="700", height="500";>
		</div>
		
		<div class="content2">
			<h2><strong>내 예약 정보</strong></h2>
			예약일 : 
			<br><br>
			예약 회차: 
        <select name="select-time"> 
            <option>오전(9시~12시)</option>
            <option>오후(12시~6시)</option>
           
        </select>
			<br><br>
			인원:
		수량 : <input type="number" name="amount" min="0" max="50" value="1" step="1">

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
	 아이디 : <input type="text" name="memId" placeholder="아이디를 입력해주세요." required>
	 <br><br>
	 전화번호 : <input type="text" name="phone" placeholder="이름을 입력해주세요." required>
	</div>
	<br><br><br>
	
	<div class="content4">
	<h2>체험 이용 규칙 검토</h2>
	<hr>
	이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게
	</div>
	<br>
		<div class="button">
		<button type="button" class="btn btn-primary">예약하기</button>
		</div>
	
	
	</div>
	</div>









	<%@ include file="../common/footer.jsp" %>
</body>
</html>