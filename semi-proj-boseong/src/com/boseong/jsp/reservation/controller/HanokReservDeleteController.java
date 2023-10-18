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
 * Servlet implementation class HanokReservDeleteController
 */
@WebServlet("/delete.hk")
public class HanokReservDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HanokReservDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		
		HanokReservation hanokRsv = new HanokReservation();
		hanokRsv.setReservNo(reservNo);
		hanokRsv.setMemNo(memNo);
		
		int result = new HanokService().deleteReservation(hanokRsv);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "예약 취소가 정상적으로 신청되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "한옥 예약이 취소되지 않았습니다ㅜ");
		}
		response.sendRedirect(request.getContextPath()+"/list.hk?memNo="+memNo+"&cpage="+cpage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
