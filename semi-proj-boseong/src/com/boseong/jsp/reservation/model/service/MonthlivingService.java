package com.boseong.jsp.reservation.model.service;

import java.sql.Connection;

import static com.boseong.jsp.common.JDBCTemplate.close;

import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.*;

import java.util.ArrayList;
import java.util.Properties;



import com.boseong.jsp.reservation.model.dao.MonthlivingDao;
import com.boseong.jsp.reservation.model.vo.MonthlivingReservation;
import com.boseong.jsp.reservation.model.vo.Monthlivinginfo;

public class MonthlivingService {
	
	public MonthlivingService() {}

	

	//----------------
	public Monthlivinginfo selectMonthlivinginfo(int lodgeNo) {
		
		Connection conn = getConnection();
		
		Monthlivinginfo m = new MonthlivingDao().selectMonthlivinginfo(conn, lodgeNo);
		
		close(conn);
		
		return m;
	}


	//---------------
	public int insertReserv(MonthlivingReservation mr) {
		
		Connection conn = getConnection();
		int result = new MonthlivingDao().insertReserv(conn, mr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}


	//-------------------
	public ArrayList<Monthlivinginfo> selectMonthlivinginfoList(){
		Connection conn = getConnection();
		ArrayList<Monthlivinginfo> list = new MonthlivingDao().selectMonthlivinginfoList(conn);
		close(conn);
		return list;
	}


	//-------------------
		public ArrayList<MonthlivingReservation> selectReservation(int memNo){
		
		Connection conn = getConnection();
		
		ArrayList<MonthlivingReservation> list = new MonthlivingDao().selectReservation(conn, memNo);
		
		close(conn);
		
		return list;
		
		
		
	}



		public int deleteMonthliving(int reservationNo) {

			Connection conn = getConnection();
			int result = new MonthlivingDao().deleteMonthLiving(conn, reservationNo);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			
			return result;
		}
	
	
	

	
	

}
