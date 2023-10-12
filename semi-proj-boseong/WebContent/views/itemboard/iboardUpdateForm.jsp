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
<title>보성마켓 게시글 수정</title>
<style>
    .table-style{
        width: 100%;
    }
</style>
</head>
<body>

   <%@ include file="../common/menubar.jsp" %>
  <form action="<%= contextPath %>/updateform.ib" method="post" enctype="multipart/form-data">
      <input type="hidden" name="memberNo" value="<%= loginUser.getMemNo() %>">  
           <div class="page" id="content">
           <div style="height : 300px; text-align: center;"></div>
           <div class="page" style="height : 700px;">
               <table align="center" class="table-style">
                   <tr><h1 style="text-align:center; ">보성마켓 게시글 수정</h1></tr>
                   <tr>
                       <th style="text-align: center;">제목</th>
                       <td><input type="text" name="title" style="width:50%;" value="<%= ib.getTitle() %>" required></td>
                   </tr>
                   <tr>
                       <th style="text-align: center;">희망가격</th>
                       <td><input type="text" style="width:50%;" name="price" value="<%= ib.getPrice() %>" required></td>
                   </tr>
                   <tr>
                       <th style="text-align: center;">내용</th>
                       <td><textarea name="content" style="resize: none; width : 100%; height: 500px;" cols="30" rows="10"  required><%= ib.getContent() %></textarea></td>
                   </tr>
                   <tr>
                       <th style="text-align: center;" id="check">첨부파일</th>
                       <td colspan="3">
                           <input type="file" name="reUpfile" id="itemImg" required>
                       </td>
                   </tr>
               </table>
               <div align="center"><button type="submit">수정완료</button><button type="reset">초기화</button></div>
           </div>
       </div>
       <script>
       $(function(){
    	   $('#check').click(function(){
    		   console.log($($('#itemImg')[0]).src());
    	   })
			    	   
       })
       </script>
   </form>
   <%@ include file="../common/footer.jsp" %>

</body>
</html>