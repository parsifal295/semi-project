package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.freeboard.model.vo.PageInfo;
import com.boseong.jsp.reservation.model.service.HorseService;
import com.boseong.jsp.reservation.model.vo.HorseReservation;

/**
 * Servlet implementation class HorseReservListController
 */
@WebServlet("/list.hs")
public class HorseReservListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseReservListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		//listCount = new HorseService().selectListCount(memNo);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		listCount = new HorseService().selectListCount(memNo);
		pageLimit=5;
		boardLimit = 2;
		
		startPage = pageLimit*((currentPage-1)/pageLimit)+1;
		maxPage = (int)(Math.ceil((double)listCount/boardLimit));
		
		//Integer.parseInt(request.getParameter("memNo"));
		endPage = startPage + pageLimit-1;
		if(endPage > maxPage) {
			endPage=maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage,startPage,endPage);
		System.out.println(pi);
		ArrayList<HorseReservation> list = new HorseService().selectRides(memNo, pi);
		
		for(HorseReservation hr:list) {
			System.out.println(hr);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/reservation/HorseReservListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
