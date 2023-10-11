package com.boseong.jsp.scrap.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public int iboardInsertScrap(Connection conn, Scrap sc) {
		
		int result = 0;
		String sql = prop.getProperty("iboardInsertScrap");
//		System.out.println(jObj.get("memberNo"));
//		System.out.println(jObj.get("boardNo"));
//		System.out.println(jObj.get("scrap"));
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setObject(1, sc.getMemberNo());
			pstmt.setObject(2, sc.getBoardNo());
			pstmt.setObject(3, sc.getStatus());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Scrap> iboardScrapSelect(Connection conn, Scrap sc) {
		
		ArrayList<Scrap> list = new ArrayList();
		String sql = prop.getProperty("iboardScrapSelect");		
		ResultSet rset = null;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setObject(1, sc.getMemberNo());
			pstmt.setObject(2, sc.getBoardNo());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Scrap sp = new Scrap();
				sp.setMemberNo(rset.getInt("MEM_NO"));
				sp.setBoardNo(rset.getInt("IBOARD_NO"));
				sp.setStatus(rset.getString("STATUS"));
				list.add(sc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO에서 select list값  : "+ list);
		return list;
	}
	
	
	public int iboardScrapUpdate(Connection conn, Scrap sc) {
		
		int update = 1;
		String sql = prop.getProperty("iboardScrapUpdate");

		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setObject(1, sc.getMemberNo());
			pstmt.setObject(2, sc.getBoardNo());
			pstmt.setObject(3, sc.getStatus());
			
			update = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Dao update  :" + update);
		return update;
	}

}
