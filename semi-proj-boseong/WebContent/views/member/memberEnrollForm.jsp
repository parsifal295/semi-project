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
	      <form action="<%= request.getContextPath() %>/insert.me" method="post" id="enroll-form">
	      	<table>
	      		<tr>
	      			<td>* 아이디</td>
	      			<td><input type="text" name="memId" maxlength="12" id="memId" required ></td>
	      			<td><button type="button" onclick="idCheck();" class="btn btn-outline-dark">중복확인</button>
	      		</tr>
	      		<tr>
	      			<td>* 비밀번호</td>
	      			<td><input type="password" name="memPwd" maxlength="15" id="pwd" required></td>
	      		</tr>
	      		<tr>
	      			<td>* 비밀번호 확인</td>
	      			<td><input type="password" maxlength="15" id="pwdcheck" required></td>
	      		</tr>
	      		<tr>
					<td>* 이름</td>
					<td><input type="text" name="memName" maxlength="5" id="memName" required></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>* 전화번호</td>
					<td><input type="text" name="phone" placeholder="-포함해서 입력해주세요." id="phone"></td>
				</tr>
				<tr>
				<td>* 주소</td>
				<td>
				  <select class="custom-select custom-select-sm mb-3" name="area" required>
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
	      	
	      	<div align="center" id="enroll-button">
				<button type="submit" disabled onclick="checkMail" class="btn btn-success">회원가입</button>
			</div>
	      	
	      </form>
	      </div>
	      
	      <script>
	      
	      	// 아이디 중복체크
	      	
	      	function idCheck(){
	      		
	      		const $memId = $('#enroll-form input[name=memId]');
	      		
	      		$.ajax({
	      			url : 'idCheck.me',
	      			data : {checkId : $memId.val()}, //키, 밸류
	      			success : function(result){
	      				//console.log(result)
	      				if(result == 'NNNNN'){
	      					alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
	      					$memId.val('').focus();
	      				} else {
	      					if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
	      						$memId.attr('readonly', true);
	      						$('#enroll-button button[type=submit]').removeAttr('disabled');
	      					}
	      					else {
	      						$memId.val('').focus();
	      					}
	      					
	      				}
	      			},
	      			error : function(){
	      				console.log('아이디 중복체크 실패');
	      			}
	      		});
	      	}
	      	
	      	// 아이디 유효성 검사
	      	$('#memberEnrollForm').on('submit',() => {
		    	let idval = $('#memId').val()
		        let idvalcheck = /^[a-z0-9]+$/
		        if (!idvalcheck.test(idval) || idval.length<6){
		        	alert('아이디는 영소문자 및 숫자를 포함하여 6글자 이상으로 입력해주세요.')
		            $('#memId').focus().removeAttr('readonly');
		        	$('#enroll-button button[type=submit]').attr('disabled', true);
		            return false
		        }
		    });
	      	
	      	// 비밀번호 유효성 검사
	      	$('#memberEnrollForm').on('submit',() => {
		    	let pwdval = $('#pwd').val()
		        let pwdvalcheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$/;
		        if (!pwdvalcheck.test(pwdval) || pwdval.length<8){
		        	alert('비밀번호는 대소문자 및 숫자를 포함하여 8자 이상으로 입력해주세요.');
		            $('#pwd').focus()
		            return false
		        }
		        	/*
		        	if(pwd.value != pwdcheck.value) {
		        		alert('비밀번호 확인을 다시 입력해주세요.');
			            $('#pwdcheck').focus()
			            return false
		        	}
		        	*/
		    });
	      	
	      	// 핸드폰번호 유효성 검사
	      	$('#memberEnrollForm').on('submit',() => {
		    	let phoneval = $('#phone').val()
		        let phonevalcheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		        if (!phonevalcheck.test(phoneval) || phoneval.length<12){
		        	alert('핸드폰번호는 -포함해서 입력해주세요.')
		            $('#phone').focus()
		            return false
		        }
		    });
	      	
	      	
	      	
	      	
	      	
	      	
	        
	      </script>
	      
	      
	      
	      
	      
	    
	    
	      
	      
	      
	      	
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>


</body>
</html>