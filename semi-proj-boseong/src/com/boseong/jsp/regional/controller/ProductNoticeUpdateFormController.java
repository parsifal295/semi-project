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
 * Servlet implementation class ProductNoticeUpdateFormController
 */
@WebServlet("/update.pn")
public class ProductNoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductNoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
	
		ProductNotice p = new ProductNotice();
		p.setNoticeNo(noticeNo);
		p.setNoticeTitle(noticeTitle);
		p.setNoticeContent(noticeContent);
		
		int result = new ProductNoticeService().updateNotice(p);
		
		if(result > 0) {	
			response.sendRedirect(request.getContextPath() + "/detail.pn?nno=" + noticeNo);
		} else {
			request.getRequestDispatcher("views/regional/ProductnoticeDetailController.jsp").forward(request, response);
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
