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
#buy{
            
            font-size: large;
            height: 100px;
            width : 150px;
            
    }   
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<div id=box></div>
	<div class="page" id="content">
        <div class="page">
		<h1>장바구니</h1>
		<br>
        <table border="1" summary="" class="xans-element- xans-order xans-order-normindividual xans-record-"><caption>개별배송</caption>
            <colgroup>
            <col style="width:27px">
            <col style="width:92px">
            <col style="width:auto">
            <col style="width:98px">
            <col style="width:75px">
            <col style="width:98px">
            <col style="width:98px">
            <col style="width:85px">
            <col style="width:98px">
            <col style="width:110px">
            </colgroup>
            <thead><tr>
            <th scope="col"><input type="checkbox" onclick="Basket.setCheckBasketList('basket_product_normal_type_individual', this);"></th>
                                <th scope="col">이미지</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">판매가</th>
                                <th scope="col">수량</th>
                                <th scope="col">적립금</th>
                                <th scope="col">배송구분</th>
                                <th scope="col">배송비</th>
                                <th scope="col">합계</th>
                                <th scope="col">선택</th>
                            </tr></thead>
            <tfoot class="right"><tr>
            <td colspan="10">
            <span class="gLeft">[개별배송]</span> 상품구매금액 <strong>7000 <span class="displaynone">()</span></strong><span class="displaynone"> </span> + 배송비 0 (무료)<span class="displaynone"> </span> <span class="displaynone"> - 상품할인금액 0 </span> = 합계 : <strong class="txtEm gIndent10"><span class="txt18">7000</span>원</strong> <span class="displaynone"> </span>
            </td>
                            </tr></tfoot><tbody class="xans-element- xans-order xans-order-list center"><tr class="xans-record-">
            <td><input type="checkbox" id="basket_chk_id_0" name="basket_product_normal_type_individual"></td>
                                <td class="thumb"><a href="/product/detail.html?product_no=2328&amp;cate_no=123"><img src="//boseongmall.co.kr/web/product/tiny/202203/b33b578a160fd7b17723e41a39a0a30a.jpg" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="[대한다업] 처음딴차+처음딴차 세트"></a></td>
                                <td class="left">
                                    <a href="/product/detail.html?product_no=2328&amp;cate_no=123"><strong>[보성농협] 국내산 녹차 세트 (2023년산)</strong>  </a><span class="displaynone"></span>
                                    </td>
                                <td class="right">
                                    <div class="">
            <strong>7000원</strong><p class="displaynone"></p>
            </div>
                                    <div class="displaynone">
            <strong>7000원</strong><p class="displaynone"></p>
            </div>
                                </td>
                                <td>
                                    <span class="">
                                        <span class="ec-base-qty"><input id="quantity_id_0" name="quantity_name_0" size="2" value="1" type="text"><a href="javascript:;" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);"><img src="http://img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" class="up"></a><a href="javascript:;" onclick="Basket.outQuantityShortcut('quantity_id_0', 0);"><img src="http://img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" class="down"></a></span>
                                        <a href="javascript:;" class="gBlank5" onclick="Basket.modifyQuantity()"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_modify.gif" alt="변경"></a>
                                    </span>
                                    <span class="displaynone">1</span>
                                </td>
                                <td><span class="txtInfo">-</span></td>
                                <td><div class="txtInfo">개별배송<div class="displaynone">(해외배송가능)</div>
            </div></td>
                                <td>
            <p class="displaynone">0원<span class="displaynone"><br></span><br></p>무료</td>
                                <td class="right">
            <strong>7000원</strong><div class="displaynone"></div>
            </td>
                                <td class="button">
                                    <a href="javascript:;" onclick="Basket.orderBasketItem(0);"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order.gif" alt="주문하기"></a>
                                    <a href="javascript:;" onclick="BasketNew.moveWish(0);"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_wish.gif" alt="관심상품등록"></a>
                                    <a href="javascript:;" onclick="Basket.deleteBasketItem(0);"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete.gif" alt="삭제"></a>
                                </td>
                            </tr>
            </tbody>
            </table>
          </div>
    </div>
	
</body>
</html>