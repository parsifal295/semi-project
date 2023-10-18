package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.MonthlivingService;
import com.boseong.jsp.reservation.model.vo.MonthlivingReservation;
import com.boseong.jsp.reservation.model.vo.Monthlivinginfo;

/**
 * Servlet implementation class MonthLivingReservListController
 */
@WebServlet("/month.li")
public class MonthLivingReservListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthLivingReservListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		//int lodgeNo = Integer.parseInt(request.getParameter("lodgeNo"));
		
		ArrayList<MonthlivingReservation> list = new MonthlivingService().selectReservation(memNo);
		//ArrayList<Monthlivinginfo> list1 = new MonthlivingService().selectMonthlivinginfoList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/reservation/MonthLivingReservListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
