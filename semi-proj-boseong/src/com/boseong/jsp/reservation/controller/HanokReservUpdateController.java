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
 * Servlet implementation class HanokReservUpdateController
 */
@WebServlet("/updateHanok.rsv")
public class HanokReservUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HanokReservUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		int roomNo = Integer.parseInt(request.getParameter("roomType"));
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		int clientNum = Integer.parseInt(request.getParameter("clientNum"));
		String message = request.getParameter("message");
		
		HanokReservation hanokRsv = new HanokReservation(
				reservNo,roomNo, userNo, fromDate, toDate, clientNum, message);
		
		int result = new HanokService().updateReservation(hanokRsv);
		if(result>0) {//새로운 예약 추가 성공
			request.getSession().setAttribute("alertMsg", "예약변경에 성공하였습니다.");
			response.sendRedirect(request.getContextPath()+"/list.hk?cpage=1&memNo="+userNo);
		}else {//예약 실패
			request.getSession().setAttribute("alertMsg", "예약변경 실패ㅜㅜ");
			response.sendRedirect(request.getContextPath()+"/list.hk?cpage=1&memNo="+userNo);
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
