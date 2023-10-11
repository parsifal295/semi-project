package com.boseong.jsp.itemboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.common.MyFileRenamePolicy;
import com.boseong.jsp.itemboard.model.service.ItemBoardService;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ItemBoardInsertController
 */
@WebServlet("/insert.ib")
public class ItemBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 + 사진이 첨부되어있기 때문에 인코딩을 해준다
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 첨부파일 용량 제한
			int maxSize = 1024*1024*10;
			
			// Session으로 부터 파일의 경로를 알아냄
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/board_upfiles");
			
			// MultipartRequest생성으로 파일이름을 수정 하면서 업로드 가능!!!
			MultipartRequest multiRequest = 
					new MultipartRequest(request,savePath,maxSize,"UTF-8", new MyFileRenamePolicy());
			
			// 생성한 multipartRequest로 부터 값을 뽑는다
			String title = multiRequest.getParameter("title");
			// type = text로 했기 에  pardseInt해주기
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String content = multiRequest.getParameter("content");
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			// System.out.println("insertController memberNo : "+memberNo);
			ItemBoard ib = new ItemBoard();
			ib.setTitle(title);
			ib.setPrice(price);
			ib.setContent(content);
			ib.setMemberNo(memberNo);
			
			
			Attachment att = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				att = new Attachment();
				
				att.setOriginName(multiRequest.getOriginalFileName("upfile"));
				att.setSavePath("resources/board_upfiles");
				att.setModifiedName(multiRequest.getFilesystemName("upfile"));
			} 
			int categoryNo = 20;
			
			int boardNo = new ItemBoardService().insertBoard(ib, att, categoryNo);
			// System.out.println("(intsert.ib)ib.get으로 꺼낸 boardNo값 : "+ib.getBoardNo());
			// System.out.println("(insert.in)insert하고 바로 detail상세뷰로 보여지기 위한 boardNo값 : "+ boardNo);
			if(boardNo > 0) {
				// System.out.println(boardNo);
				request.getSession().setAttribute("alertMsg", "게시글 등록을 성공하였습니다!");
				response.sendRedirect(request.getContextPath() + "/detail.ib?bno="+ boardNo);
			}else {
				request.setAttribute("alertMsg", "게시물 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/itemboard/iboardListView.jsp").forward(request, response);
				
			}
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
