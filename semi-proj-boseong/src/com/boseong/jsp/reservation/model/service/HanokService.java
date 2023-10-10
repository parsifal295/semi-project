package com.boseong.jsp.reservation.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.boseong.jsp.reservation.model.dao.HanokDao;
import com.boseong.jsp.reservation.model.vo.HanokReservation;
import com.boseong.jsp.reservation.model.vo.Room;

public class HanokService {
	public HanokService() {}
	
	public ArrayList<Room> selectRoomList(){
		Connection conn = getConnection();
		ArrayList<Room> list = new HanokDao().selectRoomList(conn);
		close(conn);
		return list;
	}
	public Room getRoomLimit(int roomNo) {
		Connection conn = getConnection();
		Room r = new HanokDao().getRoomLimit(conn, roomNo);
		close(conn);
		return r;
	}
	public ArrayList checkDate(HanokReservation hanokRsv) {
		Connection conn = getConnection();
		ArrayList list = new HanokDao().checkDate(conn, hanokRsv);
		close(conn);
		return list;
	}
}
