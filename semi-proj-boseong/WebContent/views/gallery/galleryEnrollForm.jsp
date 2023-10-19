<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>사진게시판 작성</title>
<style>
	#table-area{
		margin : auto;
		margin-top : 50px;
		margin-bottom : 120px;
		width : 800px;
		height : 600px;
		color: rgb(5, 51, 5);
	}
	#content>table{
		text-align: center;
		border : 1px solid rgba(0, 0, 0, 0.347);
	}
	#link-area{
		width: 100%;
	}
	#galleryImg{
		width: 400px;
		height: 300px;
	}
	#galleryImg-file{
		margin-top: 50px;
	}
	#galleryImg:hover{
		cursor : pointer;
	} 
	#table-area th{
		background-color: rgba(34, 139, 34, 0.095);
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/gallery/galleryEnroll.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
		<div style="height: 200px;"></div>
		<form action="<%= contextPath %>/insert.gy" id="enroll-table" method="post" enctype="multipart/form-data">
			<div id="content">
				<table id="table-area"  align="center" border="1">
					<tr>
						<th colspan="2"><h3>갤러리 작성</h3></th>
					</tr>
					<tr>
						<th>썸네일 이미지</th>
						<td colspan="3" align="center">
							<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ67cTzZiRoYqv3QETVuupeq8DumnRsz1d5r1VdOZPk&s" alt="썸네일 이미지" id="galleryImg" onclick="imageclickarea();">
							<input type="file" name="upfile" id="galleryImg-file" onchange="loadImg(this);" required>
						</td>
					</tr>
					<tr>
						<th width="150">링크</th>
						<td colspan="3"><input type="text" name="link" id="link-area" placeholder="보성에 해당하는 사진이 잘 보이는 링크를 걸어주세요." required></td>
					</tr>
					<tr>
						<th colspan="2">
							<button type="reset" class="btn btn-outline-success">초기화</button>
							<button type="submit" class="btn btn-outline-success">업로드</button>
						</th>
					</tr>
				</table>
			</div>	
		</form>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>