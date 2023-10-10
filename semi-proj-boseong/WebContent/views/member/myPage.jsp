<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.page {
	padding : 0;
	margin : 0;
	width : 100%;
	height : 100vh;
	color : black;
}
#content {
	width : 1302px;
	height : 100%;
	margin : auto;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<%
		String memId = loginUser.getMemId();
		String memName = loginUser.getMemName();
		String phone = loginUser.getPhone();
		String area = loginUser.getArea();
		
		String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
		
		//System.out.println(area);
	%>
	
	<div class="page" id="content">
	
	<div style="height : 200px"></div>
	
		<div class="page">
			<br>
			<h3 align="center">마이페이지</h3>
			<form action="<%= request.getContextPath() %>/update.me" method="post">
	      	<br>
	      	<table align="center">
	      		<tr>
	      			<td>* 아이디</td>
	      			<td><input type="text" name="memId" readonly value="<%= memId %>" maxlength="12" required></td>
	      		</tr>
	      		<tr>
					<td>* 이름</td>
					<td><input type="text" name="memName" readonly value="<%= memName %>" maxlength="5" required></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;이메일</td>
					<td><input type="email" name="email" value="<%= email %>"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;전화번호</td>
					<td><input type="text" name="phone" value="<%= phone %>" placeholder="-포함해서 입력해주세요."></td>
				</tr>
				<tr>
				<td>&nbsp;&nbsp;주소</td>
				<td>
				  <select class="custom-select custom-select-sm mb-3" name="area" value="<%= area %>" required>
				      <option selected>주소를 선택해주세요</option>
				      <option value="서울">서울</option>
				      <option value="경기도">경기도</option>
				      <option value="전라도">전라도</option>
				      <option value="충청도">충청도</option>
				      <option value="경상도">경상도</option>
				      <option value="제주도">제주도</option>
				  </select>
				</td>								
				</tr>
	      	</table>
	      	
	      	<script>
	      		let area = '<%= area %>';
	      		$('option').each(function(){
	      			if(area.search($(this).val()) != -1){
	      				$(this).attr('selected', 'true');
	      			}
	      		});
	      	
	      	</script>
	      	
	      	<br><br>
	      	<div align="center">
				<button type="submit" class="btn btn-secondary btn-sm">정보수정</button>
                <button type="button" class="btn btn-warning btn-sm" data-toggle ="modal" data-target="#updatePwdForm">비밀번호 수정</button>
                <button type="button" class="btn btn-danger btn-sm" data-toggle ="modal" data-target="#deleteForm">회원탈퇴</button>
			</div>
	      </form>
		</div>
		
		<div class="page">
			<h3>쪽지함</h3>
		</div>
	
	</div>
</body>
</html>