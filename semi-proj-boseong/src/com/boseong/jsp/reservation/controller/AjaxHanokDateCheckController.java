package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.HanokService;
import com.boseong.jsp.reservation.model.vo.HanokReservation;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxHanokDateCheckController
 */
@WebServlet("/datecheck.hk")
public class AjaxHanokDateCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHanokDateCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String fromDate = request.getParameter("fromDate");
		
		HanokReservation hanokRsv = new HanokReservation();
		hanokRsv.setRoomNo(roomNo);
		hanokRsv.setFromDate(fromDate);
		
		ArrayList list = new HanokService().checkDate(hanokRsv);
		response.setContentType("application/json; charset=UTF-8");
		Gson gsn = new Gson();
		gsn.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
