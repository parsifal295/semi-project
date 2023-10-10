package com.boseong.jsp.itemboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.itemboard.model.service.ItemBoardService;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;

/**
 * Servlet implementation class ItemBoardDetailController
 */
@WebServlet("/detail.ib")
public class ItemBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 게시글 번호 값 뽑기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		ItemBoardService ibService = new ItemBoardService(); 
		// 조회수 올리기
		int count = ibService.ibIncreaseCount(boardNo);
		
		// count가 성공적으로 증가했다면
		if(count > 0) {
		// ib조회
		ItemBoard ib = ibService.iboardSelect(boardNo);
		// at조회
		Attachment at = ibService.attchmentSelect(boardNo);
		
		request.setAttribute("ib", ib);
		request.setAttribute("at", at);
		// 요청처리후 detailView로 응답화면 지정
		request.getRequestDispatcher("views/itemboard/iboardDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("alertMsg", "게시글 조회에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/iboard.ib");
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
