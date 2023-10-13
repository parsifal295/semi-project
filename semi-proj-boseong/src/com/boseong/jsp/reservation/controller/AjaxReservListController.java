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
//		
//		int listCount;
//		int currentPage = Integer.parseInt(request.getParameter("cpage"));
//		int pageLimit;
//		int boardLimit;
//		int maxPage;
//		int startPage;
//		int endPage;
//		pageLimit = 7;
//		boardLimit = 3;
//		
//		listCount = new AdminService().selectListCount(type);
//		maxPage = (int)Math.ceil((double)listCount/boardLimit);
//		startPage = pageLimit*((currentPage-1)/pageLimit)+1;
//		endPage = startPage + pageLimit-1;
//		
//		if(endPage>maxPage) {
//			endPage=maxPage;
//		}
//		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage, startPage, endPage);
//		
		ArrayList<AdminReservation> list = 	new AdminService().selectList(type);
		
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
