package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.MonthlivingService;

/**
 * Servlet implementation class MonthLivingReservDeleteControlelr
 */
@WebServlet("/month.del")
public class MonthLivingReservDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthLivingReservDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		int reservationNo = Integer.parseInt(request.getParameter("nno"));
		
		int result = new MonthlivingService().deleteMonthliving(reservationNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "예약 취소되었습니다.");					
			response.sendRedirect(request.getContextPath() + "/month.main");
		} else {
			request.getSession().setAttribute("alertMsg", "예약 취소 실패하였습니다.");request.getRequestDispatcher("views/reservation/MonthLivingReservListView.jsp").forward(request, response);
			request.getRequestDispatcher("views/reservation/MonthLivingReservListView.jsp").forward(request, response);
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
