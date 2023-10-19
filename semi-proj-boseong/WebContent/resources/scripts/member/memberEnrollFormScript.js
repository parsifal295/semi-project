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
	      	
	      	// 유효성 검사
	      	
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
		    	let memPwdval = $('#memPwd').val()
		        let memPwdvalcheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$/;
		        if (!memPwdvalcheck.test(memPwdval) || memPwdval.length<8){
		        	alert('비밀번호는 대소문자 및 숫자를 포함하여 8자 이상으로 입력해주세요.');
		            $('#memPwd').focus()
		            return false
		        }
		    });

			// 비밀번호 확인 유효성 검사
			$('#memberEnrollForm').on('submit',() => {
				const memPwdval = $('#memPwd').val()
				const pwdcheck = $('#pwdcheck').val()
				if (memPwdval.value != pwdcheck.value) {
					alert('비밀번호 확인을 다시 입력해주세요.');
				  $('#pwdcheck').focus()
				  return false
				}
			});
	      	
	       // 이름 유효성 검사
	       $('#memberEnrollForm').on('submit',() => {
		       let memNameval = $('#memName').val()
		       let memNamevalcheck = /^[가-힣]{2,6}$/;
		       if (!memNamevalcheck.test(memNameval) || memNameval.length<1){
		           alert('이름은 한글로 2자~6자 사이로 입력해주세요.')
		           $('#memName').focus()
		           return false
		       }
		    }); 
	       
	        // 이메일주소 유효성 검사
	      	$('#memberEnrollForm').on('submit',() => {
		    	let emailval = $('#email').val()
		        let emailvalcheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		        if (!emailvalcheck.test(emailval) || emailval.length<3){
		        	alert('이메일')
		            $('#email').focus()
		            return false
		        }
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
	    
	      