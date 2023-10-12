package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.GreenteaService;

/**
 * Servlet implementation class GreenTeaReservDeleteController
 */
@WebServlet("/green.de")
public class GreenTeaReservDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GreenTeaReservDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		//현재 로그인한 회원의 정보
		//회원정보 = 회원아이디(memNo, MEM_NO), number가져오기
		int reservationNo = Integer.parseInt(request.getParameter("nno"));
	
		int result = new GreenteaService().deleteGreentea(reservationNo);
		System.out.println(reservationNo);
		
		if(result > 0) {
			System.out.println(result);
			request.getSession().setAttribute("alertMsg", "예약 취소되었습니다.");					
			response.sendRedirect(request.getContextPath() + "/green.li");
			
		}else {
			System.out.println(result);
			request.getSession().setAttribute("alertMsg", "예약 취소 실패하였습니다.");
			request.getRequestDispatcher("views/reservation/GreenTeaReservListView.jsp").forward(request, response);
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
