                function validatePwd(){
					 		
                    if($('#updatePwd').val() != $('#checkPwd').val()){
                        alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                        $('#checkPwd').focus();
                        return false;
                    }
                    
                    return true;
                }