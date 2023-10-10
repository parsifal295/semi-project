package com.boseong.jsp.member.model.service;

import java.sql.Connection;

import com.boseong.jsp.common.JDBCTemplate;
import com.boseong.jsp.member.model.dao.MemberDao;
import com.boseong.jsp.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memId, String memPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, memId, memPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	public void insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		new MemberDao().insertMember(conn, m);
	}


	
}







