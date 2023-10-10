package com.boseong.jsp.itemboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.Attachment.model.service.AttachmentService;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.vo.PageInfo;
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
		
		request.setCharacterEncoding("UTF-8");
		
		// 해당 게시글 번호 값 뽑기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		// System.out.println("List에서 클릭했을때 보여지는 상세 뷰 boardNo값 : " + boardNo);
		
		ItemBoardService ibService = new ItemBoardService(); 
		// 조회수 올리기
		int count = ibService.ibIncreaseCount(boardNo);
		
		// count가 성공적으로 증가했다면
		if(count > 0) {
		// ib조회
		ItemBoard ib = ibService.iboardSelect(boardNo);
		// System.out.println("detail.ib에서 ib.get한 boardNo값 : "+ib.getBoardNo());
		// at조회
		int categoryNo = 20;
		Attachment at = new AttachmentService().selectAttachment(boardNo, categoryNo);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		request.setAttribute("ib", ib);
		request.setAttribute("at", at);
		request.setAttribute("currentPage", currentPage);
		// System.out.println(currentPage);
		// 요청처리후 detailView로 응답화면 지정
		request.getRequestDispatcher("views/itemboard/iboardDetailView.jsp").forward(request, response);
		// response.sendRedirect(request.getContextPath() + "/detail.ib?bno="+ ib.getBoardNo());
		
		}else {
			request.setAttribute("alertMsg", "게시글 조회에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/iboard.ib?cpage=1");
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
