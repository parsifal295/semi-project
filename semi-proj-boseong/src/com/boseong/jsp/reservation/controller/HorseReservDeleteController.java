package com.boseong.jsp.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.HorseService;
import com.boseong.jsp.reservation.model.vo.HorseReservation;

/**
 * Servlet implementation class HorseReservDeleteController
 */
@WebServlet("/delete.hs")
public class HorseReservDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseReservDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		HorseReservation horseRsv = new HorseReservation();
		horseRsv.setReservNo(reservNo);
		horseRsv.setMemNo(memNo);
		System.out.println(horseRsv);
		
		int result = new HorseService().deleteRide(horseRsv);
		if(result>0) {//예약 취소 성공
			request.getSession().setAttribute("alertMsg", "예약 취소 성공!");
			response.sendRedirect(request.getContextPath()+"/list.hs?memNo="+memNo);
		}else {//예약 취소 실패
			request.getSession().setAttribute("alertMsg", "승마 예약 취소 실패! 예약 정보를 확인하고 다시 시도해주세요.");
			response.sendRedirect(request.getContextPath());
			
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
