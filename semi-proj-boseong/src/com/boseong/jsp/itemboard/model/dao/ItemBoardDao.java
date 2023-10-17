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
	
	
	public int ibIncreaseCount(Connection conn, int boardNo) {
		
		int result = 0;
		String sql = prop.getProperty("ibIncreaseCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ItemBoard iboardSelect(Connection conn, int boardNo) {
		
		ItemBoard ib = new ItemBoard();
		String sql = prop.getProperty("iboardSelect");
		ResultSet rset = null;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ib.setBoardNo(rset.getInt("BOARD_NO"));
				ib.setMemberName(rset.getString("MEM_NAME"));
				ib.setMemberNo(rset.getInt("MEM_NO"));
				ib.setTitle(rset.getString("IBOARD_TITLE"));
				ib.setContent(rset.getString("IBOARD_CONTENT"));
				ib.setPostDate(rset.getDate("IBOARD_POST_DATE"));
				ib.setModifyDate(rset.getDate("IBOARD_MODIFY_DATE"));
				ib.setStatus(rset.getString("STATUS"));
				ib.setPrice(rset.getInt("PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}
		// System.out.println("status DAO insert : " + ib.getStatus());
		return ib; 
	}
	

	public int selectCurrval(Connection conn, int categoryNo) {
		int result = 0;
		
		String sql = "SELECT \r\n" + 
				"				SEQ_IB_NO.CURRVAL NUM \r\n" + 
				"  		  FROM \r\n" + 
				"  		  		TB_ITEMBOARD\r\n" + 
				" 		 WHERE \r\n" + 
				" 		 		CATEGORY_NO = ?";
		ResultSet rset = null;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, categoryNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("NUM");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}
		return result;
	}
	
	
	public int iboardUpdate(Connection conn, ItemBoard ib) {
		
		int result = 0;
		String sql = prop.getProperty("iboardUpdate");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, ib.getTitle());
			pstmt.setString(2, ib.getContent());
			pstmt.setInt(3, ib.getPrice());
			pstmt.setInt(4, ib.getMemberNo());
			pstmt.setInt(5, ib.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int iboardDelete(Connection conn, int boardNo) {
		
		int result = 0;
		// 사실상은 DELETE가 아닌 UPDATE로 status를 'N'으로 set해준다
		String sql = prop.getProperty("iboardDelete");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ItemBoard> searchbarList(Connection conn, String keyword, PageInfo pi){
		
		ArrayList<ItemBoard> list = new ArrayList();
		String sql = prop.getProperty("searchbarList");
		ResultSet rset = null;
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, "%"+ keyword +"%");
			
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
		}
		return list;
	}

	
	

}
