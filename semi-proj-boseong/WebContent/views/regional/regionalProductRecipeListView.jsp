<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피</title>
<style>
    
    #jam{
            padding: 300px 60px 5px 80px;
            text-align: left;
            height: 700px;
            width: 400px;
            
        }

    #cookie{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 700px;
            width: 400px;
            
        }
    
    #soup{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 700px;
            width: 400px;
            
        }
    
	 #b1{
			
            font-size: larger;
            height: 100px;
            background-color: green;
            font-style: italic;
            color: white;
            border-color: black;
            display: inline-block;
            margin-right: 300px;
    }

    #b2{
            
            font-size: larger;
            height: 100px;
            background-color: green;
            font-style: italic;
            color: white;
            border-color: black;
            display: inline-block;
            margin-right: 300px;
            
    }
    #b3{
            
            font-size: larger;
            height: 100px;
            background-color: green;
            font-style: italic;
            color: white;
            border-color: black;
            display: inline-block;
            margin-right: 100px;
            
    }

</style>
<script type="text/javascript" src="resources/scripts/regional/regionalProductRecipeListViewScript.js"></script>
</head>
<body>
<%@ include file="../common/menubar.jsp"%>
	
    <div class="page" id="content">
        <div class="page" id="recipe">
            <table>

            <td rowspan="10" width="100px" align="center"></td>
                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2016/06/05/dbaea0e7d63620706871aaaef7f18b2c1.jpg" id="jam"  style="cursor:pointer;" onclick="jamRecipe();">
            <td rowspan="10" width="100px" align="center"></td>        
                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/12/01/14075610194c7d61815497474494ff4b1.jpg" id="cookie" style="cursor:pointer;" onclick="cookieRecipe();">
            <td rowspan="10" width="100px" align="center"></td>    
                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2020/11/03/a98c68c45690fab5d25fa4366eec52dc1.jpg" id="soup" style="cursor:pointer;" onclick="soupRecipe();">
		  
            </table>
            <form align="center">
            	<input type="button" onclick="location.href='jam.re'" id="b1" value="녹차 스프레드">
            	<input type="button" onclick="location.href='cookie.re'" id="b2" value="녹차 쿠키">
            	<input type="button" onclick="location.href='soup.re'" id="b3" value="녹차 수제비">
           </form>
           
        </div>
    </div>
   
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>