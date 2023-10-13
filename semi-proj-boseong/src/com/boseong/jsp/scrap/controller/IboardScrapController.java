package com.boseong.jsp.scrap.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		// VIEW 에서 클릭시 Y(활성화) / N(비활성화) 
		String scrap = request.getParameter("status"); 

		// 게시글 번호 / 멤버 번호
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		// 스크랩 객체 생성
		Scrap sc = new Scrap();
		sc.setStatus(scrap);
		sc.setBoardNo(boardNo);
		sc.setMemberNo(memberNo);

		
		JSONObject jObj = new JSONObject();

		int scrapNo = 0;
		String status = "";
		
		// 스크랩 전체 목록을 map (Key: Scrap No , Value: Scrap obj) 에 저장
		ArrayList<Scrap> list = new ScrapService().iboardScrapSelect(sc);
//		Map<Integer, Scrap> map = new HashMap<>();
//		for(Scrap sc : list) {
//			map.put(sc.getScrapNo(), sc);
//		}
		
		if (list.isEmpty() && list != null){
			// list가 비어있다면 insert
			scrapNo = new ScrapService().iboardInsertScrap(sc);
			if(sc.getStatus() == null) {
				status = "scrap";
			} else {
				status = "scrapted";
			}
		}else{
			// list에 값이 있다면 update
			scrapNo = new ScrapService().iboardScrapUpdate(sc);	
			if(sc.getStatus() == null) {
				status = "scrap";
			}else {
				status = "scrapted";
			}
		}
		

		System.out.println("Status : " + status);
		
		jObj.put("status", status);
		jObj.put("boardNo", boardNo);
		jObj.put("memberNo", memberNo);
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
