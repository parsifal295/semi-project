<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승마장 예약 확인</title>
<style>
	#box{
		height:200px;
	}
	ul, li{
		list-style: none;
	}
	#horse-reserv-list{
		font-size: 25px;
	}
	#horse-reserv-list fieldset{
		margin: auto;
		width:90%;
		padding-left: 0;
	}
	#horse-reserv-list th, #horse-reserv-list td{
		padding:10px;
		width: 300px;
	}
	#horse-reserv-list div{
		border-radius: 20px;
		margin-right: 15px;
	}
</style>
</head>
<body>

	<%@include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">

		<div class="page">
			<h1>예약 조회</h1>
			<ul id="horse-reserv-list">
				<li>
					<fieldset>
						<legend><h2>승마 기초 체험</h2></legend>
						<div>
							<table>
								<tr>
									<th>예약일</th>
									<th>예약시간</th>
									<th>인원</th>
								</tr>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
								</tr>
							</table>
						</div>
					</fieldset>
				</li>
				<li>
					<fieldset>
						<legend><h2>승마 기초 체험</h2></legend>
						<div>
							<table>
								<tr>
									<th>예약일</th>
									<th>예약시간</th>
									<th>인원</th>
								</tr>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
								</tr>
							</table>
						</div>
					</fieldset>
				</li>
			</ul>

		</div>

	</div>


	<%@include file="../common/footer.jsp"%>

</body>
</html>