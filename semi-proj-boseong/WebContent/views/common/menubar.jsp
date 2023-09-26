<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
        /* ����) ���� �� ���� */
        /* background-image: url("resources/image/semi-boseong/��������.jpg");*/
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
        /* �� ��ũ���� �ص� ���� �������� ȿ�� */
        position : fixed;
        top : 0;
    }
    #content{
        width : 1302px;
        height: 100%;
        margin : auto;
    }
    #login-form{
        font-size: 16px;
        width: 100%;
        text-align: right;
        float : right;
    }
    /* ---------------- navigator ���� �κ� ---------------- */ 
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
    /* ---------------- navigator ���� �κ� end ---------------- */ 
    #userBox{
        width:60px;
        height : 60px;
        position : fixed;
        bottom : 0;
    }
</style>
</head>
<body>
    <!-- ȸ���϶� �������� ȸ������ div -->
    <div id="userBox">
        <p style="font-size: 13px;">ȸ�� ����</p>
    </div>
    <div id="header">
        <!-- ȸ���� �ƴҶ� �������� �±� -->
        <div id="login-form"> 
            <a href="#">�α���</a> | <a href="#">ȸ������</a>
        </div>

        <!-- navigator���� start -->
        <ul id="navi">
            <li>
                <a href="">Ŀ�´�Ƽ</a>
                <ul>
                    <li><a href="#">�����Խ���</a></li>
                    <li><a href="#">������ ��</a></li>
                    <li><a href="#">���� ����</a></li>
                </ul>
            </li>
            <li>
                <a href="#">������</a>
            </li>
            <li>
                <a href="">����</a>
                <ul>
                        <li><a href="#">�¸���</a></li>
                        <li><a href="#">�ָ�����</a></li>
                        <li><a href="#">�ѿ�</a></li>
                        <li><a href="#">�Ѵ޻��</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">Ư��ǰ</a>
                    <ul>
                        <li><a href="#">������</a></li>
                    <li><a href="#">����</a></li>
                </ul>
            </li>
            <li>
                <a href="">�����Ұ�</a>
                <ul>
                    <li><a href="#">����ȳ�</a></li>
                    <li><a href="#">�����ڽ�</a></li>
                    <li><a href="#">����</a></li>
                    <li><a href="#">���ô±�</a></li>
                </ul>
            </li>
        </ul>
        <!-- navi ���� end -->
    </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>