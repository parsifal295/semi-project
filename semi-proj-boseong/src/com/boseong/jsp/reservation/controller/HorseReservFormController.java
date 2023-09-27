package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.vo.HorseReservation;

/**
 * Servlet implementation class HorseReservFormController
 */
@WebServlet("/insertRide.rsv")
public class HorseReservFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseReservFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String programNo = request.getParameter("programNo");
		Date horseDate = Date.valueOf(request.getParameter("horseDate"));
		int horseTime = Integer.parseInt(request.getParameter("horseTime"));
		int riderNum = Integer.parseInt(request.getParameter("riderNum"));
		int userNo = 1;//나중에 로그인 기능 만들어지고 나면 이것도 request에서 가져오기
		String message = request.getParameter("message");
		
		HorseReservation hrsv = new HorseReservation();
		hrsv.setMemNo(userNo);
		hrsv.setProgramNo(programNo);
		hrsv.setHorseDate(horseDate);
		hrsv.setHorseTime(horseTime);
		hrsv.setRiderNum(riderNum);
		hrsv.setMessage(message);
		
		
			
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
