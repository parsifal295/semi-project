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
		
		int result = new ScrapDao().iboardInsertScrap(conn, sc);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
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
		
		if(update > 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return update;
	}

}
