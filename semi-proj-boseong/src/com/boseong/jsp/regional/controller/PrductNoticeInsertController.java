package com.boseong.jsp.regional.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.regional.model.service.ProductNoticeService;
import com.boseong.jsp.regional.model.vo.ProductNotice;

/**
 * Servlet implementation class PrductNoticeInsertController
 */
@WebServlet("/insert.pn")
public class PrductNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrductNoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("list", new ProductNoticeService().selectProductNoticeList());
		request.setCharacterEncoding("UTF-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		ProductNotice p = new ProductNotice();
		p.setNoticeTitle(noticeTitle);
		p.setNoticeContent(noticeContent);
		
		int result = new ProductNoticeService().insertProductNotice(p);
		
		if(result > 0) {
			request.getRequestDispatcher("views/regional/productnoticeListView.jsp").forward(request, response);
			
//			response.sendRedirect(request.getContextPath() + "/list.pn");
			
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
