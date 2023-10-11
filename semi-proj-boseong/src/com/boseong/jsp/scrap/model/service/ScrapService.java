package com.boseong.jsp.scrap.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.commit;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import org.json.simple.JSONObject;

import com.boseong.jsp.scrap.model.dao.ScrapDao;
import com.boseong.jsp.scrap.model.vo.Scrap;

public class ScrapService {
	
	
	public int iboardInsertScrap(JSONObject jObj) {
		
		Connection conn = getConnection();
		
		int result = new ScrapDao().iboardInsertScrap(conn, jObj);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Scrap iboardScrapSelect(JSONObject jObj) {
		
		Connection conn = getConnection();
	
		Scrap sc = new ScrapDao().iboardScrapSelect(conn, jObj);
		
		close(conn);
		
		return sc;
	}
	
	public int iboardScrapUpdate(JSONObject jObj) {
		
		Connection conn = getConnection();
		
		int update = new ScrapDao().iboardScrapUpdate(conn, jObj);
		
		if(update > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return update;
	}

}
