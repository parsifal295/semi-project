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
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Member loginUser =((Member)session.getAttribute("loginUser"));
		
		int memNo = loginUser.getMemNo();
		String memId = loginUser.getMemId();
		int num = Integer.parseInt(request.getParameter("memNo"));
		
		String memPwd = request.getParameter("memPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		int result = new MemberService().updatePwdMember(memNo, memPwd, updatePwd);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다.");
			Member updateMem = new MemberService().selectMember(memId);
			session.setAttribute("loginUser", updateMem);
			//System.out.println("ㅡㅡ");
		} else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 다시 확인해주세요.");
			//System.out.println("ㅡㅡ^");
		}
		
		response.sendRedirect(request.getContextPath() + "/myPage.me");
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
