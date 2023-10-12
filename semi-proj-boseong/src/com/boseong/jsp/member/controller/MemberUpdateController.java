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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String area = request.getParameter("area");
		//String memNo = request.getParameter("memNo");
		String memId = request.getParameter("memId");
	
		String emailArr = "";
		if(email != null) {
			email = String.join(",", email);
		}
		
		Member m = new Member();
		m.setEmail(email);
		m.setPhone(phone);
		m.setArea(area);
		//m.setMemNo(memNo);
		m.setMemId(memId);
		
		int result = new MemberService().updateMember(m);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			Member updateMem = new MemberService().selectMember(memId);
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			
			
			
			
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원 정보 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
