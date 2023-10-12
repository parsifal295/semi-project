package com.boseong.jsp.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.reservation.model.service.HanokService;
import com.boseong.jsp.reservation.model.vo.HanokReservation;
import com.boseong.jsp.reservation.model.vo.Room;

/**
 * Servlet implementation class HanokReservUpdateFormController
 */
@WebServlet("/updateForm.hk")
public class HanokReservUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HanokReservUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservNo = Integer.parseInt(request.getParameter("reservNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		HanokReservation hanokRsv = new HanokReservation();
		hanokRsv.setReservNo(reservNo);
		hanokRsv.setMemNo(memNo);
		HanokReservation selectedRsv = new HanokService().selectReservation(hanokRsv);
		if(selectedRsv == null) {
			request.getSession().setAttribute("alertMsg", "예약정보를 다시 확인해주세요.");
			response.sendRedirect(request.getContextPath()+"/list.hk?memNo="+memNo);
		}else {
		request.setAttribute("selectedRsv", selectedRsv);

		ArrayList<Room> list = new HanokService().selectRoomList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/reservation/hkUpdateForm.jsp").forward(request, response);
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
