
$(function(){
	//Hanok Front View
	let rooms = document.getElementsByClassName("room");
	for(i=0; i<rooms.length;i++){
		let roomNo = i+1;
		rooms[i].onclick= function(){
			location.href="roomdetail.rsv?roomNo="+roomNo;
			return;
		}
	}
	$('.room').mouseover().css('cursor', 'pointer');
	$('#reserv-hanok').click(function(){location.href="hanokForm.rsv"});
	//Hanok List View
	$('.hanok-rserv-info').each(function(){
		let reservation = $(this);
		$.ajax({
			url:'roominfo.rsv',
			data : {roomNo : $(this).children().eq(1).text()},
			success : function(result){
				let clientNo =reservation.children().eq(3).text();
				reservation.children().eq(1).text(result.roomType);
				reservation.children().eq(3).text(clientNo+' / '+result.maxNum);
				let price = (clientNo-result.baseNum)*result.extraPrice + result.price;
				reservation.children().eq(5).text(price + '원');

			},
			error : function(){
				console.log('ajax실패');
			}
		})
	})
	//Hanok Reserv Form
	$('#date-check').click(function(){
		if($('#roomType').val()==0){
			alert('객실 타입을 선택해주세요.');
			$('#roomType').focus();
		}
		else{
			$.ajax({
				url : 'datecheck.hk',
				data : {roomNo : $('#roomType').val(), 
						fromDate : $('#fromDate').val(),
						toDate : $('#toDate').val()},
				success : function(e){
					//선택한 방에 이미 예약되어있는 날짜들 가져오기
					if(e.length == 0){
						let dateConfirm = confirm('예약 가능한 날짜입니다! 이 날짜에 예약하시겠습니까?');
						if(dateConfirm){
							$('#date-check').attr('disabled', true);
							$('#confirm-button>button').attr('disabled', false);
						}
					}
					else{
						let str=$('#roomType :selected').text()+'에는 다음 기간에 이미 예약이 존재합니다ㅜㅜ';
						for (let i in e){
							str += '\n' + e[i].fromDate + ' ~ ' + e[i].toDate;
						}
						alert(str);
					}
				},
				error: function(){alert('ajax 왤케어려움... 난리남');}
			})
		}

		});

	$('#roomType').change(function(){
		let roomNo = $(this).val();
		$.ajax({
			url : 'detail.hk',
			data : {roomNo : roomNo},
			success : function(e){
			$('#clientNum').attr({min :e.baseNum, placeholder:e.baseNum, max : e.maxNum}).val(e.baseNum);
			$('#reserv-info').children().eq(4).text(e.price+'원');
			let $extraPrice = (e.extraPrice==0)? '해당 없음' : e.extraPrice+'원';
			$('#reserv-info').children().eq(5).text($extraPrice);
			$('#reserv-info span').text('최대인원 : '+e.maxNum);
			},
		
			error : function(e){
				alert('실패');
				console.log(e);
			}
			})
		});
	
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
	$('#fromDate').attr('min', today).val(today);
	$('#fromDate').change(function(){
		//2023-09-22
		let dateChosen = Number($(this).val().substr(8, 2));
		let monthChosen = Number($(this).val().substr(5, 2));
		let yearChosen = Number($(this).val().substr(0,4));
		
		let thirtyone = [1, 3, 5, 7, 8, 10, 12];
		let thirty = [4,6,9,11];
		
		if(thirtyone.indexOf(monthChosen)!= -1){
			if(dateChosen<31){
				dateChosen += 1;
				dateChosen = dateChosen.toString();
			}
			else{
				dateChosen = '01';
				if(monthChosen==12){
					monthChosen = '01';
					yearChosen +=1;
					yearChosen = yearChosen.toString();
				}
				else{
					monthChosen += 1;
					monthChosen = monthChosen.toString();
				}
			}
		}
		else if(thirty.indexOf(monthChosen) != -1)
		{
			if(dateChosen<30){
				dateChosen += 1;
				dateChosen = dateChosen.toString();
			}
			else{
				dateChosen = '01';
				monthChosen += 1;
				monthChosen = monthChosen.toString();
			}
		}
		else{
			if(yearChosen%4 == 0){
				//윤년
				if(dateChosen<29){
					dateChosen += 1;
					dateChosen = dateChosen.toString();
				}
				else{
					dateChosen = '01';
					monthChosen += 1;
					monthChosen = monthChosen.toString();
				}
			}
			else
			{
				if(dateChosen<28){
					dateChosen += 1;
					dateChosen = dateChosen.toString();
				}
				else{
					dateChosen = '01';
					monthChosen += 1;
					monthChosen = monthChosen.toString();
				}
			}
		}
		let finalDate = yearChosen+'-'+monthChosen+'-'+dateChosen;
		$('#toDate').attr('min', finalDate);
	})
	//Hanok Update Form
	$('#date-recheck')
			.click(
					function() {
						if ($('#roomType').val() == 0) {
							alert('객실 타입을 선택해주세요.');
							$('#roomType').focus();
						} else {
							$.ajax({
							url : 'datecheck.hk',
							data : {
								roomNo : $('#roomType').val(),
								fromDate : $('#fromDate').val(),
								toDate : $('#toDate').val(),
							},
							success : function(e) {
								//선택한 방에 이미 예약되어있는 날짜들 가져오기
								for(let i in e){
									console.log(e[i].fromDate);
									console.log(e[i].toDate);
									if((e[i].fromDate=="<%=selectedRsv.getFromDate()%>")&&(e[i].toDate=="<%=selectedRsv.getToDate()%>")){
										e.splice(i, 1);
									}
								}
								if (e.length == 0) {
									let dateConfirm = confirm('예약 가능한 날짜입니다! 이 날짜에 예약하시겠습니까?');
									if (dateConfirm) {
										$('#date-check').attr('disabled',true);
										$('#confirm-button>button').attr('disabled',false);
									}
								} else {
									let str = $(
											'#roomType :selected')
											.text()
											+ '에는 다음 기간에 이미 예약이 존재합니다ㅜㅜ';
									for ( let i in e) {
										str += '\n체크인 : '
												+ e[i].fromDate
												+ ' 체크아웃 : '
												+ e[i].toDate;
									}
									alert(str);
								}
							},
							error : function() {
								alert('ajax 왤케어려움... 난리남');
							}
						})
						}

					});

			})

	function reservPageShift(page, memNo){
		let pageLocation = 'list.hk?memNo='+memNo+'&cpage='+page;
		location.href=pageLocation;
	}