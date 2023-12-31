<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String food = (String)request.getAttribute("food"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=food %></title>

    <style>
        @font-face {
        font-family: 'Hangeuljaemin4-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    	}
        * {
	    font-family: 'Hangeuljaemin4-Regular';
        }
        table{
            width: 100%;
            font-size: 20px;
        }
        h4, h6{
            margin: 0%;
        }
        #restaurant-pictures{
            width: 100%;
            height: 350px;
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
            padding-top: 30px;
        }
        #location{
            width: 40%;
            height: 100%;
            float: left;
        }
        button{
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
            width: 500px;
            height: 300px;
        }
        th, td{
            text-align: left;
            padding-left: 10px;
        }


    </style>
</head>
<body>

<%@ include file = "../common/menubar.jsp" %>
	    <div id="box">
    	
    	</div>
    <div  class="page" id="content">
        <!--겉 껍질-->
        <div id="food-list"></div>
            
                <h1 align="left"><%=food %></h1>
                <div>
                    <table>
						  <%if(food.equals("보성 녹차 떡갈비")){ %>
						  <tr><td>
						  전라남도 보성군 보성읍 흥성로 2541-4
						  </td></tr>
                          <tr><td>
                          061-853-0300
                          </td></tr>
                          <tr><td>
                          <h4>한식</h4>
                          </td></tr>
						  <%}else if(food.equals("청광도예원")) {%>
						  <tr><td>
						  전라남도 보성군 보성읍 봉산리 1154-1
						  </td></tr>
                          <tr><td>
                          061-853-4125
                          </td></tr>
                          <tr><td>
                          <h4>한식</h4>
                          </td></tr>
						  <%}else{ %>
						 <tr><td>
						  전라남도 보성군 보성읍 보성리 767-7
						  </td></tr>
                          <tr><td>
                          061-853-3032
                          </td></tr>
                          <tr><td>
                          <h4>한식</h4>
                          </td></tr>
						  <%} %>


                    </table>
                </div>

                <div id="restaurant-pictures">

                </div>
                <div class = "restaurant-detail">
                    <div id="description">
                        <table>
                            <tr>
                            <td colspan="2">
                                <p>
                                20년 넘은 전통을 자랑하는 떡갈비 전문점으로 한우로 만든 떡갈비와 <br>
                                보성이 자랑하는 녹차를 먹인 돼지를 재료로 하여 만든 떡갈비 두 종류가 있습니다.<br>
                                겨울철 별미로 TV맛집 프로에서 소개도 된 집으로 녹차가 떡갈비 안에 들어있는 녹차먹인 돼지떡갈비가 인기 메뉴입니다.
                                </p>
                                
                            </td></tr>
                            <tr>
                                <th>영업시간</th>
                                <td>주중 10:30 ~ 22:30</td></tr>
                            <tr>
                                <th>추천 메뉴</th>
                                <td>녹차먹인 돼지 떡갈비, <br>소떡갈비
                                </td>
                            </tr>
                            <tr>
                                <th>인당 평균 가격대</th>
                                <td>12000원</td>
                            </tr>
                        </table>
                    </div>

                    <div id="location">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25393.822063311898!2d126.9667784425303!3d37.2897355642192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b42d198c1bcaf%3A0x121089b6ff26f8ca!2z67O07ISx64W57LCo65ah6rCI67mE!5e0!3m2!1sko!2skr!4v1695706091297!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <button>리뷰 확인하기</button>                
        
            

        </div>
    </div>
 <%@ include file = "../common/footer.jsp" %>   
</body>
</html>