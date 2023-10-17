package com.boseong.jsp.scrap.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.commit;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.boseong.jsp.scrap.controller.IboardScrapController;
import com.boseong.jsp.scrap.model.dao.ScrapDao;
import com.boseong.jsp.scrap.model.vo.Scrap;

public class ScrapService {
	
	
	
	public ArrayList<Scrap> iboardScrapSelect(Scrap sc) {
		
		Connection conn = getConnection();
		
		ArrayList<Scrap> list = null;
		
		list = new ScrapDao().iboardScrapSelect(conn, sc);
		
		close(conn);
		
		return list;
	}
	 
	public int iboardInsertScrap(Scrap sc) {
		
		Connection conn = getConnection();
		
		int insert = new ScrapDao().iboardInsertScrap(conn, sc);
		if(insert > 0) {
			commit(conn);
			// String st = new ScrapDao().iboardInsertNo(conn, sc);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("Service insert Scrap : " + insert);
		
		return insert;
	}
	
	public int iboardScrapUpdate(Scrap sc) {
		
		Connection conn = getConnection();
		
		int update = new ScrapDao().iboardScrapUpdate(conn, sc);
		if(update > 0) {
			commit(conn);
			// String st = new ScrapDao().iboardUpdateNo(conn, sc);
		}else {
			rollback(conn);
		}
		return update;
	}
	

}
