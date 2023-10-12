package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boseong.jsp.member.model.vo.Member;
import com.boseong.jsp.reservation.model.service.GreenteaService;
import com.boseong.jsp.reservation.model.vo.GreenteaReservation;



/**
 * Servlet implementation class greenteareservlistcontroller
 */
@WebServlet("/green.li")
public class GreenTeaReservlistcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GreenTeaReservlistcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//여기 list관련 내용작성
		
		//HttpSession session = request.getSession();
		//Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memNo = 1;
		//int memNo = Integer.parseInt(request.getParameter("memNo")); //얘로바꿔야대는듯 .근데 얘가 말썽부리는디어캄
		System.out.println(memNo);
		//input태그의 name키
		
		
		
		
		
		//if(loginUser != null && loginUser.getMemNo().equals=="memNo") {
		ArrayList<GreenteaReservation> list = new GreenteaService().selectReservation(memNo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/reservation/GreenTeaReservListView.jsp").forward(request, response);
	}
	//}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
