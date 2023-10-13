<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int horseCount = (request.getAttribute("horseCount")==null)? 0 : (int)request.getAttribute("horseCount");
	int teaCount = (request.getAttribute("teaCount")==null)? 0 : (int)request.getAttribute("teaCount");
	int hanokCount = (request.getAttribute("hanokCount")==null)? 0 : (int)request.getAttribute("hanokCount");
	int monthCount = (request.getAttribute("monthCount")==null)? 0 : (int)request.getAttribute("monthCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
<style>
	#reserv-type{
		color:green;
		font-weight: bold;
	}
	.reserv-type{
		width:250px;
		height:250px;
		float:left;
		margin:10px;
		padding:0;
	}
	.reserv-type>img{
		width: 200px;
		height: 200px;
		border-radius:100px;
		margin-left:20px;
		margin-top:5px;
	}
	.reserv-type>div{
		text-align: center;
		padding-top: 8px;
		
	}
	.reserv-type h5{
		cursor:pointer;
	}
	.verticalbar{
		width:50px;
		height:250px;
		float:left;
		margin-top:10px;
		text-align:center;
		padding-top:100px;
	}
	#search-reserv>div{
		margin-top:5px;
		float:left;
		width:50%;
	}
	.search-icon{
		width : 30px;
		height : 30px;
	}
	#update-area{
		padding-left:750px;
	}

</style>

</head>
<body>

<%@ include file = "../common/menubar.jsp" %>
<div id = "box"></div>
	<div id="content" classp="page"><!--content 너비는 1032, 높이는 화면 크기에 맞춰짐-->
		<div class = "page">
			<h1><span id="reserv-type">통합</span>예약 관리</h1>
			<div>
				<h2>주요 현황</h2>
				
				<div>
					<div class="reserv-type">
						<img src="https://w7.pngwing.com/pngs/676/968/png-transparent-horse-rider-equestrian-jockey-computer-icons-horse-animals-sport-racing.png" alt="">
						<div>
							<h5>승마장</h5>
						</div>
						<script>
					$(function(){
						$('.reserv-type>div').click(function(){
								let title = $(this).children().text();
								$('#reserv-type').text(title);
								$.ajax({
									url:'',
									data:{type:title},
									success : function(e){
										console.log('ajax succeed');
										console.log(e);
									},
									error : function(e){
										console.log('ajax failed');
									}
								})
								})
							})	
						</script>
					</div>
					<div class="verticalbar">
						<div>
							<h1><%=horseCount %></h1>
						</div>
					</div>
					<div class="reserv-type">
						<img src="https://png.pngtree.com/png-vector/20190319/ourmid/pngtree-vector-leaf-icon-png-image_845949.jpg">
						<div>
							<h5>녹차 체험</h5>
						</div>
					</div>
						<div class="verticalbar">
						<h1><%=teaCount %></h1>
						</div>
					<div class="reserv-type">
						<img src="https://cdn-icons-png.flaticon.com/512/4498/4498251.png">
						<div>
							<h5>한옥 스테이</h5>
						</div>
					</div>
					<div class="verticalbar">
					<h1><%=hanokCount %></h1>
					</div>
					<div class="reserv-type">
						<img src="https://static.thenounproject.com/png/5532605-200.png">
						<div>
							<h5>한달 살기</h5>
						</div>
					</div>
					<div class="verticalbar">
					<h1><%=monthCount %></h1>
					</div>
				</div>
			</div>
			<div id="search-reserv">
				<div>
					<h4>최근 예약내역</h4>
				</div>
				<div>
				<form action = "">
					<input type="radio" id="search-by-name" name="searchType" checked><label for="search-by-name">이름</label>
					<input type="radio" id="search-by-no" name="searchType"><label for="search-by-no">예약번호</label>
					<input type="text" placeholder="검색어를 입력하세요(기본 : 예약자 이름으로 검색)" name="search-key" required style="width:400px">
					<button type="submit">
					<img class="search-icon" src="https://icons.veryicon.com/png/o/miscellaneous/conventional-use/advanced-search.png">
					</button>
				</form>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th colspan="5">예약 종류를 선택해주세요.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">예약내역이 없습니다.</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<div id="update-area">
				<div class="btn-group">
					<input type="text" placeholder="예약 번호">
					<button class= "btn btn-secondary">예약 상세조회</button>
					<button class="btn btn-success">예약 수정</button>
					<button class="btn btn-success">예약 삭제</button>
				</div>
			</div>
		
		</div>
	</div>
<%@include file = "../common/footer.jsp" %>

</body>
</html>