package com.boseong.jsp.scrap.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import org.json.simple.JSONObject;

import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;

public class ScrapDao {
	
	private Properties prop = new Properties();
	
	public ScrapDao() {
		
		String filePath = ItemBoardDao.class.getResource("/sql/scrap/scrap-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int iboardInsertScrap(Connection conn, JSONObject jObj) {
		
		int result = 0;
		String sql = prop.getProperty("iboardInsertScrap");
//		System.out.println(jObj.get("memberNo"));
//		System.out.println(jObj.get("boardNo"));
//		System.out.println(jObj.get("scrap"));
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setObject(1, jObj.get("memberNo"));
			pstmt.setObject(2, jObj.get("boardNo"));
			pstmt.setObject(3, jObj.get("scrap"));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int iboardScrapSelect(Connection conn, JSONObject jObj) {
		
		int result = 0;
		String sql = prop.getProperty("iboardScrapSelect");		
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

}
