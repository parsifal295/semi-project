package com.boseong.jsp.member.controller;

import com.boseong.jsp.member.model.service.MemberService;
import com.boseong.jsp.member.model.vo.Member;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** Servlet implementation class LoginController */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public LoginController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    // System.out.println(request.getParameter("memId"));
    // System.out.println(request.getParameter("memPwd"));

    String memId = request.getParameter("memId");
    String memPwd = request.getParameter("memPwd");

    Member loginUser = new MemberService().loginMember(memId, memPwd);

    //System.out.println(loginUser);
    
    // 로그인 실패
    if(loginUser == null) {
    	HttpSession session = request.getSession();
    	session.setAttribute("alertMsg", "잘못된 아이디 또는 비밀번호입니다.");
    	RequestDispatcher view = request.getRequestDispatcher("index.jsp");
    	view.forward(request, response);
    	//session.setAttribute("alertMsg", "로그인실패");
    	//System.out.println("test");
		
	} else { // 로그인 성공
		
		HttpSession session = request.getSession();
		
		session.setAttribute("loginUser", loginUser);
		
		//session.setAttribute("alertMsg", "로그인성공");
		
		// index.jsp로 응답 -포워딩 방식
		RequestDispatcher view = request.getRequestDispatcher("index.jsp");
		
		view.forward(request, response);
		
	}

    
    
    
  }

/**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }
}
