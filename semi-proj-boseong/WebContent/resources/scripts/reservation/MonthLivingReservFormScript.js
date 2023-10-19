

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            selectable: true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth'
            },
            dateClick: function(info) {
            	$("#startMonth").val(info.dateStr);
            	console.log(info);
            	
            	 var str = info.dateStr;
            	 var result1 = str.substring(0,7);
            	 console.log(result1);
            	 $("#startDate").val(result1);
            	 //자바스크립트로 값을 지정해줘야댄다고 하심
            	 //method를 써서...substr 써서..
            	 //2023-10-14
            }
            ,validRange: function(nowDate) {
        	    return {
          	      start: nowDate-1
          	    };
          	  }
 
          });
        calendar.render();
      });
		
     
      
      
      
      
  