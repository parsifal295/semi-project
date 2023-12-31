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
 * Servlet implementation class HorseReservUpdateController
 */
@WebServlet("/updateForm.hs")
public class HorseReservUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorseReservUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		HorseReservation selectedRsv = new HorseService().selectRide(reservNo);
		System.out.println(selectedRsv);
		request.setAttribute("selectedRsv", selectedRsv);
		request.setAttribute("cpage", cpage);
		
		request.getRequestDispatcher("views/reservation/HrsUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
