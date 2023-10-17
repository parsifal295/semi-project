package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.MonthlivingService;
import com.boseong.jsp.reservation.model.vo.Monthlivinginfo;

/**
 * Servlet implementation class MonthLivingDetailController
 */
@WebServlet("/month.de")
public class MonthLivingDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthLivingDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//확인완료
		int lodgeNo = Integer.parseInt(request.getParameter("lodgeNo"));
		//System.out.println(lodgeNo);
		
		Monthlivinginfo m = new MonthlivingService().selectMonthlivinginfo(lodgeNo);
		//System.out.println(m);
		request.setAttribute("Monthlivinginfo", m);
		request.setAttribute("lodgeNo",lodgeNo);
		
		request.getRequestDispatcher("views/reservation/MonthLivingDetailView.jsp").forward(request, response);
		
	
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
