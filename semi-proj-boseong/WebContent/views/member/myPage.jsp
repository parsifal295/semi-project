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
	
		<div class="page" id="myPage">
			<h3 align="center">마이페이지</h3>
			<br>
			
			<form id="mypage-form" action="<%= request.getContextPath() %>/update.me" method="post">
	      	
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
					<td><input type="email" name="email" id="email" value="<%= email %>"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;전화번호</td>
					<td><input type="text" name="phone" id="phone" value="<%= phone %>" placeholder="-포함해서 입력해주세요."></td>
				</tr>
				<tr>
				<td>&nbsp;&nbsp;주소</td>
				<td>
				  <select class="custom-select custom-select-sm mb-3" name="area" value="<%= area %>" required>
				      <option selected>주소를 선택해주세요</option>
				      <option value="서울">서울</option>
				      <option value="경기도">경기도</option>
				      <option value="강원도">강원도</option>
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
				<button type="submit" class="btn btn-success">정보수정</button>
                <button type="button" class="btn btn-warning" data-toggle ="modal" data-target="#updatePwdForm">비밀번호 수정</button>
                <button type="button" class="btn btn-dark" data-toggle ="modal" data-target="#deleteForm">회원탈퇴</button>
			</div>
			
			
	      </form>
		</div>
		
		<script>
		/*
			// 이메일주소 유효성 검사
	      	$('#myPage').on('submit',() => {
		    	let emailval = $('#email').val()
		        let emailvalcheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		        if (!emailvalcheck.test(emailval) || emailval.length<3){
		        	alert('이메일')
		            $('#email').focus()
		            return false
		        }
		    });
	       
	      	// 핸드폰번호 유효성 검사
	      	$('#myPage').on('submit',() => {
		    	let phoneval = $('#phone').val()
		        let phonevalcheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		        if (!phonevalcheck.test(phoneval) || phoneval.length<12){
		        	alert('핸드폰번호는 -포함해서 입력해주세요.')
		            $('#phone').focus()
		            return false
		        }
		    });
	      	*/
			</script>
			
		<!-- 비밀번호 수정 모달창 -->
		
		<!-- The Modal -->
		<div class="modal" id="updatePwdForm">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">비밀번호 변경</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<form action="<%= request.getContextPath() %>/updatePwd.me" method="post">
		      		 <div class="form-group">
					    <label for="memPwd">현재 비밀번호 :</label>
					    <input type="password" class="form-control" placeholder="현재 비밀번호를 입력해주세요." id="memPwd" name="memPwd"required>
					 </div>
					 <div class="form-group">
					    <label for="updatePwd">새로운 비밀번호 :</label>
					    <input type="password" class="form-control" placeholder="새로운 비밀번호를 입력해주세요." id="updatePwd" name="updatePwd" required>
					 </div>
					 <div class="form-group">
					    <label for="checkPwd">새로운 비밀번호 확인 :</label>
					    <input type="password" class="form-control" placeholder="새로운 비밀번호를 다시 입력해주세요." id="checkPwd" required>
					 </div>
					 <button type="submit" onclick="return validatePwd();" class="btn btn-warning">비밀번호 변경</button>
					 
					 <input type="hidden" name="memNo" value="<%= loginUser.getMemNo() %>">
							      	
		      	</form>  
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		<!-- 회원탈퇴 모달창 -->
		
		<!-- The Modal -->
		<div class="modal" id="deleteForm">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">회원 탈퇴</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<form action="<%= request.getContextPath() %>/delete.me" method="post">
		      		<div class="form-group">
                    <label for="deletePwd">안전한 회원 탈퇴를 위해 비밀번호를 다시 한 번 입력해주세요.</label>
                    <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." id="deletePwd" name="memPwd" required >
              		</div>
                 
                 	<button type="submit" class="btn btn-dark">회원 탈퇴</button>
							      	
		      	</form>  
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		<div class="page">
			<h3>쪽지함</h3>
		</div>
	
	</div>
	
<script type="text/javascript" src="resources/scripts/member/myPageScript.js"></script>
</body>
</html>