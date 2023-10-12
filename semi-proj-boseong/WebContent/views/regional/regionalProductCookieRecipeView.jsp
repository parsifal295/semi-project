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
    	padding : 60px 20px;
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
		<h1 id="s">녹차 쿠키</h1>
		<div id="p-img" class="section-p"align="center">
             <img id="tea" src="https://recipe1.ezmember.co.kr/cache/recipe/2021/12/01/14075610194c7d61815497474494ff4b1.jpg">
		</div>
		<div class="section-table">
		<table>
             	<h3>◈재료</h3>
             	<pre id="in">무염버터 100g, 에리스리톨 45g, 비정제원당 18g, 소금 1g, 노른자 1개,
녹차가루 8g, 박력쌀가루 137g, 카카오닙스 30g</pre>
                <h3>◈조리순서</h3>
                1. 무염버터를 주걱으로 부드럽게 풀어주세요.<hr>
				2. 감미료를 넣고 섞어주세요.<hr>
				3. 노른자를 넣고 섞어주세요.<hr>
				4. 녹차가루를 넣고 섞어주세요.<hr>
				5. 박력쌀가루를 넣고 섞어주세요.<hr>
				6. 카카오닙스를 넣고 섞어주세요.<hr>
				7. 반죽을 한덩이로 뭉쳐주세요.<hr>
				8. 종이유산지위에 반죽을 올리고 돌돌말아서 모양을 잡아줍니다.<hr>
				9. 랩핑한 후 냉동실에서 20분간 굳혀주세요.<hr>
				10. 1cm간격으로 잘라주세요.<hr>
				11. 170/180도로 예열해 준 오븐에서 20-25분 동안 구워주세요.<hr>
				12. 완성
				</pre>
		</table>
		
		</div>
		<br clear="both">
	</div>

</body>
</html>