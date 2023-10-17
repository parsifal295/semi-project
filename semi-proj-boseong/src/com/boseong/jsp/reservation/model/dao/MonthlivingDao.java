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
				/*m = new Monthlivinginfo();
				m.setLodgeNo(rset.getInt("LODGE_NO"));
				m.setLodgeName(rset.getString("LODGE_NAME"));
				m.setLodgeLocation(rset.getString("LODGE_LOCATION"));
				m.setPrice(rset.getInt("PRICE"));
				m.setLodgeInfo(rset.getString("LODGE_INFO"));	
				*/
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	
	
	/*
	public ArrayList<Monthlivinginfo> selectMonthlivinginfoList(Connection conn){
		ArrayList<Monthlivinginfo> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMonthlivinginfoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Monthlivinginfo m = new Monthlivinginfo();
				m.setLodgeNo(rset.getInt("LODGE_NO"));
				m.setLodgeName(rset.getString("LODGE_NAME"));
				m.setLodgeLocation(rset.getString("LODGE_LOCATION"));
				m.setPrice(rset.getInt("PRICE"));
				m.setLodgeInfo(rset.getString("LODGE_INFO"));
				list.add(m);
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
	*/
	
	
	
	
}
