package com.boseong.jsp.regional.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.boseong.jsp.common.JDBCTemplate.close;

import com.boseong.jsp.regional.model.vo.ProductNotice;

public class ProductNoticeDao {
	
	private Properties prop = new Properties();
	
	public ProductNoticeDao() {
		
		String fileName = ProductNoticeDao.class.getResource("/sql/regional/productnotice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductNotice> selectProductNoticeList(Connection conn){
		
		ArrayList<ProductNotice> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductNotice p = new ProductNotice();
				p.setNoticeNo(rset.getInt("NOTICE_NO"));
				p.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				p.setCount(rset.getInt("COUNT"));
				p.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int increaseCount(Connection conn, int noticeNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertProductNotice(Connection conn, ProductNotice p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getNoticeTitle());
			pstmt.setString(2, p.getNoticeContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
