<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>
   
   <!-- 로그인 모달 창 -->
	<div class="modal" id="loginForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">로그인</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      
	      <div class="modal-body">
	      <form action="<%= request.getContextPath() %>/login.me" method="post">
		     <div class="form-group">
		     	<input type="text" name="memId" placeholder="아이디" required >
		     </div>
		    
		     <div class="form-group">
		         <input type="password" name="memPwd" placeholder="비밀번호" required >
		     </div>
		    
		     <div class="form-group">
		    
		         <input type="submit" class="btn btn-secondary" id="btn-login" value="로그인">
		    
		         <input type="button" class="btn btn-secondary" value="회원가입" onclick="location.href='#'">
		    
		     </div>
	      
	      </form>
	                
		  </div>
	      	
	      
	     
		      
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	

 
	

</body>
</html>