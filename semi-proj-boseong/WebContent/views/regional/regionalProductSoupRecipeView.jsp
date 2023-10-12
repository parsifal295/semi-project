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
    	margin-top : 50px;
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
		<h1 id="s">녹차 수제비</h1>
		<div id="p-img" class="section-p"align="center">
             <img id="tea" src="https://recipe1.ezmember.co.kr/cache/recipe/2020/11/03/a98c68c45690fab5d25fa4366eec52dc1.jpg">
		</div>
		<div class="section-table">
		<table>
             	<h3>◈재료</h3>
             	<pre id="in">녹차가루, 쑥가루, 밀가루, 감자, 애호박, 멸치, 다시마, 건새우, 청양고추,
소금, 간장</pre>
                <h3>◈조리순서</h3>
                1. 밀가루 200g에 녹차가루 3큰술과 쑥가루 1큰술을 넣고, 물 140㎖ 부어가며 반죽한다. 반죽이 완성되면 그릇에 담아 랩핑해(또는 위생 비닐에 넣어) 냉장고에서 15~20분 정도 숙성시킨다.<hr> 
				2. 반죽이 숙성되는 동안 감자 1/2개와 애호박 1/2개를 깨끗이 씻어 2cm 정도 크기로 썰어 둔다.<hr> 
				3. 냄비에 물을 적당량 넣고 멸치 2개, 다시마 1개, 건새우 2개를 넣어 육수를 낸다. 이때 물은 조금 넉넉히 넣는 것이 좋다.<hr> 
				4. 육수가 우러나면 재료를 건져내고, 준비해둔 야채를 넣어 5분 정도 끓인다.<hr> 
				5. 불을 약하게 줄이고 수제비 반죽을 떼어 넣는다. 반죽을 다 넣으면 다시 불을 세게 한 뒤 청양고추 1개를 어슷썰기해 곁들인다.<hr> 
				6. 소금 1/2큰술, 간장 1큰술을 넣어 간을 맞추고, 청양고추를 건져낸 후 그릇에 옮겨 담는다.<hr>
				7. 완성
				</pre>
		</table>
		
		</div>
		<br clear="both">
	</div>

</body>
</html>