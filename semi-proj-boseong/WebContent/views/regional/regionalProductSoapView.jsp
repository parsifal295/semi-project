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

 #tea{
        text-align: center;
        height: 800px;
        width: 550px;
}

#option1{
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
  
#buy{
			
            font-size: xx-large;
            height: 100px;
    }

#cart{
            
            font-size: xx-large;
            height: 100px;
            
    }    
    
    #menubar {
    height : 200px;
    }
    
    #p-img{
    	padding : 100px 20px;
    }
    
    .parent {
    	border : 1px solid blue;
    }
    .parent>div{
    	float:left;
    	width : 50%;
    }
    .section-table{
    	margin-top : 250px;
    	height : 100%;
    }
    tbody{
    line-height: 100px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<br clear="both">
	<div class="page parent" id="content">
		<div id="p-img" class="section-p"align="center">
             <img id="tea" src="https://boseongmall.co.kr/web/product/big/202212/4c77008f9b37dbe43ad6e5fbfe69552c.jpg">
		</div>
		<div class="section-table">
		<table>
		<tr>
             	<tr><td id="option1" width="200">원산지</td><td>국내</td></tr>
                <tr><td id="option2">소비자가</td><td>7000원</td></tr>
                <tr><td id="option3">판매가</td><td>7000원</td></tr>
                <tr><td id="option4">배송방법</td><td>배송</td></tr>
                <tr><td id="option5">배송비</td><td>무료</td></tr>
		</table>
		<form>
            	<input type="button" id="cart" value="장바구니" style="float:right;">
            	<input type="button" onclick="location.href='views/regional/regionalProductOrderView.jsp'" id="buy" value="바로구매" style="float:right;">
           </form>
		
		</div>
		<br clear="both">
	</div>

</body>
</html>