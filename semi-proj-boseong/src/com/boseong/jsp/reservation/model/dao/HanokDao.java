package com.boseong.jsp.reservation.model.dao;

import static com.boseong.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.boseong.jsp.reservation.model.vo.HanokReservation;
import com.boseong.jsp.reservation.model.vo.Room;

public class HanokDao {
	private Properties prop = new Properties();
	public HanokDao() {
		String fileName = HanokDao.class.getResource("/sql/reservation/hanok-mapper.xml").getPath();		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
		}
	}
	
	public ArrayList<Room> selectRoomList(Connection conn){
		ArrayList<Room> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRoomList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Room r = new Room();
				r.setRoomNo(rset.getInt("ROOM_NO"));
				r.setRoomType(rset.getString("ROOM_TYPE"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Room getRoomLimit(Connection conn, int roomNo) {
		Room r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getRoomLimit");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				r = new Room();
				r.setBaseNum(rset.getInt("BASE_NUM"));
				r.setMaxNum(rset.getInt("MAX_NUM"));
				r.setPrice(rset.getInt("PRICE"));
				r.setExtraPrice(rset.getInt("EXTRA_PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public Room getRoomInfo(Connection conn, int roomNo) {
		Room r = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getRoomInfo");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Room(
						rset.getInt("ROOM_NO"),
						rset.getString("ROOM_TYPE"),
						rset.getInt("BASE_NUM"),
						rset.getInt("MAX_NUM"),
						rset.getInt("PRICE"),
						rset.getInt("EXTRA_PRICE"),
						rset.getString("ROOM_SIZE"),
						rset.getString("AMENITY"),
						rset.getString("ROOM_INTRO"),
						rset.getString("ROOM_DETAIL")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	public ArrayList checkDate(Connection conn, HanokReservation hanokRsv) {
		ArrayList list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(5, hanokRsv.getRoomNo());
			pstmt.setString(1, hanokRsv.getFromDate());
			pstmt.setString(2, hanokRsv.getToDate());
			pstmt.setString(3, hanokRsv.getFromDate());
			pstmt.setString(4, hanokRsv.getToDate());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				HanokReservation hanok = new HanokReservation();
				hanok.setReservNo(rset.getInt("RESERVATION_NO"));
				hanok.setRoomNo(rset.getInt("ROOM_NO"));
				hanok.setFromDate(rset.getString("FROM_DATE"));
				hanok.setToDate(rset.getString("TO_DATE"));
				
				list.add(hanok);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int insertReservation(Connection conn, HanokReservation hanokRsv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hanokRsv.getRoomNo());
			pstmt.setInt(2, hanokRsv.getMemNo());
			pstmt.setString(3, hanokRsv.getFromDate());
			pstmt.setString(4, hanokRsv.getToDate());
			pstmt.setInt(5, hanokRsv.getClientNum());
			pstmt.setString(6, hanokRsv.getMessage());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}
	
	
}
