<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
<style>
    .table-style{
        width: 100%;
    }
</style>
<!-- iboardEnrollView는 script가 없음 -->
</head>
<body>
    <!--중고거래리스트 조회(R)-썸네일, 사진상세조회(R), 
        중고거래게시글작성(C)-다중파일업로드(최대4개) , 
        중고거래게시글수정(U),중고거래게시글삭제,활성,거래완료(*상태값)(U)  
    
    
        중고거래 게시판 작성시 : 중고거래 게시글 번호(NUMBER), 작성하는 회원 번호, 게시글 제목,내용,작성일,수정일,조회수,상태값
        중고거래 (구매 임시) 회원 : 스크랩_YN ,회원 번호, 중고거래 게시글 번호, 스크랩 날짜 
        중고거래 구매자 회원 : 후기게시글 번호, 회원번호, 구매한중고거래 게시글 번호, 후기 내용, 별점-->
        
        <%@ include file="../common/menubar.jsp" %>
       <form action="<%= contextPath %>/insert.ib" method="post" enctype="multipart/form-data">
           <input type="hidden" name="memberNo" value="<%= loginUser.getMemNo() %>">  
                <div class="page" id="content">
                <div style="height : 300px; text-align: center;"></div>
                <div class="page" style="height : 700px;">
                    <table align="center" class="table-style">
                        <tr><h1 style="text-align:center; ">보성마켓 게시글 작성</h1></tr>
                        <tr>
                            <th style="text-align: center;">제목</th>
                            <td><input type="text" name="title" style="width:50%;" placeholder="제목을 입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">희망가격</th>
                            <td><input type="text" style="width:50%;" name="price" placeholder="희망 가격을 (숫자로만)입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">내용</th>
                            <td><textarea name="content" style="resize: none; width : 100%; height: 500px;" cols="30" rows="10" placeholder="거래 내용을 입력해주세요" required></textarea></td>
                        </tr>
                        <tr>
                            <th style="text-align: center;">첨부파일</th>
                            <td colspan="3">
                                <input type="file" name="upfile" id="itemImg" required>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                    <button type="submit">등록</button>
                    <button type="reset">초기화</button>
                    <a type="submit" href="<%= contextPath %>/iboard.ib?cpage=1">목록으로</a>
                    </div>
                </div>
            </div>
        </form>
        <%@ include file="../common/footer.jsp" %>
</body>
</html>