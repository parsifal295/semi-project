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
 * Servlet implementation class HorseResevUpdateController
 */
@WebServlet("/update.hs")
public class HorseResevUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseResevUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		String programNo = request.getParameter("programNo");
		String horseDate = request.getParameter("horseDate");
		int horseTime = Integer.parseInt(request.getParameter("horseTime"));
		int riderNum = Integer.parseInt(request.getParameter("riderNum"));
		int memNo = Integer.parseInt(request.getParameter("userNo"));
		String message = request.getParameter("message");
		
		HorseReservation horseRsv = new HorseReservation();
		horseRsv.setReservNo(reservNo);
		horseRsv.setMemNo(memNo);
		horseRsv.setProgramNo(programNo);
		horseRsv.setHorseDate(horseDate);
		horseRsv.setHorseTime(horseTime);
		horseRsv.setRiderNum(riderNum);
		horseRsv.setMessage(message);
		
		int result = new HorseService().updateRide(horseRsv);
		if(result>0) {
			//request.getRequestDispatcher("/views/reservation/HorseReservListView.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/list.hs?memNo="+memNo);
		}else {
			request.getRequestDispatcher("views/reservation/HorseFrontView.jsp").forward(request, response);
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
