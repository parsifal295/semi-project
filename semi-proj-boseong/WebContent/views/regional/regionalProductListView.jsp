<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <title>특산품 쇼핑</title>
    <style>
        div{
            border : 1px solid red;
            box-sizing: border-box;
            text-align: center;
        }

        #wrap{
            width: 1000px;
            height: 800px;
            text-align: center;
            
        }
        /* 크게 세가지 영역 */
        /* header, content, footer */
        #wrap > div{
            width: 100%;
            text-align: center;
        }

        #header, #footer{
            height: 20%;
            text-align: center;
        }

        #content{
            width: 100%;
           
            text-align: center;
            
        }

        #tea{
            margin: auto;
            padding: 10px 10px 20px 10px;
            text-align: center;
            height: 45%;
            width: 30%;
            
        }

        #tea2{

            margin: auto;
            padding: 10px 10px 20px 10px;
            text-align: center;
            height: 45%;
            width: 30%;
            
        }

        #soap{

            margin: auto;
            padding: 10px 10px 20px 10px;
            text-align: center;
            height: 45%;
            width: 30%;
            
        }

        #notice{
            margin: auto;
            text-align: right;
        }

        #review{
            margin: auto;
            text-align: right;
        }
        
        .page{
        	padding : 0;
        	margin : 0;
        	width : 100%;
        	height : 100vh;
        	color : black;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="header"></div>
        
        <div id="content"></div>
        <img src="https://boseongmall.co.kr/web/product/big/202203/7ff954440e14e7773f1a2b8dc2458c24.jpg" width="300" height="300" id="tea">
        <img src="https://boseongmall.co.kr/web/product/big/202206/aee1f475b681d59881dbc1546f92b33d.jpg" width="300" height="300" id="tea2">
        <img src="https://boseongmall.co.kr/web/product/big/202212/4c77008f9b37dbe43ad6e5fbfe69552c.jpg" width="300" height="300" id="soap">
        <div id="footer"></div>
        <h2 id="notice">공지사항</h2>
        <h2 id="review">구매후기</h2>
    </div>
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>