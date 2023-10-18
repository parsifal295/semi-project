<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.boseong.jsp.itemboard.model.vo.ItemBoard, 
			     com.boseong.jsp.Attachment.model.vo.Attachment,
			     com.boseong.jsp.scrap.model.vo.Scrap" %>
<%@ page import="java.util.ArrayList" %>
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
        margin : auto;
    }
    .sizeUp{
    	width : 100%;
    	height : 100%;
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
        width: 50%;
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
        height: 100%;
    }
    .outer div{
    	 border : 1px solid black;
    }
    #userBtn{
    	width : 40px;
    	height : 20px;
    	float : right;
    }
	#img-area{
		width: 230px;
		height : 70%;
		margin: 20px;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

        <div style="height: 200px;"></div>
    <div class="outer" id="content">
        <div class="outer">
            <div class="iboardImg"></div>
            <div id="info">
            <% if(loginUser != null) { %>

							<div id="scrap-area">
							
							<img src="<%= contextPath%>/resources/image/scrap.png" id="scrap-image" value="">
							</div>
            <% } %>
            <div id="userInfo">
	            <% if(loginUser != null && loginUser.getMemNo() == ib.getMemberNo() ) {%>
	            <div id="userBtn"><a href="<%= contextPath %>/delete.ib?bno=<%= ib.getBoardNo() %>" onclick="deletealert();">삭제</a></div>
	            <script>
	            function deletealert(){
	            	confirm('삭제하시겠습니까?');
	            }
	            </script>
	            <div id="userBtn"><a href="<%= contextPath %>/update.ib?bno=<%= ib.getBoardNo() %>">수정</a></div>
	            <%} %>
                <span id="userPf-sub">
                <p><%= ib.getMemberName() %></p>
                <% if(loginUser != null){ %>
                <button type="button">쪽지보내기</button>
                <%} %>
                </span>
                <div class="userPf"></div>
                </div>
            </div>

            <div id="iboardContent">
                <h3><%= ib.getTitle() %></h3>
                <p><%= ib.getContent() %></p>
            </div>
			<h4>인기순위</h4>
            <div class="subImg">
                <div class="sub-iboardImg">
					<div id="img-area">
						<!-- 여기에 스크랩 많은 순위 select후 나열 -->
					</div>
					<div id="img-content-area">
						<span>
							<h5>제목들어감</h5>
							<p>판매자 이름</p>
						</span>
					</div>
				</div>
                <div class="sub-iboardImg">
					<div id="img-area">
						<!-- 여기에 스크랩 많은 순위 select후 나열 -->
					</div>
					<div id="img-content-area">
						<span>
							<h5>제목들어감</h5>
							<p>판매자 이름</p>
						</span>
					</div>
				</div>
				<div class="sub-iboardImg">
					<div id="img-area">
						<!-- 여기에 스크랩 많은 순위 select후 나열 -->
					</div>
					<div id="img-content-area">
						<span>
							<h5>제목들어감</h5>
							<p>판매자 이름</p>
						</span>
					</div>
				</div>
				<div class="sub-iboardImg">
					<div id="img-area">
						<!-- 여기에 스크랩 많은 순위 select후 나열 -->
					</div>
					<div id="img-content-area">
						<span>
							<h5>제목들어감</h5>
							<p>판매자 이름</p>
						</span>
					</div>
				</div>
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
        	  'background-image'  : 'url("<%=at.getSavePath()%>/<%= at.getModifiedName() %>")',
        	  'background-repeat' : 'no-repeat',
        	  'background-position' : 'center',
        	  'background-size' : 'contain'
        	  });
          $('.iboardImg').click(function(){
        	 // console.log($('.iboardImg')[0].style.height == "730px");
        	 // console.log($('.iboardImg')[0].style[7] == $('.iboardImg')[0].style[7]);
        	  if($('.iboardImg')[0].style.height == "500px"){
	        	$('.iboardImg').css({
	        		'width' : '100%',
	        		'height' : '730px'
	        	})
        	  }
        	  else{
       			$('.iboardImg').css({
   	        		'width' : '100%',
   	        		'height' : '500px'
   	        	})
        	  }
          })
    	});
			// $('.userPf').css('background-image') 나중에 스크랩 수 만큼 사용자 레벨에따라 사진이 달라짐
			
	
			// 게시글 조회시 DB조회하여 스크랩 여부 리턴해주는 Ajax script
			$(() => {
				let on = '<%= contextPath%>/resources/image/scrap.png';
				let off = '<%= contextPath%>/resources/image/scrapted.png';
				$.ajax({
					url : 'scrapselect.ib',
					type : 'post',
					data : {
						boardNo : '<%= ib.getBoardNo() %>',
						memberNo : '<%= loginUser.getMemNo() %>',
					},
					success : function(r) {
						if (r == 'Y') {
							$('#scrap-image').attr('src', off);
						} else {
							$('#scrap-image').attr('src', on);
						}
					}
				})
			})
			$('#scrap-image').click(function(){
				let on = '<%= contextPath%>/resources/image/scrap.png';
				let off = '<%= contextPath%>/resources/image/scrapted.png';
				if ($('#scrap-image').attr('src') == on) {
						$('#scrap-image').attr('src', off);
					} else {
						$('#scrap-image').attr('src', on);
					}
				$.ajax({
					url : 'scrap.ib',
					type : 'POST',
					data : {
						status : $('#scrap-image').attr('value'),
						boardNo : '<%= ib.getBoardNo() %>',
						memberNo : '<%= loginUser.getMemNo() %>'
					},
					success : function(){ // e가 반환값임 
						if ($('#scrap-image').attr('src') == on) {
							$('#scrap-image').attr('value', 'Y')
						} else if ($('#scrap-image').attr('src') == off) {
							$('#scrap-image').attr('value', 'N')
						}
						console.log($('#scrap-image').attr('value'));
						},
					error : function() {
						console.log('error')
					}
						
					})
				})
		
    </script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>