package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.boseong.jsp.reservation.model.dao.AdminDao;
import com.boseong.jsp.reservation.model.vo.AdminReservation;

public class AdminService {
	public HashMap countUpcoming() {
		Connection conn = getConnection();
		HashMap counts = new AdminDao().countUpcoming(conn);
		close(conn);		
		return counts;
	}
	public ArrayList<AdminReservation> selectList(String type){
		Connection conn= getConnection();
		ArrayList<AdminReservation> list = null;
		switch(type) {
		case "승마장": list = new AdminDao().selectRides(conn); break;
		case "녹차 체험" : break;
		case "한옥 스테이" : break;
		case "한달 살기" : break;
		}
		close(conn);
		return list;
	}


}
