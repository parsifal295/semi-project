<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 소개</title>
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
        height: 600px;
        width: 550px;
}

    #menubar {
    height : 200px;
    }
    
    #p-img{
    	padding : 40px 20px;
    }
    #s{
    	padding : 0px 42px;
    }
    
    .parent {
    	border : 1px solid blue;
    }
    .parent>div{
    	float:left;
    	width : 50%;
    }
    .section-table{
    	margin-top : 90px;
    	height : 100%;
    }
    tbody{
    line-height: 100px;
    }
    #in{
    font-size: medium;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<br clear="both">
	<div class="page parent" id="content">
		<h1 id="s">녹차 스프레드</h1>
		<div id="p-img" class="section-p"align="center">
             <img id="tea" src="https://recipe1.ezmember.co.kr/cache/recipe/2016/06/05/dbaea0e7d63620706871aaaef7f18b2c1.jpg">
		</div>
		<div class="section-table">
		<table>
             	<h3>◈재료</h3>
             	<pre id="in">우유 500ml, 생크림 250ml, 녹차가루 2t(5~10g), 설탕 2T(30g)</pre>
                <h3>◈조리순서</h3>
                1. 재료준비<hr> 
				2. 우유 + 생크림을 섞고 설탕을 넣어준다.<hr>
				3. 녹차가루를 넣고 섞어준다.<hr>
				4. 약불에서 계속 저어가며 끓여주셔야합니다.<hr>
				5. 약불에서 30~40분간<hr>
				6. 약 1/3정도로 쫄았을 때의 농도가 적당<hr>
				7. 완성
				</pre>
		</table>
		
		</div>
		<br clear="both">
	</div>

</body>
</html>