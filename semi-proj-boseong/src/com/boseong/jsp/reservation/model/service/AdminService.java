package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.boseong.jsp.reservation.model.dao.AdminDao;
import com.boseong.jsp.reservation.model.vo.GreenteaReservation;
import com.boseong.jsp.reservation.model.vo.HanokReservation;
import com.boseong.jsp.reservation.model.vo.HorseReservation;
import com.boseong.jsp.reservation.model.vo.MonthlivingReservation;

public class AdminService {
	public ArrayList countUpcoming() {
		Connection conn = getConnection();
		ArrayList list = new ArrayList();
		HorseReservation horseRsv = new AdminDao().countUpcomingRide(conn);
		HanokReservation hanokRsv = new AdminDao().countUpcomingStay(conn);
		MonthlivingReservation monthRsv = new AdminDao().countUpcomingMonth(conn);
		GreenteaReservation teaRsv = new AdminDao().countUpcomingTea(conn);
		list.add(horseRsv);
		list.add(teaRsv);
		list.add(hanokRsv);
		list.add(monthRsv);
		close(conn);
		return list;
	}


}
