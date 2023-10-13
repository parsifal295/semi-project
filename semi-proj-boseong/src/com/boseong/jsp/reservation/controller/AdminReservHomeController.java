package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.AdminService;

/**
 * Servlet implementation class AdminReservHomeController
 */
@WebServlet("/adminHome.rsv")
public class AdminReservHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReservHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메뉴바에서 예약관리 선택시 화면 넘겨주는 컨트롤러
		//응답화면 지정 전에 각 예약 종류 별 다가오는 예약 숫자 보여주기
		HashMap counts = new AdminService().countUpcoming();
		System.out.println(counts.keySet());
		System.out.println(counts.values());
		
		request.setAttribute("hanokCount", (int) counts.get("hanok"));
		request.setAttribute("horseCount", (int) counts.get("horse"));
		request.setAttribute("teaCount", (int) counts.get("tea"));
		request.setAttribute("monthCount", (int) counts.get("month"));
		
		request.getRequestDispatcher("views/reservation/AdminView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
