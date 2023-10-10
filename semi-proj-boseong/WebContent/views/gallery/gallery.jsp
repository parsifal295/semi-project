<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<style>
	/*--------------------------gallery part----------------------------*/
	#ig-logo{
	    background-image:url('resources/image/ig-logo.png');
	    background-position: center;
	    background-size: cover;
	    width: 100px;
	    height: 100px;
	    margin: auto;

	}
	#tag{
	    text-decoration: none;
	    text-align: center;
	    height: 150px;
	    padding-top: 20px;
	    padding-bottom: 50px;
	}
	.grid{
	    margin: 0;
	    padding: 0;
	    list-style: none;
	    position: relative;
	    display: block;
	    height: auto;
	}
	.grid-item{
	    width: 100%;
	    height: 100%;
	}
	.grid-item > embed{
	    width: 300px;
	    height: 600px;
	    margin-top: 10px;
	    margin-bottom: 10px;
	    margin-left: 17px;
	    z-index: 1;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!---------------------인스타그램 갤러리 페이지---------------->
   	<form action="" method="post">
       <div style="height: 200px;"></div>
       <div id="content">
           <div id="photo-div">
               <div id="ig-logo"></div>
               <div id="tag">
                   <span>
                       <a href="">#보성농원</a><a href="">#보성</a><a href="">#녹차</a><a href="">#보성군</a>
                   </span>
               </div>
               <ol class="grid">
                   <li class="grid-item">
                       <embed src="https://www.instagram.com/p/Cwi6UpgSMpK/embed" >
                       <embed src="https://www.instagram.com/p/CfU9eKzBuGQ/embed" >
                       <embed src="https://www.instagram.com/p/CsGVbHvOgtP/embed" >
                       <embed src="https://www.instagram.com/p/CvIEDtDPWRR/embed" >
                       <embed src="https://www.instagram.com/p/CbTauMePCkR/embed" >
                       <embed src="https://www.instagram.com/p/Cr0cBp7JfIl/embed" >
                       <embed src="https://www.instagram.com/p/Cknww5cD2z0/embed" >
                       <embed src="https://www.instagram.com/p/CvoNW2MvVki/embed" >
                       <embed src="https://www.instagram.com/p/Cjh9I_fPc1S/embed" >
                       <embed src="https://www.instagram.com/p/ChY7wqFJ7xH/embed" >
                       <embed src="https://www.instagram.com/p/CjPnjohheeL/embed" >
                       <embed src="https://www.instagram.com/p/ChD5HUhJ3aA/embed" >
                   </li>
               </ol>
           </div>
         </div>
  	 </form>


	<%@ include file="../common/footer.jsp" %>
</body>
</html>