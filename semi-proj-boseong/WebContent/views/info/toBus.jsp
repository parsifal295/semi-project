<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시외버스</title>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
    <div id="box"></div>
    <div id= "content" class="page">
		<div class="page">
				<h1>시외버스 이용 안내</h1>
				<p>
				주요 버스터미널은 보성버스터미널, 벌교 시외버스터미널 두 곳입니다.
				주요 터미널들은 농어촌버스의 결절점이며 시외버스를 이용할 수 있습니다.
				</p>
				
				<h3>보성 - 벌교 - 서울(강남)간 고속버스 시간표 </h3>
				<table class="table">
					<thead>
						<tr colspan="3"></tr>
						<tr>
							<th>출발</th>
							<th>경유</th>
							<th>도착</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>보성(08:30)</td>
							<td>벌교(09:10)</td>
							<td>강남(13:30)</td>
						</tr>
						<tr><td>보성(15:00)</td>
							<td>벌교(15:40)</td>
							<td>강남(19:50)</td>
						</tr>
						<tr><td>강남(08:40)</td>
							<td>벌교(12:40)</td>
							<td>보성(13:20)</td>
						</tr>
						<tr><td>강남(15:10)</td>
							<td>벌교(19:10)</td>
							<td>보성(19:50)</td>
						</tr>
					</tbody>

					<tfoot>
						<tr>
							<td colspan="3">소요시간 : 약 5시간</td>
						</tr>
					</tfoot>
				</table>
				<h3>보성터미널 시외버스 시간표</h3>
				<table class="table">
					<thead>
						<tr>
							<th colspan="2">목포 방면</th>
							<th colspan="2">해남, 완도방면</th>
							<th colspan="2">여수방면</th>
							<th colspan="2">순천, 부산방면</th>
						</tr>
						<tr>
							<th>시간</th>
							<th>종점</th>
							<th>시간</th>
							<th>종점</th>
							<th>시간</th>
							<th>종점</th>
							<th>시간</th>
							<th>종점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>06:55</td>
							<td>강진, 목포</td>
							<td>07:40</td>
							<td>해남</td>
							<td>08:25</td>
							<td>순천, 여수</td>
							<td>09:05</td>
							<td>순천</td>
						</tr>
						<tr>
							<td>09:45</td>
							<td>강진, 목포</td>
							<td>10:55</td>
							<td>해남, 완도</td>
							<td>13:40</td>
							<td>순천, 여수</td>
							<td>09:45</td>
							<td>순천, 부산(광양, 동광양)</td>
						</tr>
						<tr>
							<td>12:30</td>
							<td>강진, 목포</td>
							<td>12:00</td>
							<td>해남, 완도</td>
							<td>16:45</td>
							<td>순천, 여수</td>
							<td>10:40</td>
							<td>순천</td>
						</tr>
						<tr>
							<td>14:05</td>
							<td>강진, 목포</td>
							<td>15:05</td>
							<td>해남, 완도</td>
							<td>19:35</td>
							<td>순천, 여수</td>
							<td>12:40</td>
							<td>순천(광양, 동광양)</td>
						</tr>
						<tr>
							<td>15:50</td>
							<td>강진, 목포</td>
							<td>17:25</td>
							<td>해남, 완도</td>
							<td> </td>
							<td> </td>
							<td>14:45</td>
							<td>순천</td>
						</tr>
						
						<tfoot>
							<tr>
								<td colspan="8">
									위의 출발시간은 도로사정에 따라 변동될 수 있습니다.
								</td>
							</tr>
						</tfoot>
					</tbody>

				</table>
		</div>  
    
    </div>
		
	<%@include file = "../common/footer.jsp" %>
</body>
</html>