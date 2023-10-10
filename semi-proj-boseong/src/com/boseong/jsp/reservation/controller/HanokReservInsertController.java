package com.boseong.jsp.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.HanokService;
import com.boseong.jsp.reservation.model.vo.HanokReservation;

/**
 * Servlet implementation class HanokReservInsertController
 */
@WebServlet("/insertHanok.rsv")
public class HanokReservInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HanokReservInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int roomNo = Integer.parseInt(request.getParameter("roomType"));
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		int clientNum = Integer.parseInt(request.getParameter("clientNum"));
		String message = request.getParameter("message");
		
		HanokReservation hanokRsv = new HanokReservation(
				roomNo, userNo, fromDate, toDate, clientNum, message);
		
		int result = new HanokService().insertReservation(hanokRsv);
		if(result>0) {//새로운 예약 추가 성공
			request.getSession().setAttribute("alertMsg", "한옥 스테이 예약 성공!");
			response.sendRedirect(request.getContextPath()+"/hanok.rsv");
		}else {//예약 실패
			request.getSession().setAttribute("alertMsg", "한옥 스테이 예약 실패");
			request.getRequestDispatcher("views/reservation/hanokReservForm");
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
