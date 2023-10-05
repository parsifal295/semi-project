package com.boseong.jsp.itemboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.itemboard.model.service.ItemBoardService;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;

/**
 * Servlet implementation class ItemBoardListController
 */
@WebServlet("/iboard.ib")
public class ItemBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리를 위한 필요한 변수들
		int listCount;    // 게시글의 총 개수
		int currentPage;  // 현재 페이지(사용자가 요청한 페이지)
		int pageLimit;    // 페이징바의 최대 개수 (10개로 지정)
		int boardLimit;   // 페이지에 보여질 게시글의 최대 개수(10개로 지정)
		int maxPage;      // 가장 마지막 페이지의 몇번째의 페이지 인지(총 페이지의 개수)
		int startPage;    // 페이징바의 시작 수
		int endPage;      // 페에징바의 끝 수
		
		// COUNT(*)게시글의 총 개수
		listCount = new ItemBoardService().selectListCount();
		
		// 현재 cpage(key)=value의 값 뽑기
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// 페이징바의 최대 개수 = 10
		pageLimit = 10;
		// 페이지에 보여질 게시글의 최대 개수 = 10
		boardLimit = 10;
		
		// 가장 마지막 페이지가 몇번째 페이지인지   계산 예)┐	
		// 총 개수 (listCount)             boardLimit(10개)           maxPage(마지막페이지)
		//     100 개                       ÷            10개                                 =       10   10페이지
		//     107개                        ÷            10개                                 =       10.7 11페이지
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// 페이징바의 시작 수
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
				
		// 페이징바의 끝 수
		endPage = startPage / pageLimit + 1;
		
	//	ArrayList<ItemBoard> list = new ItemBoardService().selectList(boardNo);	
		
		
		
		
		
		
		
		
		request.getRequestDispatcher("views/itemboard/iboardListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
