package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.boseong.jsp.reservation.model.service.HorseService;

/**
 * Servlet implementation class HorseDateCheck
 */
@WebServlet("/datecheck.hs")
public class HorseDateCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseDateCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String horseDate = request.getParameter("horseDate");
		System.out.println(horseDate);
		ArrayList list = new HorseService().dateCheck(horseDate);

		//한글 포함될 일 없음
		response.setContentType("application/json; charset=UTF-8");
		JSONArray jArr = new JSONArray();
		for(int i = 0; i<list.size(); i++) {
			jArr.add(list.get(i));
		}
		response.getWriter().print(jArr);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
