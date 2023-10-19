		
function reserveAride(login){
	if(login=='Y'){
		location.href = "horseForm.rsv";
	}
	else{
		alert('로그인 후 사용가능한 서비스입니다.');
	}	
};
function rideList(memNo){
	location.href = "list.hs?memNo="+memNo+"&cpage=1";
};
	$(function() {
		
		//----------HorseReservForm---------------------------------
		//페이지 로드 시 오늘의 날짜를 'yyyy-MM-dd'형식으로 만들어서
		//input:date 인 #horseDate의 최솟값으로 정해준다.
		let now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth()+1;
		let date = now.getDate();
		
		if(month<10){
			month = '0'+month;
		}
		if(date<10){
			date = '0'+date;
		}
		let today = year+'-'+month+'-'+date;
		$('#horseDate').attr('min', today).val(today);
		
		
		$(':text').click(function() {
			alert('예약자 성함과 연락처가 다르다면 회원정보를 변경해주세요!');
		});
		//예약 가능시간 : 10시~ 20시, 날짜 선택 시  해당 날짜에 이미 예약된 시간을 조회해와서
		//이를 제외한 시간대의 option만 생성
		$('#horseDate').change(
				function() {
					$.ajax({
						url : 'datecheck.hs',
						data : {
							horseDate : $('#horseDate').val()
						},
						type : 'get',
						success : function(result) {
						$('#horseTime').empty();
						let $choice = $('<option></option>').text('시간').val(0);
						$('#horseTime').append($choice);
							//자바스크립트, 제이쿼리 혼합문에서 제이쿼리 형식으로 바꿈!
						for (let i = 10; i < 21; i++) {
							if (result.indexOf(i) == -1) {
							let $time = $('<option></option>').text(i+'시').val(i);
							$('#horseTime').append($time);
							}

						}

						},
						error : function(result) {
							console.log('실패');
							console.log(result);

						}
					})
				});
		//-----Reserv List View ------------------------------
		$('.update-hs').click(function(){
			let reservNo = $(this).parent().parent().children().eq(0).text();
			location.href = "updateForm.hs?cpage=1&reservNo="+reservNo;
		});
		//-----Update Form

		
		
	})
	
	function reservPageShift(page, memNo){
		let pageLocation = 'list.hs?memNo='+memNo+'&cpage='+page;
		location.href=pageLocation;
	}