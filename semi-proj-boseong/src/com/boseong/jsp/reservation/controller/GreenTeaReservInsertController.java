package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.GreenteaService;
import com.boseong.jsp.reservation.model.vo.GreenteaReservation;

/**
 * Servlet implementation class GreenteaInsertController
 */
@WebServlet("/green.in")
public class GreenTeaReservInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GreenTeaReservInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//나중에 수정필요->수정완료(10/12)
		//int memNo = 1;
		int memNo = Integer.parseInt(request.getParameter("memNo")); 
		String startDate = request.getParameter("startDate");
		String courseNum = request.getParameter("courseNum");
		int bookNum = Integer.parseInt(request.getParameter("bookNum")); 
		

		GreenteaReservation g = new GreenteaReservation();
		g.setMemNo(memNo);
		g.setStartDate(startDate);
		g.setCourseNum(courseNum);
		g.setBookNum(bookNum);
		
		
		int result = new GreenteaService().insertReserv(g);
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/green.li?memNo=" + memNo);	
		}else {
			request.getRequestDispatcher("/views/reservation/GreenteaReservationView.jsp").forward(request, response);
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
