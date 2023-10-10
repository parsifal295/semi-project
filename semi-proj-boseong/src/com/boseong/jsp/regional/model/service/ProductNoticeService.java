package com.boseong.jsp.regional.model.service;

import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import com.boseong.jsp.regional.model.dao.ProductNoticeDao;
import com.boseong.jsp.regional.model.vo.ProductNotice;

public class ProductNoticeService implements ProductNoticeServiceI{
	
	@Override
	public ArrayList<ProductNotice> selectProductNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<ProductNotice> list = new ProductNoticeDao().selectProductNoticeList(conn);
		
		close(conn);
		
		return list;
	}
	
//	@Override
//	public ProductNotice selectProductNotice(int noticeNo) {
//		return null;
//	}
	
	
	
}
