package com.boseong.jsp.regional.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.regional.model.service.ProductNoticeService;
import com.boseong.jsp.regional.model.vo.ProductNotice;

/**
 * Servlet implementation class ProductnoticeDetail
 */
@WebServlet("/detail.pn")
public class ProductnoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductnoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		//System.out.println(noticeNo);
		int result = new ProductNoticeService().increaseCount(noticeNo);
			
			ProductNotice p = new ProductNoticeService().selectProductNotice(noticeNo);
			request.setAttribute("p", p);
			
			request.getRequestDispatcher("views/regional/productnoticeDetailView.jsp").forward(request, response);
//			System.out.println(result);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
