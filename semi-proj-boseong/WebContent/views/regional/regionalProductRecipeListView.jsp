<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kirang+Haerang&family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
    .font-family{
        font-family: 'Kirang Haerang', cursive;
        font-family: 'Nanum Gothic', sans-serif;
    }
    body{
        margin : 0;
        padding : 0;
        font-size: 30px;
        color : black;
    }
    div{
        box-sizing: border-box;
        border : 1px solid red;
    }
    #wrap {
        width: 100%;
        height: 100vh;
        background-size:cover;
        /* 예시) 사진 → 영상 */
        /* background-image: url("resources/image/semi-boseong/보성사진.jpg");*/
    }
    .page {
        padding : 0;
        margin : 0;
        width: 100%;
        height: 100vh;
        color: black;
    }
    #header{
        margin : 0;
        padding : 0;
        width: 100%;
        height: 200px;
        /* ↓ 스크롤을 해도 같이 내려오는 효과 */
        position : fixed;
        top : 0;
    }
    #content{
        width : 1302px;
        height: 100%;
        margin : auto;
        line-height: 0.5px;
    }
    #login-form{
        font-size: 16px;
        width: 100%;
        text-align: right;
        float : right;
    }
    /* ---------------- navigator 영역 부분 ---------------- */ 
    #navi{
        width: 50%;
        padding : 0;
        padding-top: 110px;
        padding-right: 100px;
        margin : 0;
        list-style : none;
        text-decoration : none;
        font-size : 22px;
        text-align: right;
        float:right;
        display: block;
    }
    #navi > li{
        float : right;
        height: 100%;
        width: 15%;
        text-align: center;
    }
    #navi a{
        text-decoration : none;
        width : 100%;
        height : 100%;
        display: block;
        line-height: 30px;
    }
    #navi a:hover{
        color : orangered
    }
    #navi > li > ul{
        background-color: rgba(0, 128, 0, 0.457);
        list-style : none;
        padding:0;
        display : none; 
    }
    #navi > li > a:hover + ul{
        display : block; 
    }
    #navi > li > ul:hover {
        display : block; 
    }
    #navi > li > ul a{font-size : 17px;}
    #navi > li > ul a:hover{font-size : 20px;}
    /* ---------------- navigator 영역 부분 end ---------------- */ 
    #userBox{
        width:60px;
        height : 60px;
        position : fixed;
        bottom : 0;
    }

    #jam{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 400px;
            width: 300px;
            
        }

    #cookie{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 400px;
            width: 300px;
            
        }
    
    #soup{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 400px;
            width: 300px;
            
        }
    
     

    #box {
	height: 200px;
    
    }
    
    #pic1{
            padding: 20px 0.1px;
            text-align: center;
    }

    #pic2{
            
            text-align: center;
            width: 410px;
    }

    #pic3{
            width: 210px;
    }

</style>
</head>
<body>

	<div id="box"></div>
    <!-- 회원일때 보여지는 회원정보 div -->
    <div id="userBox">
        <p style="font-size: 13px;">회원 정보</p>
    </div>
    <div id="header">
        <!-- 회원이 아닐때 보여지는 태그 -->
        <div id="login-form"> 
            <a href="#">로그인</a> | <a href="#">회원가입</a>
        </div>

        <!-- navigator영역 start -->
        <ul id="navi">
            <li>
                <a href="">커뮤니티</a>
                <ul>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">도움의 손</a></li>
                    <li><a href="#">보성 마켓</a></li>
                </ul>
            </li>
            <li>
                <a href="#">갤러리</a>
            </li>
            <li>
                <a href="">예약</a>
                <ul>
                        <li><a href="#">승마장</a></li>
                        <li><a href="#">주말농장</a></li>
                        <li><a href="#">한옥</a></li>
                        <li><a href="#">한달살기</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">특산품</a>
                    <ul>
                        <li><a href="#">레시피</a></li>
                    <li><a href="#">구매</a></li>
                </ul>
            </li>
            <li>
                <a href="">보성소개</a>
                <ul>
                    <li><a href="#">교통안내</a></li>
                    <li><a href="#">관광코스</a></li>
                    <li><a href="#">맛집</a></li>
                    <li><a href="#">오시는길</a></li>
                </ul>
            </li>
        </ul>
        <!-- navi 영역 end -->
    </div>

    <div class="page" id="content">
        <div class="page" id="recipe">
            <table>

            <td rowspan="10" width="100px" align="center"></td>
                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2016/06/05/dbaea0e7d63620706871aaaef7f18b2c1.jpg" id="jam">
                <th id="pic1">녹차 스프레드</th>
            <td rowspan="10" width="100px" align="center"></td>        
                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/12/01/14075610194c7d61815497474494ff4b1.jpg" id="cookie">
                <th id="pic2">녹차 쿠키</th>
            <td rowspan="10" width="100px" align="center"></td>    
                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2020/11/03/a98c68c45690fab5d25fa4366eec52dc1.jpg" id="soup">
                <th id="pic3">녹차 수제비</th>

            </table>
        </div>
    </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>