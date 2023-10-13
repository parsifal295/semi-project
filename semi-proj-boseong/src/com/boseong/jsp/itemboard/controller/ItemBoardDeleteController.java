package com.boseong.jsp.itemboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.Attachment.model.service.AttachmentService;
import com.boseong.jsp.itemboard.model.service.ItemBoardService;

/**
 * Servlet implementation class ItemBoardDeleteController
 */
@WebServlet("/delete.ib")
public class ItemBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		// Attachment table을 다른 게시판이랑 같이 사용하기에 categoryNo를 초기화해줌
		int categoryNo = 20;
		// board DELET는 status → UPDATE status 'N'
		int result1 = new ItemBoardService().iboardDelete(boardNo);
		int result2 = new AttachmentService().deleteAttachment(boardNo, categoryNo);
		
		if((result1 * result2) > 0) {
			response.sendRedirect(request.getContextPath() + "/iboard.ib?cpage=1");
		} else {
			request.setAttribute("alertMsg", "게시글 삭제 실패하였습니다.");
			request.getRequestDispatcher("views/itemboard/iboardDetailView.jsp?bno=" + boardNo);
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
