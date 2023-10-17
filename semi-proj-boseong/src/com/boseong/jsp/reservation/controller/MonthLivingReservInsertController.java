package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.MonthlivingService;
import com.boseong.jsp.reservation.model.vo.MonthlivingReservation;

/**
 * Servlet implementation class MonthLivingReservInsertController
 */
@WebServlet("/month.in")
public class MonthLivingReservInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthLivingReservInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//request.getRequestDispatcher("/views/reservation/MonthLivingReservForm.jsp").forward(request, response);
	
		/*
		 * 	private int memNo;
			private int lodgeNo;
			
			private String startDate;
			
			private int peopleNum;
		 */
		
		//나중에 수정 필요
		int memNo = 1;
		int lodgeNo = Integer.parseInt(request.getParameter("lodgeNo"));
		String startDate = request.getParameter("startDate");
		int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
		
		
		MonthlivingReservation mr = new MonthlivingReservation(
				memNo, lodgeNo, startDate, peopleNum
				);
		
		
		int result = new MonthlivingService().insertReserv(mr);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "한달살이 예약 성공");
			response.sendRedirect(request.getContextPath()+ "/month.li?memNo=" + memNo);
		} else {
			request.getSession().setAttribute("alertMsg", "한달살이 예약 실패");
			request.getRequestDispatcher("/views/reservation/MonthLivingReservForm.jsp").forward(request, response);
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
