let thumbnails = document.getElementsByClassName("thumbnail");
	    for(i=0; i<thumbnails.length;i++){
	    	let lodgeNo = i+1;
	    	thumbnails[i].onclick= function(){
	            location.href="<%=contextPath%>/month.de?lodgeNo=" + lodgeNo;
	            return;
	        }
	    }
	    
	    function list(memNo){
			location.href = "<%=contextPath%>/month.li?memNo="+memNo;
		}