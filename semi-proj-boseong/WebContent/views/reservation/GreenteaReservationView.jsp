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
		
		
	.content3_1{
			width:600px;
			height:200px;
			float : left;
	}	
		
	.content3_2{
			width:1000px;
			height:200px;
		
			
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
	
	<div class="content1"></div>
	<div class="content2"></div>
	<br><br>
	
	<div class="content3_1">
	<h2>예약자 세부 정보 입력</h2>
	<hr style="border:solid 1px grey;">
	</div>
	
	<div class="content3_2">
	<p>예약자와 투숙객이 일치하다면 체크해주세요</p>
	<input type="checkbox" id="same" name="same" value="same"><label for="same"></label>
	
	</div>
	
	
	<br>
	<div class="content3">
	<br>
	 이름 : <input type="text" name="memName" placeholder="이름을 입력해주세요." required>
	 <br><br>
	 아이디 : <input type="text" name="memId" placeholder="아이디를 입력해주세요." required>
	 <br><br>
	 전화번호 : <input type="text" name="phone" placeholder="이름을 입력해주세요." required>
	</div>
	
	<div class="content4">
	<h2>체험 이용 규칙 검토</h2>
	<hr>
	이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게
	</div>
	
	
	
	
	
	</div>
	</div>









	<%@ include file="../common/footer.jsp" %>
</body>
</html>