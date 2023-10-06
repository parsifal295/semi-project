<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산품 소개</title>
<style>


 #tea2{
      	padding: 200px 100px 50px 50px;
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
	<div id="box"></div>
	<div class="page" id="content">
	
		<div class="page">
		<table>
		<tr>
			 <td rowspan="6" width="100px" align="center">
             <img id="tea2" src="https://boseongmall.co.kr/web/product/big/202206/aee1f475b681d59881dbc1546f92b33d.jpg">
             </td>
        </tr>
             	<tr><td id="option1" width="200">원산지</td><td>국내</td></tr>
                <tr><td id="option2" width="200">소비자가</td><td>7000원</td></tr>
                <tr><td id="option3" width="200">판매가</td><td>7000원</td></tr>
                <tr><td id="option4" width="200">배송방법</td><td>배송</td></tr>
                <tr><td id="option5" width="200">배송비</td><td><td>무료</td></tr>
		</table>
		
		</div>
	</div>

</body>
</html>