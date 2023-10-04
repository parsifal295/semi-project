package com.boseong.jsp.member.model.service;

import java.sql.Connection;

import com.boseong.jsp.common.JDBCTemplate;

public class MemberService {
	
	public void loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		new MemberDao().loginMember(conn, userId, userPwd);
		
		
		
		
	}

}
