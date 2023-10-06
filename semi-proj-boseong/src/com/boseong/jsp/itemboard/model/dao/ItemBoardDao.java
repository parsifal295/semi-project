package com.boseong.jsp.itemboard.model.dao;

import static com.boseong.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.vo.PageInfo;
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
			
			System.out.println(result);
			
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
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 게시글의 총 개수
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	
	
	public ArrayList<ItemBoard> selectIboardList(Connection conn , PageInfo pi){
		
		ArrayList<ItemBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// boardLimit이 10이라는 가정하에
			// * currentPage == 1 => 시작값  1, 끝값 10
			// * currentPage == 2 => 시작값 11, 끝값 20
			// * currentPage == 3 => 시작값 21, 끝값 30
			// * 시작값  = (currentPage - 1) * boardLimit + 1;
			// * 끝값     = 시작값 + boardLimit - 1; 
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ItemBoard ib = new ItemBoard();
				ib.setBoardNo(rset.getInt("BOARD_NO"));
				ib.setMemberName(rset.getString("MEM_NAME"));
				ib.setTitle(rset.getString("IBOARD_TITLE"));
				ib.setContent(rset.getString("IBOARD_CONTENT"));
				ib.setPostDate(rset.getDate("IBOARD_POST_DATE"));
				ib.setModifyDate(rset.getDate("IBOARD_MODIFY_DATE"));
				ib.setCount(rset.getInt("COUNT"));
				ib.setPrice(rset.getInt("PRICE"));
				list.add(ib);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	

}
