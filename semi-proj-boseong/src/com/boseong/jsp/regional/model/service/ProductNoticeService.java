package com.boseong.jsp.regional.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;

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
	
	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new ProductNoticeDao().increaseCount(conn, noticeNo);
		
		if(result >0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}
	
	public int insertProductNotice(ProductNotice p) {
		
		Connection conn = getConnection();
		
		int result = new ProductNoticeDao().insertProductNotice(conn, p);
		
		if(result >0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}
	
	public ProductNotice selectProductNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		ProductNotice p = new ProductNoticeDao().selectProductNotice(conn, noticeNo);
		
		close(conn);
		
		return p;
	}
	
}
