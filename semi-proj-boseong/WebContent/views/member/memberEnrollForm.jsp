<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
	<!-- 회원가입 모달창 -->
	<div class="modal" id="memberEnrollForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원가입</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      <form action="/jsp/insert.me" method="post">
	      	<table>
	      		<tr>
	      			<td>* 아이디</td>
	      			<td><input type="text" name="memId" maxlength="12" required></td>
	      		</tr>
	      		<tr>
	      			<td>* 비밀번호</td>
	      			<td><input type="password" name="memPwd" maxlength="15" required></td>
	      		</tr>
	      		<tr>
	      			<td>* 비밀번호 확인</td>
	      			<td><input type="password" maxlength="15" required></td>
	      		</tr>
	      		<tr>
					<td>* 이름</td>
					<td><input type="text" name="memName" maxlength="5" required></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>* 전화번호</td>
					<td><input type="text" name="phone" placeholder="-포함해서 입력해주세요."></td>
				</tr>
				<tr>
				<td>* 주소</td>
				<td>
				  <select class="custom-select custom-select-sm mb-3" name="area" required>
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
	      	
	      	<div align="center">
				<button type="submit">회원가입</button>
			</div>
	      	
	      </form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>


</body>
</html>