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

import com.boseong.jsp.reservation.model.vo.HorseProgram;
import com.boseong.jsp.reservation.model.vo.HorseReservation;

public class HorseDao {
	
	private Properties prop= new Properties();
	
	public HorseDao() {
		String fileName = HorseDao.class.getResource("/sql/reservation/horse-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	
	public int insertReservation(Connection conn, HorseReservation hrsv) {
		int result = 0;
		PreparedStatement pstmt  = null;
		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//5개 memNo, horse_pro_no, horse_date, hrose_time, rider_num/ message
			pstmt.setInt(1,hrsv.getMemNo());
			pstmt.setInt(2, Integer.parseInt(hrsv.getProgramNo()));
			pstmt.setString(3, hrsv.getHorseDate());
			pstmt.setInt(4, hrsv.getHorseTime());
			pstmt.setInt(5, hrsv.getRiderNum());
			pstmt.setString(6, hrsv.getMessage());
			
			result = pstmt.executeUpdate();
			System.out.println("업데이드 했을껄요????");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList dateCheck(Connection conn, String horseDate) {
		ArrayList list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("dateCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, horseDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(rset.getInt("HORSE_TIME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	public ArrayList<HorseReservation> selectRides(Connection conn, int memNo){
		ArrayList<HorseReservation> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRides");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HorseReservation hrsv = new HorseReservation();
				hrsv.setReservNo(rset.getInt("RESERVATION_NO"));
				hrsv.setMemNo(memNo);
				hrsv.setProgramNo(rset.getString("HORSE_PRO_NAME"));
				hrsv.setHorseDate(rset.getString("HORSE_DATE"));
				hrsv.setHorseTime(rset.getInt("HORSE_TIME"));
				hrsv.setRiderNum(rset.getInt("RIDER_NUM"));
				
				list.add(hrsv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}
	public ArrayList<HorseProgram> selectPrograms(Connection conn){
		ArrayList<HorseProgram> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPrograms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HorseProgram hpro = new HorseProgram(
						rset.getInt("HORSE_PRO_NO"),
						rset.getString("HORSE_PRO_NAME"),
						rset.getString("DESCRIPTION"),
						rset.getInt("PRICE")
						);
				list.add(hpro);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public HorseReservation selectRide(Connection conn, int reservNo) {
		HorseReservation selectedRsv = null;
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		String sql = prop.getProperty("selectRide");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reservNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				selectedRsv = new HorseReservation(
						rset.getInt("RESERVATION_NO"),
						rset.getInt("MEM_NO"),
						rset.getString("HORSE_PRO_NO"),
						rset.getString("HORSE_DATE"),
						rset.getInt("HORSE_TIME"),
						rset.getInt("RIDER_NUM"),
						rset.getString("MESSAGE")
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
		
		public int updateRide(Connection conn, HorseReservation horseRsv) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateRide");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(horseRsv.getProgramNo()));
				pstmt.setString(2, horseRsv.getHorseDate());
				pstmt.setInt(3, horseRsv.getHorseTime());
				pstmt.setInt(4, horseRsv.getRiderNum());
				pstmt.setString(5, horseRsv.getMessage());
				
				pstmt.setInt(6, horseRsv.getReservNo());
				pstmt.setInt(7, horseRsv.getMemNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		
		public int deleteRide(Connection conn, HorseReservation horseRsv) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteRide");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, horseRsv.getReservNo());
				pstmt.setInt(2, horseRsv.getMemNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	public int selectListCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		return count;
	}
		
}
