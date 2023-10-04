package com.boseong.jsp.member.model.service;

import java.sql.Connection;

import com.boseong.jsp.common.JDBCTemplate;
import com.boseong.jsp.member.model.dao.MemberDao;

public class MemberService {
	
	public void loginMember(String memId, String memPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		new MemberDao();//.loginMember(conn, userId, userPwd);
		
		
		
		
	}

}






