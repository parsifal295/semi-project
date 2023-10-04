<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성 한옥스테이</title>

<style>
    #main-pic{
        width: 100%;
        height: 70%;
        box-sizing: border-box;
        background: url("<%=request.getContextPath() %>/resources/image/reservation/building1.jpeg");
        background-size:cover;
    }
    #main-pic>button{
    	width:600px;
    	height:100px;
    	margin-top : 250px;
    	margin-left : 350px;
    	border:none;
    	border-radius:20px;
        background-color: steelgray;
    }
    #rooms{
        width: 100%;
        height:30%;
        box-sizing: border-box;
    }
    .room{
	float:left;
    width: 420px;
    height: 260px;
    box-sizing: border-box;
    margin: 6px;    
    }
    .room>img{
        width: 100%;
        height:100%;
    }
    .room>h1{
        color: white;
        text-shadow: 1px 2px 2px gray;
        position: relative;
        top: -150px;
        left:150px;
    }
</style>

</head>
<body>
<%@include file="../common/menubar.jsp"%>
    <div class="page" id="content">
        <div id="box">

        </div>
        <div class="page">
            <div id="main-pic">
                <button><h1>예약 하기</h1></button>
            </div>
            <div id="rooms">
                <div class="room">
                    <img src="<%=contextPath %>/resources/image/reservation/room1.avif" alt="">
                    <h1>room1</h1>
                </div>
                <div class="room">
                    <img src="<%=contextPath %>/resources/image/reservation/room2.avif" alt="">
                    <h1>room2</h1>
                </div>
                <div class="room">
                    <img src="<%=contextPath %>/resources/image/reservation/room4.jpeg" alt="">
                    <h1>room3</h1>
                </div>
            </div>

        </div>
    </div>
<%@include file = "../common/footer.jsp" %>
<script>
    let rooms = document.getElementsByClassName("room");
    for(i=0; i<rooms.length;i++){
        rooms[i].onclick= function(){
            location.href="<%=contextPath%>/roomdetail.rsv?roomNo="+i;
            return;
        }
    }

</script>


</body>
</html>