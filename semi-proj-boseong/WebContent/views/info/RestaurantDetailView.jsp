<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
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
        div{
            font-family: 'Hangeuljaemin4-Regular';
            box-sizing: border-box;
        }
        .outer{
        width : 1000px;
        height: 650px;
        margin: auto;
        border: 1px solid brown;
        }
        #left, #center, #right {
            float: left;
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
        h4, h6{
            margin: 0%;
        }
        #restaurant-pictures{
            width: 100%;
            height: 35%;
            padding: 2px;
        }
        .restaurant-detail{
            width: 100%;
            height: 35%;
        }
        #description{
            width: 60%;
            height: 100%;
            float: left;
        }
        #location{
            width: 40%;
            height: 100%;
            float: left;
        }
        #center button{
            width: 100%;
            margin: auto;
            height: 5%;
            background-color: darkolivegreen;
            border: none;
            color: floralwhite;
            font-weight: 600;
            border-radius: 5px;
            margin-top: 10px;
        }
        #location>iframe{
            width: 320px;
            height: 220px;
        }
        table th, table td{
            text-align: left;
            padding-left: 10px;
        }

    </style>
</head>
<body>
    <div class="outer">
        <!--�� ����-->
        <div id="food-list"></div>
            <div id="left"></div>
            <div id="center">
                <h1 align="left">���� ���� ������</h1>
                <div>
                    <table>
<!--                      <tr><td rowspan="4" width="40%" align="center"><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13279199&filePath=L2Rpc2sxL25ld2RhdGEvMjAyMC8yMS9DTFMxMDAwNi8xMzI3OTE5OV9XUlRfMjFfQ0xTMTAwMDZfMjAyMDEyMThfMQ==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt=""></td></tr>
 -->                      <tr><td>���󳲵� ������ ������ �Ｚ�� 2541-4</td></tr>
                          <tr><td>061-853-0300</td></tr>
                          <tr><td><h4>�ѽ�</h4></td></tr>

                    </table>
                </div>

                <div id="restaurant-pictures">

                </div>
                <div class = "restaurant-detail">
                    <div id="description">
                        <table>
                            <tr><td colspan="2">
                                <p>
                                    20�� ���� ������ �ڶ��ϴ� ������ ���������� <br>
                                    �ѿ�� ���� ������� ������ �ڶ��ϴ� ������ ���� ������ ���� �Ͽ� ���� ������� �� ������ �ֽ��ϴ�.<br>
                                    �ܿ�ö ���̷� TV���� ���ο��� �Ұ��� �� ������ ������ ������ �ȿ� ����ִ� �������� ���������� �α� �޴��Դϴ�.
                                </p>
                                
                            </td></tr>
                            <tr>
                                <th>�����ð�</th>
                                <td>���� 10:30 ~ 22:30</td></tr>
                            <tr>
                                <th>��õ �޴�</th>
                                <td>�������� ���� ������ 
                                    <br>�Ҷ�����
                                </td>
                            </tr>
                            <tr>
                                <th>�δ� ��� ���ݴ�</th>
                                <td>12000��</td>
                            </tr>
                        </table>
                    </div>

                    <div id="location">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25393.822063311898!2d126.9667784425303!3d37.2897355642192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b42d198c1bcaf%3A0x121089b6ff26f8ca!2z67O07ISx64W57LCo65ah6rCI67mE!5e0!3m2!1sko!2skr!4v1695706091297!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <button>���� Ȯ���ϱ�</button>                
            </div>
            <div id="right"></div>

        </div>
    </div>
    
</body>
</html>