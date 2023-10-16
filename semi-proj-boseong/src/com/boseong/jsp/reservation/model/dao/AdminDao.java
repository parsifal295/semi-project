package com.boseong.jsp.reservation.model.dao;

import static com.boseong.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.boseong.jsp.reservation.model.vo.AdminReservation;

public class AdminDao {
	private Properties prop = new Properties();
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/reservation/admin-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public HashMap countUpcoming(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap counts = new HashMap();
		String sql = prop.getProperty("countUpcoming");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				counts.put(rset.getString("TYPE"), rset.getInt("COUNT"));
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return counts;
	}
	public ArrayList<AdminReservation> selectList(Connection conn, String key){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReservation> list = new ArrayList();
		String sql = prop.getProperty(key);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				AdminReservation adminRsv = new AdminReservation(
						rset.getInt("RESERVATION_NO"),
						rset.getString("MEM_ID"),
						rset.getString("PHONE"),
						rset.getString("TYPE"),
						rset.getString("START_DATE"),
						rset.getString("STATUS")						
						);
				list.add(adminRsv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<AdminReservation> select(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReservation> list = new ArrayList();
		String sql = prop.getProperty("select");
		
		return list;
	}
	public int selectListCount(Connection conn, String key) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty(key);
		
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
	
	public AdminReservation selectReservation(Connection conn, int searchKey) {
		PreparedStatement pstmt = null;
		AdminReservation selectedRsv = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, searchKey);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				selectedRsv = 
						new AdminReservation(
						rset.getInt("RESERVATION_NO"),
						rset.getString("MEM_ID"),
						rset.getString("PHONE"),
						rset.getString("TYPE"),
						rset.getString("START_DATE"),
						rset.getString("STATUS"),
						rset.getString("RESERV_TYPE")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return selectedRsv;
	}
	public ArrayList<AdminReservation> selectById(Connection conn, String searchKey) {
		PreparedStatement pstmt = null;
		ArrayList<AdminReservation> list = new ArrayList();
		ResultSet rset = null;
		String sql = prop.getProperty("selectById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchKey);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AdminReservation selectedRsv = new AdminReservation(
								rset.getInt("RESERVATION_NO"),
								rset.getString("MEM_ID"),
								rset.getString("PHONE"),
								rset.getString("TYPE"),
								rset.getString("START_DATE"),
								rset.getString("STATUS"),
								rset.getString("RESERV_TYPE")
								);
				list.add(selectedRsv);
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
