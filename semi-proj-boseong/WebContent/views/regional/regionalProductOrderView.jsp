<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산품 구매 페이지</title>
<style>
#box{
	width: 200px;
}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<div id=box></div>
	<div class="page" id="content">
        <div class="page">
        <table>

                <thead><tr>
                    <th scope="col" class=""><input type="checkbox" onclick="EC_SHOP_FRONT_ORDERFORM_PRODUCT.proc.setCheckOrderList('chk_order_cancel_list_supplier', this);"></th>
                                            <th scope="col">이미지</th>
                                            <th scope="col">상품정보</th>
                                            <th scope="col">판매가</th>
                                            <th scope="col">수량</th>
                                            <th scope="col">적립금</th>
                                            <th scope="col">배송구분</th>
                                            <th scope="col">배송비</th>
                                            <th scope="col">합계</th>
                                        </tr></thead>

                                        <tbody class="xans-element- xans-order xans-order-supplierlist center"><tr class="xans-record-">
                                            <td class=""><input id="chk_order_cancel_list0" name="chk_order_cancel_list_supplier0" value="1336:000A:F:39650" type="checkbox"></td>
                                                                    <td class="thumb"><a href="/product/detail.html?product_no=1336&amp;cate_no=1"><img src="//boseongmall.co.kr/web/product/tiny/202203/b33b578a160fd7b17723e41a39a0a30a.jpg" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt=""></a></td>
                                                                    <td class="left">
                                                                        <a href="/product/detail.html?product_no=1336&amp;cate_no=1"><strong>[보성농협 녹차잡곡사업소] 국내산 초록잎새 올벼쌀 800g (2023년산)</strong></a>
                                                                        <div class="option displaynone"></div>
                                                                        <p class="gBlank5 displaynone">무이자할부 상품</p>
                                                                        <p class="gBlank5 displaynone">유효기간 : </p>
                                                                    </td>
                                                                    <td class="right">
                                                                        <div class="">
                                            <strong>7,000원</strong><p class="displaynone"></p>
                                            </div>
                                                                        <div class="displaynone">
                                            <strong>7,000원</strong><p class="displaynone"></p>
                                            </div>
                                                                    </td>
                                                                    <td>1</td>
                                                                    <td><span class="txtInfo">-</span></td>
                                                                    <td><div class="txtInfo">업체기본배송<div class="displaynone">(해외배송가능)</div>
                                            </div></td>
                                                                    <td>[무료]</td>
                                                                    <td class="right">
                                            <strong>7,000원</strong><div class="displaynone"></div>
                                            </td>
                                                                </tr>
                                            </tbody>                            
		  
            </table>
          </div>
    </div>
	
</body>
</html>