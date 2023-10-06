<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피</title>
<style>
    
    #tea{
            padding: 300px 60px 5px 80px;
            text-align: left;
            height: 700px;
            width: 400px;
            
        }

    #tea2{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 700px;
            width: 400px;
            
        }
    
    #soap{
            padding: 300px 60px 5px 50px;
            text-align: left;
            height: 700px;
            width: 400px;
            
        }
    
	 #notice{
			
            font-size: xx-large;
            height: 100px;
    }

    #review{
            
            font-size: xx-large;
            height: 100px;
            
    }

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp"%>
	
    <div class="page" id="content">
        <div class="page" id="recipe">
            <table>

            <td rowspan="10" width="100px" align="center"></td>
                <img src="https://boseongmall.co.kr/web/product/big/202203/7ff954440e14e7773f1a2b8dc2458c24.jpg" id="tea"  style="cursor:pointer;" onclick="teaPurchase();">
            <td rowspan="10" width="100px" align="center"></td>        
                <img src="https://boseongmall.co.kr/web/product/big/202206/aee1f475b681d59881dbc1546f92b33d.jpg" id="tea2" style="cursor:pointer;" onclick="Purchase();">
            <td rowspan="10" width="100px" align="center"></td>    
                <img src="https://boseongmall.co.kr/web/product/big/202212/4c77008f9b37dbe43ad6e5fbfe69552c.jpg" id="soap" style="cursor:pointer;" onclick="soapPurchase();">
		  
            </table>
            
           <form>
            	<input type="button" id="review" value="구매리뷰" style="float:right;">
            	<input type="button" id="notice" value="공지사항" style="float:right;">
           </form>
            
           
        </div>
    </div>
    <script>
	function teaPurchase(){
		location.href = "<%=contextPath%>/detail.rp";
	}
	function Purchase(){
		location.href = "<%=contextPath%>/tea.rp";
	}
	function soapPurchase(){
		location.href = "<%=contextPath%>/soap.rp";
	}
	
	</script>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>