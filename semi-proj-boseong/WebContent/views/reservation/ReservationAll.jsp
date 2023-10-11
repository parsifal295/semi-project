<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="java.util.ArrayList, 
    		com.boseong.jsp.reservation.model.vo.GreenteaReservation,
    		com.boseong.jsp.reservation.model.vo.HanokReservation,
    		com.boseong.jsp.reservation.model.vo.MonthlivingReservation,
    		com.boseong.jsp.reservation.model.vo.HorseReservation"
    
    %>
    
    <%
	
    ArrayList<GreenteaReservation> list = (ArrayList<GreenteaReservation>) request.getAttribute("list");

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 전체 조회</title>
	
<style>

	.allouter{
			width : 1400px;
			height : 1500px;
			margin : auto;
			margin-top : 300px;
		}

	.title{
		margin-bottom:50px;
	}


	.container{
		width : 1800px;
		height : 800px;
	}

	

	.hanok{
	margin-bottom:50px;
	}
	
	.table{
	margin-bottom:50px;
	}


	.horse{
	margin-bottom:50px;
	}
	.monthliving{
	margin-bottom:50px;
	}
	
	
</style>

</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="allouter">

	<div class="hanok">
		<div class="title"><h2>예약 전체 조회</h2></div>
		
			
			<div class="title1"><h4>한옥 예약</h4></div>
			<table border="1" id="table1">
				<tr bgcolor="#DCDCDC">
					<th width="300" height="60">Room No</th>
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
					<td><button type="button" class="btn btn-danger" >예약취소(이거 회원탈퇴 모달형식으로 진행)</button></td>
				</tr>
			</table><!-- table -->
			
		</div><!-- title -->
	
	
	
		<!-- 테이블2-------------------------------------------------------------- -->
		
		<div class="monthliving">
		
		<div class="title1"><h4>한달 살기</h4></div>
		<table border="1" id="table2">
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
				<td><button type="button" class="btn btn-danger" >예약취소</button></td>
			</tr>
		
		
		</table><!-- table2 -->
		</div><!-- monthliving -->
		
		
		<!-- 테이블3-------------------------------------------------------------- -->
		
		<div class="horse">
		<div class="title1"><h4>승마 체험</h4></div>
		<table border="1" id="table2">
			<tr bgcolor="#DCDCDC">
				<th width="300" height="60">프로그램 종류</th>
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
				<td><button type="button" class="btn btn-danger" >예약취소</button></td>
			</tr>
		
		
		</table><!-- table2 -->
		</div><!-- monthliving -->
		
		<!-- 테이블4-------------------------------------------------------------- -->
		
		<div class="monthliving">
		<div class="title1"><h4>녹차밭 체험</h4></div>
		<table border="1" id="table2">
			<tr bgcolor="#DCDCDC">
				<th width="300" height="60">예약 회차</th>
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
				<td><button type="button" class="btn btn-danger" >예약취소</button></td>
			</tr>
		
		
		</table><!-- table2 -->
		</div><!-- monthliving -->
		
	</div><!-- allouter -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

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