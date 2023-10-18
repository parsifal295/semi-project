<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.boseong.jsp.gallery.model.vo.Gallery" %>
<%
	ArrayList<Gallery> list = (ArrayList<Gallery>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<style>
	/*--------------------------gallery part----------------------------*/
	#ig-logo{
	    background-position: center;
	    background-size: cover;
	    width: 100px;
	    height: 100px;
	    margin: auto;
	}
	div{
		border : 1px solid black;
	}
	.list-area{
 		width : 60%;
 		height : 100%;
 		margin : auto;
        text-align: center;
        border-radius: 10px;
    }
    .gallery-area{
        border-radius: 10px;
        width: 300px;
        display: inline-block;
        margin: 10px;
    }
    .thumbnail>img{
        width: 250px;
        height: 250px;
        padding: 10px;
    }
    .thumbnail:hover{
        cursor: pointer;
        opacity: 0.8;
    }
    #image{
    	width : 300px;
    	height : 300px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!---------------------인스타그램 갤러리 페이지---------------->
    <div style="height: 200px;"></div>
    <div id="iglogo-area">
		<img src="<%= contextPath %>/resources/image/ig-logo.png"  id="ig-logo">
    </div>
       <div id="content">
		<% if(loginUser != null && loginUser.getMemNo() == 1) { %>
			<div style="width : 870;" align="right">
				<a href="<%=contextPath%>/enrollForm.gy" class="btn btn-outline-success">글작성</a>
			</div>
		<%}%>
		<% if(list.isEmpty()){ %>
			<div class="list-area">
				<!-- 등록된 사진이 없을 경우 -->
				<p align="center">등록된 사진이 없습니다</p>
			 <%}else{ %>
				<% for(Gallery g : list){ %>
				<!-- 등록된 사진이 있을 경우 -->
				<div class="gallery-area" align="center"  id="imageTag">
					<img src="<%= g.getSavePath() %>/<%= g.getModifiedName() %>" id="image">
				</div>
			   <script>
				$(function(){
					$('#tag').hide();
					
					$('#image').click(function(){
						location.href = <%= g.getLink() %>;
					})
				});
			   </script>
				<%} %>
			<%}%> 
	       </div>
       </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>