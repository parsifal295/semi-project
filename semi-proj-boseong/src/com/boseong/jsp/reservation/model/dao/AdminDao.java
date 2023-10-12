package com.boseong.jsp.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.boseong.jsp.reservation.model.vo.GreenteaReservation;
import com.boseong.jsp.reservation.model.vo.HanokReservation;
import com.boseong.jsp.reservation.model.vo.HorseReservation;
import com.boseong.jsp.reservation.model.vo.MonthlivingReservation;

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
	
	public HorseReservation countUpcomingRide(Connection conn) {
		HorseReservation horseRsv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countUpcomingRide");

		
		
		return horseRsv;
	}
	public HanokReservation countUpcomingStay(Connection conn) {
		HanokReservation hanokRsv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countUpcomingRide");
		
		
		
		return hanokRsv;
	}
	public MonthlivingReservation countUpcomingMonth(Connection conn) {
		MonthlivingReservation monthRsv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countUpcomingRide");
		
		
		
		return monthRsv;
	}
	public GreenteaReservation countUpcomingTea(Connection conn) {
		GreenteaReservation teaRsv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countUpcomingRide");
		
		
		
		return teaRsv;
	}

}
