<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String tour =(String)request.getAttribute("tour"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광 상세페이지</title>



<style>
	.outer{
		width : 1200px;
		height : 1700px;
		margin : auto;
		margin-top : 250px;
		font-size:25px;
	}
	
	.table {
		width:100%;
	}
	
	
</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>


		<div class="outer">
				
					<!-- ---------------------1시작----------------------------------------- -->
				<table>
				<%if(tour.equals("보성으로 떠나는 힐링여행")) { %>
					<tr>
						<th colspan="3" width=1200 height=100></th>
					</tr>
				
					<tr>
						<td colspan="3" width=1200 height=50 ><p style="font-size:32px" ><b><%=tour %></b></p></td>
					</tr>
					
					<tr>
					<td colspan="3"width=200><p style="font-size:18px">전라남도 보성군  | 코스 총거리 : 23.16km</p></td>
					
					</tr>
				
					<tr>
						<td colspan="3" height=150><p style="font-size:23px">
						강골마을에 가면 ‘전통 가옥에서 보내는 특별한 하룻밤’을 체험할 수 있다. 행정구역상으로는 전남 보성군 득량면 오봉리지만 
						강골마을이라 부르기도 하고 체험마을로 지정되면서 득량마을로 불리기도 하는 이 마을은 광주 이씨 집성촌이다.
						</p></td>
					</tr>
				
					<tr>
					<td colspan="3" height=150><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1679109.252335724!2d124.77562059374998!3d34.717530499999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35721322dfb7fb45%3A0xde1b220a30bc536d!2z64yA7ZWc64uk7JuQ!5e0!3m2!1sko!2skr!4v1696402092716!5m2!1sko!2skr" width="1200" height="700" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50><p style="font-size:25px" align="center"><b>✨코스 안내✨</b></td>
					</tr>
				
					
				
					<tr>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f15bf573-fce5-4c35-8ef1-bfcf3cfda447"  width="380" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=92590fc1-e9a2-44ec-94ba-853958cc2cfb" width="380" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f1e8dc3b-aebb-42f2-a9cf-1a2dcd7c6b0d" width="380" height="250"></td>
					</tr>
					
					<tr>
					
					<td width=400 height=50 align="center">
					
					❶한국차박물관
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❷보성 강골마을
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❸대한다원
					
					</td>
					</tr>
					
					<!-- ---------------------1끝 2시작----------------------------------------- -->
				
				<%}else if(tour.equals("보성 대원사 벚꽃길")) { %>
					<tr>
						<th colspan="3" width=1200 height=100></th>
					</tr>
				
					<tr>
						<td colspan="3" width=1200 height=50 ><p style="font-size:32px" ><b><%=tour %></b></p></td>
					</tr>
					
					<tr>
					<td colspan="3"width=200><p style="font-size:18px">전라남도 보성군  | 코스 총거리 : 약 5.3km</p></td>
					
					</tr>
				
					<tr>
						<td colspan="3" height=150><p style="font-size:23px">
						보성 대원사 벚꽃길에는 매년 3월~4월만 되면 향긋한 봄내음이 온천지에 가득하다. 그 산뜻함을 느껴보기 위해 예전에는 수십만 명이 한꺼번에 모여 꽃구경을 즐겼다면 코로나19 시대에는 구불구불 2차선 도로를 천천히 차로 달리며 담아볼 수 있다.<br>
						ㆍ코스 정보 : 대원사 삼거리~대원사 입구(약 5.3km)
						</p></td>
					</tr>
				
					<tr>
					<td colspan="3" height=150><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d578.0269643660429!2d127.13228737544406!3d34.961263034362304!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357202ce3f20a7f1%3A0xe8424f12d0e5a46c!2z67O07ISxIOuMgOybkOyCrCDqt7nrnb3soIQ!5e0!3m2!1sko!2skr!4v1696493355232!5m2!1sko!2skr" width="1200" height="700" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50><p style="font-size:25px" align="center"><b>✨코스 안내✨</b></td>
					</tr>
				
					
				
					<tr>
					<td width=400 height=300><img src="https://tong.visitkorea.or.kr/cms/resource/11/2717011_image2_1.JPG"  width="380" height="250"></td>
					<td width=400 height=300><img src="https://img1.daumcdn.net/thumb/R750x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbolNnt%2FbtqvoCQiEcq%2FrhxvxIlnkwznILU80dmkW0%2Fimg.jpg" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=43571497-73d6-4f41-a1b3-9331c8af4b00" width="380" height="250"></td>
					</tr>
					
					<tr>
					
					<td width=400 height=50 align="center">
					
					❶보성녹차 시배지
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❷대원사(보성)
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❸대원사 티벳박물관
					
					</td>
					</tr>
					
					<!-- ---------------------2끝 3시작----------------------------------------- -->
				
				<%}else if(tour.equals("보성 녹차밭에 깃든 짙은 녹차 향기를 따라 가는 길")) { %>
					<tr>
						<th colspan="3" width=1200 height=100></th>
					</tr>
				
					<tr>
						<td colspan="3" width=1200 height=50 ><p style="font-size:32px" ><b><%=tour %></b></p></td>
					</tr>
					
					<tr>
					<td colspan="3"width=200><p style="font-size:18px">전라남도 보성군  | 코스 총거리 : 47.27km</p></td>
					
					</tr>
				
					<tr>
						<td colspan="3" height=150><p style="font-size:23px">
						여수 앞바다에는 크고 작은 섬들이 그림처럼 펼쳐져 있다. 백제 때 지어진 고찰 향일암을 돌아 봉황의 전설이 깃든 오동도 등대를 거친다. 무엇보다 여수는 충무공의 흔적이 그대로 남아있는 임진란의 요충지라 할 수 있겠다. 이충무공의 흔적을 찾아 돌아본다.
						</p></td>
					</tr>
				
					<tr>
					<td colspan="3" height=150><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3279.5845477005237!2d127.07620017620577!3d34.71565728240949!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3572132692a16879%3A0xb2a2ae5099c833df!2z7KCE652864Ko64-EIOuztOyEseq1sCDrs7TshLHsnY0g64W57LCo66GcIDc2My02Nw!5e0!3m2!1sko!2skr!4v1696493906252!5m2!1sko!2skr" width="1200" height="700" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50><p style="font-size:25px" align="center"><b>✨코스 안내✨</b></td>
					</tr>
				
					
				
					<tr>
					<td width=400 height=300><img src="https://www.welchon.com/upload/bbs/reviewn//20170908103519099.jpg"  width="380" height="250"></td>
					<td width=400 height=300><img src="https://image.여기유.com/content_travel/2020021415452015816627208094.jpg" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=fa7f7e37-a718-4ea7-81a0-f614aa11f597" width="380" height="250"></td>
					</tr>
					
					<tr>
					
					<td width=400 height=50 align="center">
					
					❶다원쉼터
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❷ 한국차문화공원
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❸군학마을
					
					</td>
					</tr>
					
					
					<!-- ---------------------3끝 4시작----------------------------------------- -->
				
				<%}else if(tour.equals("청량한 남도의 숲")) { %>
					<tr>
						<th colspan="3" width=1200 height=100></th>
					</tr>
				
					<tr>
						<td colspan="3" width=1200 height=50 ><p style="font-size:32px" ><b><%=tour %></b></p></td>
					</tr>
					
					<tr>
					<td colspan="3"width=200><p style="font-size:18px">전라남도 보성군  | 코스 총거리 : 약 83.36km</p></td>
					
					</tr>
				
					<tr>
						<td colspan="3" height=150><p style="font-size:23px">
						하동을 온전히 즐기기엔 하루가 모자란다. 피톤치드 가득한 휴양림부터 근현대사를 품고 있는 득량역 추억의 거리와 보성여관, 태백산맥 문학관까지 알차게 둘러보는 여행 코스를 소개한다.
						</p></td>
					</tr>
				
					<tr>
					<td colspan="3" height=150><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3274.4889566231936!2d127.34073787621!3d34.8439394755129!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356dfed6ed8b3c4f%3A0x636ffcf6c8f52f84!2z7KCE652864Ko64-EIOuztOyEseq1sCDrsozqtZDsnY0g7YOc67Cx7IKw66el6ri4IDE5!5e0!3m2!1sko!2skr!4v1696494101608!5m2!1sko!2skr" width="1200" height="700" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></iframe></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50><p style="font-size:25px" align="center"><b>✨코스 안내✨</b></td>
					</tr>
				
					
				
					<tr>
					<td width=400 height=300><img src="https://image.여기유.com/content_travel/2890300101_GU4M8FVd_4aba19c80d81190736eadc789a391d6097257082_copyright.jpg"  width="380" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=0b94b539-6321-471b-9f66-5cd46f52a8ea" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f61b8174-a85b-4875-a56b-5e6902060c3e" width="380" height="250"></td>
					</tr>
					
					<tr>
					
					<td width=400 height=50 align="center">
					
					❶ 구 보성여관
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❷ 제암산자연휴양림
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❸ 득량역 추억의 거리
					
					</td>
					</tr>
					
						<!-- ---------------------4끝 5시작----------------------------------------- -->
				
				<%}else if(tour.equals("몸과 마음이 즐거운 녹차 테마 투어")) { %>
					<tr>
						<th colspan="3" width=1200 height=100></th>
					</tr>
				
					<tr>
						<td colspan="3" width=1200 height=50 ><p style="font-size:32px" ><b><%=tour %></b></p></td>
					</tr>
					
					<tr>
					<td colspan="3"width=200><p style="font-size:18px">전라남도 보성군  | 코스 총거리 : 약 53km</p></td>
					
					</tr>
				
					<tr>
						<td colspan="3" height=150><p style="font-size:23px">
						보성 하면 떠오르는 건 녹차다. 보성에는 드넓은 녹차밭인 대한다원과 녹차의 모든 것을 다루는 한국차박물관이 있다. 향긋한 녹차도 맛보고 푸른 녹차밭과 바다에서 인생 사진도 찍어 보자.
						</p></td>
					</tr>
				
					<tr>
					<td colspan="3" height=150><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3279.670646148715!2d127.0853251762058!3d34.71348618252611!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357212d95bb56de7%3A0x840abd93c018a89f!2z7KCE652864Ko64-EIOuztOyEseq1sCDrs7TshLHsnY0g64W57LCo66GcIDc1MA!5e0!3m2!1sko!2skr!4v1696494368242!5m2!1sko!2skr" width="1200" height="700" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50></td>
					</tr>
				
					<tr>
					<td colspan="3" height=50><p style="font-size:25px" align="center"><b>✨코스 안내✨</b></td>
					</tr>
				
					
				
					<tr>
					<td width=400 height=300><img src="https://tong.visitkorea.or.kr/cms/resource/81/2788381_image2_1.jpg"  width="380" height="250"></td>
					<td width=400 height=300><img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8a6b34a-7255-4cd1-8e5a-ab422dd8272d" height="250"></td>
					<td width=400 height=300><img src="https://mblogthumb-phinf.pstatic.net/MjAyMTA1MjNfMjMy/MDAxNjIxNzI0OTA0MDkx.lPrE7huTwbl7X7VGutHqws4tt1NoQLSc2qVbgkIB8bIg.wCBolyFy139Se_cfp8IGbjEiLQNjzViJ6Uajt1BvihEg.JPEG.ejp8702/SE-20fcca80-baca-11eb-ba4d-d37606cb7180.jpg?type=w800" width="380" height="250"></td>
					</tr>
					
					<tr>
					
					<td width=400 height=50 align="center">
					
					❶ 봇재
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❷  율포해수욕장(솔밭해변)
					
					</td>
					
					<td width=400 height=50 align="center">
					
					❸ 대한다원
					
					</td>
					</tr>
					
					 <% } %>
				</table>
		</div>
		
		
<%@ include file="../common/footer.jsp" %>
</body>
</html>