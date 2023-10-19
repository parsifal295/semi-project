


	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            selectable : true,
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth'
            },

            dateClick: function(info) {
            	$("#startDate").val(info.dateStr)
            	console.log(info);
            },
            
            validRange: function(nowDate) {
        	    return {
          	      start: nowDate
          	    };
          	  }
            
            
            
            
          });
        
        
        
        
        
        
        
        calendar.render();
      });
		
     
      
      
      
      
  
	