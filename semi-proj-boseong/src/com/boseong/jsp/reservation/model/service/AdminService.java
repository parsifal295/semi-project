package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;

import com.boseong.jsp.reservation.model.dao.AdminDao;

public class AdminService {
	public HashMap countUpcoming() {
		Connection conn = getConnection();
		HashMap counts = new AdminDao().countUpcoming(conn);
		close(conn);		
		return counts;
	}


}
