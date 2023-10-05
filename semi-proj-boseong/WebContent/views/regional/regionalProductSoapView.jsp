<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산품 소개</title>
<style>
.page{
		padding: 0;
		margin: 0;
		width: 100%;
		height: 1ppvh;
		color: black;
}

#content{
		
		width: 1302px;
		height: 100%;
		margin: auto;
}

 #soap{
      	padding: 400px 100px 50px 50px;
        text-align: center;
        height: 1000px;
        width: 600px;
}

#option1{
         
         height: 500px;
         line-height: 100px;

    }   

#option2{
        
        margin-bottom: 100px;
        line-height: 10px;

    }   

#option3{
        
        line-height: 10px;

    }

#option4{
        
        line-height: 10px;

    }

#option5{
        
        line-height: 10px;

    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="page" id="content">
		<div class="page">
		<table>
		<tr>
			<td rowspan="10" width="100px" align="center">
             <img id="soap" src="https://boseongmall.co.kr/web/product/big/202212/4c77008f9b37dbe43ad6e5fbfe69552c.jpg"></td></tr>
             	<tr><td id="option1" width="200">원산지</td><td>국내</td></tr>
                <tr><td id="option2">소비자가</td><td><td><td><td><td><td><td><td><td><td><td></td></td></td></td></td></td></td></td></td></td></td><td>7000원</td></tr>
                <tr><td id="option3">판매가</td><td><td><td><td><td><td><td><td><td><td><td></td></td></td></td></td></td></td></td></td></td></td><td>7000원</td></tr>
                <tr><td id="option4">배송방법</td><td><td><td><td><td><td><td><td><td></td></td></td></td></td></td><td><td></td></td></td></td></td><td>배송</td></tr>
                <tr><td id="option5">배송비</td><td><td><td><td><td><td><td><td><td></td></td></td></td></td></td><td><td></td></td></td></td></td><td>무료</td></tr>
		</table>
		
		</div>
	</div>

</body>
</html>