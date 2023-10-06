<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성마켓</title>
<style>
    .iboardImg{
        width: 100%;
        height : 500px;
        border-radius: 10%;
    }
    #iboardContent{
        width : 90%;
        height: 400px;
        margin : auto;
        margin-top : 20px;
    }
    #info{
        width : 90%;
        height: 100px;
        margin : auto;
        margin-top : 20px;

    }
    #userInfo{
        width : 400px;
        height: 100%;
    }
    .userPf{
        width: 90px;
        height: 90px;
        margin : 8px;
    }
    #userPf-sub{
        width: 70%;
        height: 90px;
        float: right;
        margin-top : 10px;
    }
    #scrap-area{
        width: 200px;
        height :100px;
        float: right;
    }
    #scrap{
        width: 40px;
        height: 40px;
        float : right;
        margin-top: 10px;
        margin-right: 10px;
    }
    .subImg{
        display: flex;
        justify-content: center;
    }
    .sub-iboardImg{
        width:270px ;
        height: 350px;
        float: left;
        box-sizing: border-box;
        margin : 25px;
    }
    .outer{
        margin: auto;
        width: 100%;
        height: 1500px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer" id="content">
        <div style="height: 200px;"></div>
        <div class="outer">

            <div class="iboardImg"></div>

            <div id="info">
                <div id="scrap-area">
                    <div id="scrap"></div>
                </div>
                <div id="userInfo">
                    <span id="userPf-sub">
                        <p>사용자 이름(나중에 가지고 오기)</p>
                        <button type="button">쪽지보내기</button>
                    </span>
                    <div class="userPf"></div>
                </div>
            </div>

            <div id="iboardContent">
                <h3>호미 팔아요(완전한 새제품)</h3>
                <p>
		                    한번도 사용안한 제품입니다 <br>
		                    고구마를 캐야해서 집에 호미를 찾아봤는디 없어서 <br>
		                    쿠팡인가 거기 어딘가에서 구매를 했는디 <br>
		                    어마마ㅏ마마ㅏ!!!! 아니 바둑이 집에서 내가 오랫동안 <br>
		                    정들어 사용했던 호미가 있는거여!!! <br>
		                    그래서 팝니다 보기만 해두 알것지만 <br>
		                    완전 새거유~~~~~~ <br>
                </p>
            </div>

            <div class="subImg">
                <div class="sub-iboardImg"></div>
                <div class="sub-iboardImg"></div>
                <div class="sub-iboardImg"></div>
                <div class="sub-iboardImg"></div>
            </div>
            <div align="center">
                <a href="<%= contextPath %>/iboard.ib?cpage=1" style="margin : auto;">목록으로</a>
            </div>
        </div>
    </div>
    <script>
        $(function(){
          //  $('.iboardImg').css('background-image' 'url('<%= contextPath %>')') background-image에 들어가야 하는 건 사용자가 업로드한 사진
        });

        $(()=>{
           // $('.userPf').css('background-image') 나중에 스크랩 수 만큼 사용자 레벨에따라 사진이 달라짐
        });

        $(function(){
            $('#scrap').css('background-image','url(<%=contextPath%>/resources/image/scrap.png)')//.click().css('background-color', 'red');

        })
    </script>
	

	<%@ include file="../common/footer.jsp" %>
</body>
</html>