package com.boseong.jsp.itemboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.Attachment.model.service.AttachmentService;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.itemboard.model.service.ItemBoardService;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;

/**
 * Servlet implementation class ItemBoardUpdateController
 */
@WebServlet("/update.ib")
public class ItemBoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int categoryNo = 20;
		ItemBoard ib = new ItemBoardService().iboardSelect(boardNo);
		Attachment at = new AttachmentService().selectAttachment(boardNo, categoryNo);
		if(ib != null && at != null) {
			request.setAttribute("ib", ib);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/itemboard/iboardUpdateForm.jsp").forward(request, response);
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
