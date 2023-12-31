package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.freeboard.model.vo.PageInfo;
import com.boseong.jsp.reservation.model.service.AdminService;
import com.boseong.jsp.reservation.model.vo.AdminReservation;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxReservListController
 */
@WebServlet("/getList.rsv")
public class AjaxReservListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReservListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");		
		String key = "";
		switch(type) {
		case "승마장": key="selectRides"; break;
		case "녹차 체험" : key ="selectTea"; break;
		case "한옥 스테이" : key ="selectHanok"; break;
		case "한달 살기" : key ="selectMonth"; break;
		}
		ArrayList<AdminReservation> list = 	new AdminService().selectList(key);
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
