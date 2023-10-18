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
	#search-reserv{
		height:750px;
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
		padding-left:900px;
	}
	.reserv-page{
	background-color: rgb(242, 245, 236);
	}
	
</style>

</head>
<body>

<%@ include file = "../common/menubar.jsp" %>
<div id = "box"></div>
<div class="reserv-page">
	<div id="content" class="page"><!--content 너비는 1032, 높이는 화면 크기에 맞춰짐-->
		<div class = "page">
			<h1><span id="reserv-type">통합</span>예약 관리</h1>
			<div>
				<h2>주요 현황</h2>
				
				<div>
					<div class="reserv-type">
						<img src="<%=contextPath %>/resources/image/reservation/ride-icon3.png" alt="">
						<div>
							<h5>승마장</h5>
						</div>
					</div>
					<div class="verticalbar">
						<div>
							<h1><%=horseCount %></h1>
						</div>
					</div>
					<div class="reserv-type">
						<img src="<%=contextPath %>/resources/image/reservation/tea-icon.png">
						<div>
							<h5>녹차 체험</h5>
						</div>
					</div>
						<div class="verticalbar">
						<h1><%=teaCount %></h1>
						</div>
					<div class="reserv-type">
						<img src="<%=contextPath %>/resources/image/reservation/hanok-icon.png">
						<div>
							<h5>한옥 스테이</h5>
						</div>
					</div>
					<div class="verticalbar">
					<h1><%=hanokCount %></h1>
					</div>
					<div class="reserv-type">
						<img src="<%=contextPath %>/resources/image/reservation/month-icon.png">
						<div>
							<h5>한달 살기</h5>
						</div>
					</div>
					<div class="verticalbar">
					<h1><%=monthCount %></h1>
					</div>
				</div>
			</div>
						<script>
					$(function(){
						$('.reserv-type>div').click(function(){
								let title = $(this).children().text();
								$('#reserv-type').text(title);
								$.ajax({
									url:'getList.rsv',
									data:{type:title, cpage:1},
									success : function(e){
										console.log('ajax succeed');
										console.log(e);
											$('#reserv-table-body').empty();
										
										for(let i=0; i<e.length;i++){
											$el =$('<tr></tr>');
											$el.append($('<td></td>').text(e[i].reservNo));
											$el.append($('<td></td>').text(e[i].member));
											$el.append($('<td></td>').text(e[i].phone));
											$el.append($('<td></td>').text(e[i].type));
											$el.append($('<td></td>').text(e[i].startDate));
											$el.append($('<td></td>').text(e[i].status));
											$('#reserv-table-body').append($el);
										}

									},
									error : function(e){
										console.log('ajax failed');
									}
								})
								})
							})	
						</script>
			<div id="search-reserv">
				<div>
					<h4>최근 예약내역</h4>
				</div>
				<div>
					<input type="radio" id="search-by-id" name="searchType" checked value="id"><label for="search-by-id">아이디</label>
					<input type="radio" id="search-by-no" name="searchType" value="no"><label for="search-by-no">예약번호</label>
					<input type="text" placeholder="검색어를 입력하세요(기본 : 예약자 아이디로 검색)" name="searchKey" id="search-key" required style="width:400px">
					<button type="submit" onclick="return test();">
					<img class="search-icon" src="https://icons.veryicon.com/png/o/miscellaneous/conventional-use/advanced-search.png">
					</button>
				</div>
				<script>
					function test(){
						let types = document.getElementsByName('searchType');
						let key = document.getElementById('search-key').value;
						let searchType;
						let regExp = /^[0-9]+$/;
						for(let i =0; i<types.length; i++){
							if(types[i].checked){
								searchType = types[i].value;
							}
						}
						if(searchType == 'no'){
							if(!regExp.test(key)){
								alert('예약번호로 검색합니다. 숫자만 입력해주세요.');
								return false;
							}							
						}
						return true;						
					}
				</script>
				<script>
					$(function(){
						$('button:submit').click(function(){
							$.ajax({
								url : 'search.rsv',
								data : {searchType : $(':radio').filter(':checked').val(), searchKey : $('#search-key').val()},
								success: function(e){
									$('#reserv-table-body').empty();
									$('#reserv-type').text('');									
									//예약 번호로 조회해서 객체이거나 널이거나
									$el =$('<tr></tr>');
									if(e == null || e.length==0){
										$('#reserv-table-body').append($('<tr><td colspan="6"></td></tr>')).text('예약 정보가 존재하지 않습니다.');
									}
									else
									{
										for(let i in e){
										$el =$('<tr></tr>');
										$el.append($('<td></td>').text(e[i].reservNo+'('+e[i].reservType+')'));
										$el.append($('<td></td>').text(e[i].member));
										$el.append($('<td></td>').text(e[i].phone));
										$el.append($('<td></td>').text(e[i].type));
										$el.append($('<td></td>').text(e[i].startDate));
										$el.append($('<td></td>').text(e[i].status));
										$('#reserv-table-body').append($el);			
										}
									}
								},
								error:function(e){
									console.log(e);
								}
							})
						})
					})
				</script>


				<table class="table">
					<thead>
						<tr id="reserv-table-head">
							<th>예약 번호</th>
							<th>예약자 아이디</th>
							<th>전화번호</th>
							<th>예약종류</th>
							<th>예약 날짜(시작일)</th>
							<th>예약 상태</th>
						</tr>
					</thead>
					<tbody id="reserv-table-body">
						<tr>
							<td colspan="5">예약 종류를 선택해주세요.</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<div id="update-area">
				<div class="btn-group">
					<input type="text" placeholder="예약 번호" id="reservNo" name="reservNo">
					<button class="btn btn-success">예약 삭제</button>
				</div>
			</div>
			<script>
			
			</script>
		
		</div>
	</div>
	</div>
<%@include file = "../common/footer.jsp" %>

</body>
</html>