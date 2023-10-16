package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.AdminService;
import com.boseong.jsp.reservation.model.vo.AdminReservation;
import com.google.gson.Gson;

/**
 * Servlet implementation class AdminSearchReservController
 */
@WebServlet("/search.rsv")
public class AdminSearchReservController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchReservController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String searchType = request.getParameter("searchType");
		String searchKey = request.getParameter("searchKey");
		System.out.println(searchType);
		System.out.println(searchKey);
		response.setContentType("application/json; charset=UTF-8");
		Gson gsn = new Gson();
		if(searchType.equals("no")) {
			AdminReservation selectedRsv = new AdminService().selectReservation(Integer.parseInt(searchKey));
			System.out.println(selectedRsv);
			gsn.toJson(selectedRsv, response.getWriter());		
		}else {
			ArrayList<AdminReservation> list = new AdminService().selectById(searchKey);
			System.out.println(list);
			gsn.toJson(list,response.getWriter());
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
