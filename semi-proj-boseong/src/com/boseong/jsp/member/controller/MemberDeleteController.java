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
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //public String getParameter(String val) {
    	
    	
    
    //}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		
		String memPwd = request.getParameter("memPwd");
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int result = new MemberService().deleteMember(memNo, memPwd);
		
		if(result > 0) {
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
			session.setAttribute("alertMsg", "탈퇴가 완료되었습니다.");
			System.out.println("탈퇴완");
		} else {
			session.setAttribute("alertMsg", "회원탈퇴에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			//System.out.println("탈퇴ㄴㄴ");
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
