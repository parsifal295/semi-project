package com.boseong.jsp.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.boseong.jsp.common.JDBCTemplate.close;

import com.boseong.jsp.reservation.model.vo.GreenteaReservation;
import com.boseong.jsp.reservation.model.vo.greenteaInfo;


public class GreenteaDao {
	
		/* prop*/
		private Properties prop = new Properties();
		
		public GreenteaDao() {
			String fileName = GreenteaDao.class.getResource("/sql/reservation/greentea-mapper.xml").getPath();
			
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		
		
		//insertReserv 예약넣기 
		public int insertReserv(Connection conn, GreenteaReservation g) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertReserv");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				// memNo startDate courseNum  bookNum
				pstmt.setInt(1,  g.getMemNo());
				pstmt.setString(2,  g.getStartDate());
				pstmt.setString(3, g.getCourseNum());
				pstmt.setInt(4,  g.getBookNum());
				
				result = pstmt.executeUpdate();
				
				//System.out.println(result);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}



	
	
	
	//select
		public ArrayList<greenteaInfo> selectcourseNum(Connection conn) {
				
				ArrayList<greenteaInfo> list = new ArrayList();
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectCourseNum");
				
				
				try {
					pstmt = conn.prepareStatement(sql);
					rset = pstmt.executeQuery();
				
					while(rset.next()) {
						greenteaInfo g = new greenteaInfo();
						
						g.setCourseNum(rset.getString("COURSE_NUM"));
						g.setInfoDesc(rset.getString("INFO_DESC"));
						g.setPrice(rset.getInt("PRICE"));
						
						list.add(g);
					}
						
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(rset);
						close(pstmt);
					}
					return list;
		}
	
		
	



	public ArrayList<GreenteaReservation> selectReservation(Connection conn, int memNo) {
		ArrayList<GreenteaReservation> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReservation");
		//selectReservation으로 고치기 (selectCourseNum이엇던 것)
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				GreenteaReservation gr = new GreenteaReservation();
				
				gr.setReservationNo(rset.getInt("RESERVATION_NO"));
				gr.setMemNo(memNo);
				gr.setStartDate(rset.getString("START_DATE"));
				gr.setCourseNum(rset.getString("COURSE_NUM"));
				gr.setBookNum(rset.getInt("BOOK_NUM"));
				
				list.add(gr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	public int deleteGreentea(Connection conn, int reservationNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReserv");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  reservationNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}