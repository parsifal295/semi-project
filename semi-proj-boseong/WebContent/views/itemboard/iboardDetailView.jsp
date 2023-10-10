<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boseong.jsp.itemboard.model.vo.ItemBoard, 
			     com.boseong.jsp.Attachment.model.vo.Attachment" %>
<%
	ItemBoard ib = (ItemBoard)request.getAttribute("ib");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성마켓</title>
<style>
    .iboardImg{
        width: 100%;
        height : 500px;
        border-radius: 10%;
    }
    #iboardContent{
        width : 90%;
        height: 400px;
        margin : auto;
        margin-top : 20px;
    }
    #info{
        width : 90%;
        height: 100px;
        margin : auto;
        margin-top : 20px;

    }
    #userInfo{
        width : 400px;
        height: 100%;
    }
    .userPf{
        width: 90px;
        height: 90px;
        margin : 8px;
    }
    #userPf-sub{
        width: 70%;
        height: 90px;
        float: right;
        margin-top : 10px;
    }
    #scrap-area{
        width: 200px;
        height :100px;
        float: right;
    }
    #scrap-image{
        width: 35px;
        height: 35px;
        float : right;
    }
    .subImg{
        display: flex;
        justify-content: center;
    }
    .sub-iboardImg{
        width:270px ;
        height: 350px;
        float: left;
        box-sizing: border-box;
        margin : 25px;
    }
    .outer{
        margin: auto;
        width: 100%;
        height: 1500px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer" id="content">
        <div style="height: 200px;"></div>
        <div class="outer">

            <div class="iboardImg"></div>
			
            <div id="info">
                <div id="scrap-area">
                    <img src="<%= contextPath%>/resources/image/scrap.png" id="scrap-image">
                </div>
                <div id="userInfo">
                    <span id="userPf-sub">
                        <p>나중에 회원완료되면 name가지고 오기</p> 
                        <button type="button">쪽지보내기</button>
                    </span>
                    <div class="userPf"></div>
                </div>
            </div>

            <div id="iboardContent">
                <h3><%= ib.getTitle() %></h3>
                <p><%= ib.getContent() %></p>
            </div>

            <div class="subImg">
                <div class="sub-iboardImg"></div>
                <div class="sub-iboardImg"></div>
                <div class="sub-iboardImg"></div>
                <div class="sub-iboardImg"></div>
            </div>
            <div align="center">
                <a href="<%= contextPath %>/iboard.ib?cpage=1" style="margin : auto;">목록으로</a>
            </div>
        </div>
    </div>
    <script>
   		 // iboardImg에 사진 삽입
    	$(function(){
          $('.iboardImg').css({
        	  'background-image'  : 'url("<%=at.getSavePath() %>/<%= at.getModifiedName() %>")',
        	  'background-size' : 'contain'
        	  });
          
          // 변수로 스타일을 빼 true값을 만든 후 클릭 기능을 만듬(확대, 취소)
         // console.log($('.iboardImg').css({'background-size' : 'cover'})[0].style.('background-size','cover')); 
          const background = $('.iboardImg').css({'background-size' : 'cover'})[0].style[1];
        	  $('.iboardImg').click(function(){
        		$(this).css()
        	  }) ;
    	});
    	
    	
           // $('.userPf').css('background-image') 나중에 스크랩 수 만큼 사용자 레벨에따라 사진이 달라짐
  
           
			const N = '<%=contextPath%>/resources/image/scrap.png';
			const Y = '<%=contextPath%>/resources/image/scrapted.png';
			
            $(function(){
            	// console.log($('#scrap-image')[0].scr);
            	
            	$('#scrap-image').click(function(){
            	
            		// console.log('핳하하ㅏ하핳');
            		// console.log(N);
            		// console.log($('#scrap-image'));
            		// console.log($('#scrap-image')[0]);
            		// console.log($('#scrap-image')[0].src);
            		// console.log($('#scrap-image')[0].src == N);
            		// console.log($($('#scrap-image')[0]).attr('src') == '<%= contextPath%>/resources/image/scrap.png');
            		// console.log($($('#scrap-image')[0]).attr('src') == N);
            		
	                if($($('#scrap-image')[0]).attr('src') == N){
	                    $.ajax({
	                    	url : 'scrap.ib',
	                    	data : {
	                    		status : 'N',
	                    		boardNo : 20
	                    	//	memberNo : 나중에 회원 완성되면 가지고 오기
	                    	},
	                    	type : 'post'
	                    });
	                    $(this).attr({'src' : Y});
	                 }
	                else{
	                	$.ajax({
	                		url : 'scrap.ib',
	                		data : {
	                			status : 'Y',
	                			boardNo : 20
		                    	//	memberNo : 나중에 회원 완성되면 가지고 오기
	                		},
	                		type : 'post'
	                	})
	                	$(this).attr({'src' : N});
	                };
            	});
            	
               })
    </script>
	

	<%@ include file="../common/footer.jsp" %>
</body>
</html>