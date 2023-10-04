package com.boseong.jsp.itemboard.model.dao;

import static com.boseong.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.boseong.jsp.Attachment.model.vo.Attachment;
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
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ib.getMemberNo());
			pstmt.setString(2, ib.getTitle());
			pstmt.setString(3, ib.getContent());
			pstmt.setInt(4, ib.getPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getModifiedName());
			pstmt.setString(3, at.getSavePath());
			System.out.println(at.getOriginName() + at.getModifiedName() + at.getSavePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
