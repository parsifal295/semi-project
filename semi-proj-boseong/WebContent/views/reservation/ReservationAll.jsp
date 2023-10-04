<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 전체 조회</title>
	 
	 







<style>

	.allouter{
			width : 1400px;
			height : 1800px;
			margin : auto;
			margin-top : 300px;
		}

	.title{
		margin-bottom:30px;
	}


	.container{
		width : 1800px;
		height : 800px;
	}

	.table1{
		align:center;
	}



</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="allouter">

	<div class="title"><h2>예약 전체 조회</h2></div>
	
	<table border="1" id="table1">
		<tr bgcolor="#DCDCDC">
			<th width="300" height="60">숙소명</th>
			<th width="350">예약 날짜</th>
			<th width="250">인원</th>
			<th width="250">가격</th>
			<th width="100">예약번호 </th>
			<th width="100">예약취소 </th>
		</tr>
		
		<tr>
			<td height="200"></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><button type="button" class="btn btn-danger" >Danger</button></td>
		</tr>
	
	
	
	
	
	
	
	</table>

<!--  
<div class="container">
  <h2>예약 전체 조회</h2>
  <h3>한옥 예약</h3>
  
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
        <tr>
        <th width="300" height="60">숙소명</th>
        <th width="350">예약 날짜</th>
        <th width="200">인원</th>
        <th width="200">가격</th>
        <th width="200">예약 번호</th>
        <th width="100">예약 수정</th>

          
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>사진</td>
          <td>2023.10.1~2023.10.31</td>
          <td>3</td>
          <td>350000</td>
          <td>350000</td>
          <td>USA</td>
          
        </tr>
      </tbody>
    </table>
    -->
  </div>
</div>












</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>