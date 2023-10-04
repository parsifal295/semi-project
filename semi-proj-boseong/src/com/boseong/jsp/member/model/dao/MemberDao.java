package com.boseong.jsp.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		//System.out.println(file);
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void loginMember(Connection conn, String memId, String memPwd) {
		
		
	}

}


