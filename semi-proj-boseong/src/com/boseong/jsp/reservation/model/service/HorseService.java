package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.boseong.jsp.reservation.model.dao.HorseDao;
import com.boseong.jsp.reservation.model.vo.HorseReservation;

public class HorseService {
	
	public HorseService() {}
	
	public int insertReservation(HorseReservation hrsv) {
		Connection conn = getConnection();
		System.out.println("서비스 완료~ 커넥션 생겼어욤");
		int result = new HorseDao().insertReservation(conn, hrsv);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
