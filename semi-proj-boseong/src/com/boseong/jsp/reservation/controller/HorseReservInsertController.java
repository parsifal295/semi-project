package com.boseong.jsp.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.HorseService;
import com.boseong.jsp.reservation.model.vo.HorseReservation;

/**
 * Servlet implementation class HorseReservInsertController
 */
@WebServlet("/insertRide.rsv")
public class HorseReservInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseReservInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String programNo = request.getParameter("programNo");
		String horseDate = request.getParameter("horseDate");
		int horseTime = Integer.parseInt(request.getParameter("horseTime"));
		int riderNum = Integer.parseInt(request.getParameter("riderNum"));
		//회원이름, 전화번호는 아직 넣을 수 없음
		int memNo = 1;//임시
		String message = request.getParameter("message");
		
		HorseReservation hrsv = new HorseReservation();
		hrsv.setMemNo(memNo);
		hrsv.setProgramNo(programNo);
		hrsv.setHorseDate(horseDate);
		hrsv.setHorseTime(horseTime);
		hrsv.setRiderNum(riderNum);
		hrsv.setMessage(message);
		
		int result = new HorseService().insertReservation(hrsv);
		if(result>0) {
			request.getRequestDispatcher("/views/reservation/HorseReservListView.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("views/reservation/horseReservationForm.jsp").forward(request, response);
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
