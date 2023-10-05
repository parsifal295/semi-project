package com.boseong.jsp.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.boseong.jsp.reservation.model.vo.Room;
import static com.boseong.jsp.common.JDBCTemplate.*;

public class HanokDao {
	private Properties prop = new Properties();
	public HanokDao() {
		String fileName = HanokDao.class.getResource("/sql/reservation/hanok-mapper.xml").getPath();		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
		}
	}
	
	public ArrayList<Room> selectRoomList(Connection conn){
		ArrayList<Room> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRoomList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Room r = new Room(
						rset.getInt("ROOM_NO"),
						rset.getString("ROOM_TYPE"),
						rset.getInt("BASE_NUM"),
						rset.getInt("MAX_NUM"),
						rset.getInt("PRICE"),
						rset.getInt("EXTRA_PRICE")
						);
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
}
