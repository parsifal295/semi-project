package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.boseong.jsp.freeboard.model.vo.PageInfo;
import com.boseong.jsp.reservation.model.dao.AdminDao;
import com.boseong.jsp.reservation.model.vo.AdminReservation;

public class AdminService {
	public HashMap countUpcoming() {
		Connection conn = getConnection();
		HashMap counts = new AdminDao().countUpcoming(conn);
		close(conn);		
		return counts;
	}
	public ArrayList<AdminReservation> selectList(String key){
		Connection conn= getConnection();
		ArrayList<AdminReservation> list = new AdminDao().selectList(conn, key);
		close(conn);
		return list;
	}

	public AdminReservation selectReservation(int searchKey) {
		Connection conn = getConnection();
		AdminReservation selectedRsv = new AdminDao().selectReservation(conn, searchKey);
		close(conn);
		return selectedRsv;
	}
	public ArrayList<AdminReservation> selectById(String searchKey){
		Connection conn = getConnection();
		ArrayList<AdminReservation> list = new AdminDao().selectById(conn, searchKey);
		close(conn);
		return list;
	}


}
