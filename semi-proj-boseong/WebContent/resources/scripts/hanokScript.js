
$(function(){
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
})

	function reservPageShift(page){
		let pageLocation = 'list.hk?memNo=<%=memNo%>&cpage='+page;
		location.href=pageLocation;
	}