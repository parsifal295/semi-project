package com.boseong.jsp.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import static com.boseong.jsp.common.JDBCTemplate.*;

public class AdminDao {
	private Properties prop = new Properties();
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/reservation/admin-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public HashMap countUpcoming(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap counts = new HashMap();
		String sql = prop.getProperty("countUpcoming");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				counts.put(rset.getString("TYPE"), rset.getInt("COUNT"));
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return counts;
	}

}
