package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.freeboard.model.vo.PageInfo;
import com.boseong.jsp.reservation.model.service.HanokService;
import com.boseong.jsp.reservation.model.vo.HanokReservation;

/**
 * Servlet implementation class HanokReservListController
 */
@WebServlet("/list.hk")
public class HanokReservListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HanokReservListController() {
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
			listCount = new HanokService().selectListCount(memNo);
			currentPage = (request.getParameter("cpage") == null)? 0 : Integer.parseInt(request.getParameter("cpage"));
			System.out.println(currentPage);
			pageLimit = 5;
			boardLimit = 8;
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			startPage = pageLimit *((currentPage-1)/pageLimit)+1;
			endPage = startPage+pageLimit-1;
			if(endPage>maxPage) {
				endPage = maxPage;
			}
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage,startPage, endPage);
		
			ArrayList<HanokReservation> rsvList = new HanokService().selectReservList(memNo, pi);

			request.setAttribute("rsvList", rsvList);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("views/reservation/hanokReservListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
