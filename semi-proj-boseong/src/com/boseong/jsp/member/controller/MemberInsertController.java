package com.boseong.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boseong.jsp.member.model.service.MemberService;
import com.boseong.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memName = request.getParameter("memName");
		String email = request.getParameter("email"); // 빈문자열 가능
		String phone = request.getParameter("phone");
		String area = request.getParameter("area");
		
		Member m = new Member();
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		m.setMemName(memName);
		m.setEmail(email);
		m.setPhone(phone);
		m.setArea(area);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) { // 성공 => 메인으로 돌려보내기 sendRedirect
			HttpSession session = request.getSession();
			//session.setAttribute("alertMsg", "회원가입성공");
			response.sendRedirect(request.getContextPath());
		} else { // 실패 => 실패 알림창
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입에 실패했습니다. 다시 입력해주세요.");
			response.sendRedirect(request.getContextPath());
		}
		
		
		
		
		
	
	
		
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
