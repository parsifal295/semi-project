package com.boseong.jsp.regional.model.service;

import java.util.ArrayList;

import com.boseong.jsp.regional.model.vo.ProductNotice;

public interface ProductNoticeServiceI {
	
	// 공지사항리스트조회(R)
//	ArrayList<ProductNotice> selectProductNoticeList();

	ArrayList<ProductNotice> selectProductNoticeList();
	ArrayList<ProductNotice> selectProductReviewList();

}
