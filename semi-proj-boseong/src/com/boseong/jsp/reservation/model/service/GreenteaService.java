package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;

import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.boseong.jsp.reservation.model.dao.GreenteaDao;
import com.boseong.jsp.reservation.model.vo.GreenteaReservation;
import com.boseong.jsp.reservation.model.vo.greenteaInfo;

public class GreenteaService {
	
	//이건왜하는겨?
	public GreenteaService() {}
	
	//추가하기.
	public int insertReserv(GreenteaReservation g) {
		
		Connection conn = getConnection();
		int result = new GreenteaDao().insertReserv(conn, g);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	
	
	
	
	//
	public ArrayList<greenteaInfo> selectService() {
		
		Connection conn = getConnection();
		
		ArrayList<greenteaInfo> list = new GreenteaDao().selectcourseNum(conn);
		
		close(conn);
		
		return list;
		
	}



	//예약. 녹차밭코스번호 받기.
	public ArrayList<GreenteaReservation> selectReservation(int memNo) {
		
		Connection conn = getConnection();
		
		ArrayList<GreenteaReservation> list = new GreenteaDao().selectReservation(conn, memNo);
		
		close(conn);
		
		return list;
	}

	
	
	//그린티예약 죽이는 거
	public int deleteGreentea(int reservationNo) {
		
		Connection conn = getConnection();
		
		int result = new GreenteaDao().deleteGreentea(conn, reservationNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
	
	

	
}

