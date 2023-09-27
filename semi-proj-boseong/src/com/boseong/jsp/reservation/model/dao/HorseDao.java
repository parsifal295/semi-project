package com.boseong.jsp.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.boseong.jsp.common.JDBCTemplate.*;
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
}
