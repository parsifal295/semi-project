			$(function(){
			
				$('.table>tbody>tr').click(function(){
				
					const nno = $(this).children().eq(0).text();
					
					location.href="detail.pn?nno=" + nno;
					
				})
			
			});
			
			
		