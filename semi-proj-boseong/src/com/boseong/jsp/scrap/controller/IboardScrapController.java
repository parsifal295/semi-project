package com.boseong.jsp.scrap.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.boseong.jsp.scrap.model.service.ScrapService;
import com.boseong.jsp.scrap.model.vo.Scrap;

/**
 * Servlet implementation class IboardScrapController
 */
@WebServlet("/scrap.ib")
public class IboardScrapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IboardScrapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String scrap = request.getParameter("status");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		Scrap sc = new Scrap();
		sc.setStatus(scrap);
		sc.setBoardNo(boardNo);
		sc.setMemberNo(memberNo);

		JSONObject jObj = new JSONObject();
		int scrapNo = 0;
		String status = "";
		System.out.println("1scrap : " + scrap);
		ArrayList<Scrap> list = new ArrayList();
		if(scrap.equals("D")) {
			status = "D";
		}else if(scrap.equals("Y")) {
			list = new ScrapService().iboardScrapSelect(sc);
				scrapNo = new ScrapService().iboardInsertScrap(sc);
				status = "Y";
		}else {
			scrapNo = new ScrapService().iboardScrapUpdate(sc);
			status = "N";
		}
		
		System.out.println("2status : " + status);
		jObj.put("boardNo", boardNo);
		jObj.put("memberNo", memberNo);
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
