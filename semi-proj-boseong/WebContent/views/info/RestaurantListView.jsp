<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>������ ��</title>

    <style>
            @font-face {
        font-family: 'Hangeuljaemin4-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
        *{
            font-family: 'Hangeuljaemin4-Regular';

        }
        .outer{
        width : 1000px;
        height: 650px;
        margin: auto;
        border: 1px solid brown;
        }
        #left, #center, #right {
            float: left;
            box-sizing: border-box;
        }

        #left, #right{
            width: 10%;
            height: 100%;
        }
        #center{
            width: 80%;
            height: 100%;
        }
        #center table{
            width: 100%;
        }
        #center img{
            width: 300px;
            height: 180px;
            margin: auto;
        }
        h2{
            margin: 8px;
        }
    </style>
</head>
<body>
    <div class="outer">
        <!--�� ����-->
        <div id="food-list"></div>
            <div id="left"></div>
            <div id="center">
                <h2 align="left">������ ��</h2>
                <div>
                    <table>
                        <tr><td rowspan="5" width="40%" align="center"><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13279199&filePath=L2Rpc2sxL25ld2RhdGEvMjAyMC8yMS9DTFMxMDAwNi8xMzI3OTE5OV9XUlRfMjFfQ0xTMTAwMDZfMjAyMDEyMThfMQ==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt=""></td></tr>
                        <tr><td><h2>���� ���� ������</h2></td></tr>
                        <tr><td>���󳲵� ������ ������ �Ｚ�� 2541-4</td></tr>
                        <tr><td>061-853-0300</td></tr>
                        <tr><td>�ѽ�</td></tr>

                        <tr><td rowspan="5" width="40%" align="center"><img src="https://img.siksinhot.com/place/1499990936640921.jpg" alt=""></td></tr>
                        <tr><td><h2>û��������</h2></td></tr>
                        <tr><td>���󳲵� ������ ������ ���긮 1154-1</td></tr>
                        <tr><td>061-853-4125</td></tr>
                        <tr><td>�ѽ�</td></tr>

                        <tr><td rowspan="5" width="40%" align="center"><img src="https://mblogthumb-phinf.pstatic.net/MjAxODA5MTlfMTk1/MDAxNTM3MzUwMTM5MTEw.tJaRieIWXcRgxxggg6mVDl_voaT2d9jFVGc6bdEgSW0g.Jqq9yzGj63u7ZaprudAO06i8XknKWZN6tgyJump9PN8g.JPEG.boseonglove/IMG_0103.jpg?type=w800" alt=""></td></tr>
                        <tr><td><h2>�����Ĵ�</h2></td></tr>
                        <tr><td>���󳲵� ������ ������ ������ 767-7</td></tr>
                        <tr><td>061-853-3032</td></tr>
                        <tr><td>�ѽ�</td></tr>

                    </table>
                </div>
                
            </div>
            <div id="right"></div>

        </div>
    </div>
    
</body>
</html>