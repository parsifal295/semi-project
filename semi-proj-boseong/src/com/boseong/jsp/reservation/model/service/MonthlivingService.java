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

	

	
	
	
	public Monthlivinginfo selectMonthlivinginfo(int lodgeNo) {
		
		Connection conn = getConnection();
		
		Monthlivinginfo m = new MonthlivingDao().selectMonthlivinginfo(conn, lodgeNo);
		
		close(conn);
		
		return m;
	}






	public int insertReserv(MonthlivingReservation mr) {
		// TODO Auto-generated method stub
		return 0;
	}






	
	
	/*
	
	public ArrayList<Monthlivinginfo> selectMonthlivinginfo(){
		
		Connection conn = getConnection();
		ArrayList <Monthlivinginfo> list  = new MonthlivingDao().selectMonthlivinginfo(conn, 0);
		
		close(conn);
		
		return list;	
	}
	*/
	
	

}
