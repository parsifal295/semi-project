package com.boseong.jsp.scrap.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.commit;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import com.boseong.jsp.scrap.model.dao.ScrapDao;
import com.boseong.jsp.scrap.model.vo.Scrap;

public class ScrapService {
	
	
	public int iboardInsertScrap(Scrap sc) {
		
		Connection conn = getConnection();
		
		int insert = new ScrapDao().iboardInsertScrap(conn, sc);
		int scrap = 0;
		if(insert > 0) {
			commit(conn);
			String st = new ScrapDao().iboardInsertNo(conn, sc);
			if(st.equals("Y")) {
				scrap = 1;
			}
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("Service insert Scrap : " + scrap);

		return scrap;
	}
	
	public ArrayList<Scrap> iboardScrapSelect(Scrap sc) {
		
		Connection conn = getConnection();
	
		ArrayList<Scrap> list = new ScrapDao().iboardScrapSelect(conn, sc);
		
		close(conn);
		
		return list;
	}
	
	public int iboardScrapUpdate(Scrap sc) {
		
		Connection conn = getConnection();
		
		int update = new ScrapDao().iboardScrapUpdate(conn, sc);
		int scrap = 0;
		if(update > 0) {
			commit(conn);
			String st = new ScrapDao().iboardUpdateNo(conn, sc);
			if(st.equals("Y")) {
				scrap = 1;
			}else {
				scrap = 2;
			}
		}else {
			rollback(conn);
		}
		System.out.println("Service update Scrap : " + scrap);
		return scrap;
	}
	

}
