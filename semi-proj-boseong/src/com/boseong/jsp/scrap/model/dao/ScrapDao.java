package com.boseong.jsp.scrap.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.json.simple.JSONObject;

import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;
import com.boseong.jsp.scrap.model.vo.Scrap;

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
	
	public Scrap iboardScrapSelect(Connection conn, JSONObject jObj) {
		
		Scrap sc = null;
		String sql = prop.getProperty("iboardScrapSelect");		
		ResultSet rset = null;
		System.out.println("selectDao memerNo : "+jObj.get("memberNo"));
		System.out.println("selectDao boardNo : " + jObj.get("boardNo"));
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setObject(1, jObj.get("memberNo"));
			pstmt.setObject(2, jObj.get("boardNo"));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sc = new Scrap();
				sc.setMemberNo(rset.getInt("MEM_NO"));
				sc.setBoardNo(rset.getInt("IBOARD_NO"));
				sc.setStatus(rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO에서 sc값  : "+sc);
		return sc;
	}
	
	
	public int iboardScrapUpdate(Connection conn, JSONObject jObj) {
		
		int update = 1;
		String sql = prop.getProperty("iboardScrapUpdate");
		System.out.println("updateDao memerNo : "+jObj.get("memberNo"));
		System.out.println("updateDao boardNo : " + jObj.get("boardNo"));
		System.out.println("updateDao scrap : " + jObj.get("scrap"));
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setObject(1, jObj.get("memberNo"));
			pstmt.setObject(2, jObj.get("boardNo"));
			pstmt.setObject(3, jObj.get("scrap"));
			
			update = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Dao update  :" + update);
		return update;
	}

}
