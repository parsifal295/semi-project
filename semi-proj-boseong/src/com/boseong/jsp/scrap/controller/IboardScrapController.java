package com.boseong.jsp.scrap.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		ArrayList<Scrap> list = new ScrapService().iboardScrapSelect(sc);
		System.out.println("Controller list : " + list);
		if(list != null && list.isEmpty()) {
			int insert = new ScrapService().iboardInsertScrap(sc);
			System.out.println("Controller insert : " + insert);
		}else {
			int update = new ScrapService().iboardScrapUpdate(sc);
			System.out.println("Controller update : "  + update);
		}

		
		
		
		
		
		
		JSONObject jObj = new JSONObject();
		jObj.put("scrap", scrap);
		jObj.put("boardNo", boardNo);
		jObj.put("memberNo", memberNo);
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
		// System.out.println("조건문 밖  : " + jObj);
		
		
		
//		try {
//		ArrayList<Scrap> sc = new ScrapService().iboardScrapSelect(jObj);
//		
//		System.out.println("Controller sc값 : "+sc);
//		
//		 if(sc.isEmpty()) {
//			 
//			 int insert = new ScrapService().iboardInsertScrap(jObj);
//				System.out.println("조건문 안  : " + jObj);
//				System.out.println("insert값 : " +insert);
//			 
//		 } else {
//			 
//			 int update = new ScrapService().iboardScrapUpdate(jObj);
//			 System.out.println("sc값이 널이 아닐 때 ┐");
//			 System.out.println("update : " + update);
//		 }
//		 
//		 } catch(NullPointerException e){
//			e.printStackTrace();
//		 }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
