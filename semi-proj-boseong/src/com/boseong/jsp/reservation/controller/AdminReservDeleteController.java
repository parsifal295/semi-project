package com.boseong.jsp.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.AdminService;

/**
 * Servlet implementation class AdminReservDeleteController
 */
@WebServlet("/delete.admin")
public class AdminReservDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReservDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		String reservType = request.getParameter("reservType");
		String key = "";
		switch(reservType) {
		case "승마장": key="deleteFromHorse"; break;
		case "녹차 체험" : key = "deleteFromTea"; break;
		case "한옥 스테이" : key = "deleteFromHanok"; break;
		case "한달 살기" : key = "deleteFromMonth"; break;
		}
		int result = new AdminService().deleteReservation(reservNo, key);
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "삭제 성공");
		}else {
			request.getSession().setAttribute("alertMsg", "삭제 실패");
		}
		response.sendRedirect(request.getContextPath()+"/adminHome.rsv");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
