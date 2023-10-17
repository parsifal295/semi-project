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

import static com.boseong.jsp.common.JDBCTemplate.*;

import com.boseong.jsp.reservation.model.vo.Monthlivinginfo;
import com.boseong.jsp.reservation.model.vo.MonthlivingReservation;


public class MonthlivingDao {
	
	//mapper
	private Properties prop = new Properties();
	
	public MonthlivingDao() {
		String filePath = MonthlivingDao.class.getResource("/sql/reservation/monthliving-mapper.xml").getPath();
				
				try {
					prop.loadFromXML(new FileInputStream(filePath));
				} catch (IOException e) {
					e.printStackTrace();
					}
				}
	
	
	
	
	
	
	
	public Monthlivinginfo selectMonthlivinginfo(Connection conn, int lodgeNo) {
		
		Monthlivinginfo m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMonthlivinginfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lodgeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Monthlivinginfo(
						rset.getInt("LODGE_NO"),
						rset.getString("LODGE_NAME"),
						rset.getString("LODGE_LOCATION"),
						rset.getInt("PRICE"),
						rset.getString("LODGE_INFO")
				
					);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}







	public int insertReserv(Connection conn, MonthlivingReservation mr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReserv");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/*memNo
			lodgeNo
			startDate
			peopleNum */
			pstmt.setInt(1,  mr.getMemNo());
			pstmt.setInt(2,  mr.getLodgeNo());
			pstmt.setString(3,  mr.getStartDate());
			pstmt.setInt(4,  mr.getPeopleNum());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}






	//얘 안쓰는거같음
	public ArrayList<Monthlivinginfo> selectMonthlivinginfoList(Connection conn) {
		
		ArrayList<Monthlivinginfo> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMonthlivinginfoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Monthlivinginfo mi = new Monthlivinginfo();
				/*
				 * LODGE_NO
					LODGE_NAME
					LODGE_LOCATION
					PRICE
					LODGE_INFO
				 */
				mi.setLodgeNo(rset.getInt("LODGE_NO"));
				mi.setLodgeName(rset.getString("LODGE_NAME"));
				mi.setLodgeLocation(rset.getString("LODGE_PRICE"));
				
				
				list.add(mi);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	







	public ArrayList<MonthlivingReservation> selectReservation(Connection conn, int memNo) {
		ArrayList<MonthlivingReservation> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MonthlivingReservation mr = new MonthlivingReservation() ;
				
				
				/*
				 * private int reservationNo;
					private int memNo;
					private int lodgeNo;
					private String startDate;
					private int peopleNum;
					
				 */
				mr.setReservationNo(rset.getInt("RESERVATION_NO"));
				mr.setMemNo(memNo);
				
				mr.setLodgeNo(rset.getInt("LODGE_NO"));
				mr.setStartDate(rset.getString("START_DATE"));
				mr.setPeopleNum(rset.getInt("PEOPLE_NUM"));
				
				list.add(mr);
				
				
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
