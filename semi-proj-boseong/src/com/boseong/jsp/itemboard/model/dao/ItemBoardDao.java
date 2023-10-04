package com.boseong.jsp.itemboard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.boseong.jsp.itemboard.model.vo.ItemBoard;

public class ItemBoardDao {
	
	private Properties prop = new Properties();
	
	public ItemBoardDao() {
		
		String filePath = ItemBoardDao.class.getResource("/sql/itemBoard/itemBoard-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertBoard(Connection conn, ItemBoard ib) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		return result;
	}

}
