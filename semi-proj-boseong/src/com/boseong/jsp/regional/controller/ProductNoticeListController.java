package com.boseong.jsp.regional.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.regional.model.service.ProductNoticeService;
import com.boseong.jsp.regional.model.vo.ProductNotice;

/**
 * Servlet implementation class ProductNoticeListController
 */
@WebServlet("/list.pn")
public class ProductNoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductNoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1)인코딩
		
		// 2) 값 뽑기
		
		// 3) 가공
		// 4) Service단으로 SELECT요청
		// 공지사항 목록 => 가져올 행의 개수 : 최소 0개 => List
		ArrayList<ProductNotice> list = new ProductNoticeService().selectProductNoticeList();
		request.setAttribute("list", list);
		
		// 5) 응답화면 띄우기
		RequestDispatcher view = request.getRequestDispatcher("/views/regional/productnoticeListView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
