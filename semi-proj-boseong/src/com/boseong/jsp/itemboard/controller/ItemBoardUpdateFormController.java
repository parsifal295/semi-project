package com.boseong.jsp.itemboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.boseong.jsp.Attachment.model.service.AttachmentService;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.common.MyFileRenamePolicy;
import com.boseong.jsp.itemboard.model.service.ItemBoardService;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ItemBoardUpdateFormController
 */
@WebServlet("/updateform.ib")
public class ItemBoardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBoardUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


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
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			// System.out.println("insertController memberNo : "+memberNo);
			ItemBoard ib = new ItemBoard();
			ib.setTitle(title);
			ib.setPrice(price);
			ib.setContent(content);
			ib.setMemberNo(memberNo);
			ib.setBoardNo(boardNo);
			
			// 새로운 첨부파일
			Attachment att = null;
			if(multiRequest.getOriginalFileName("reupfile") != null) {
				// 새로운 파일명이 존재한다면! 객체 생성 후 원본파일명, 수정된파일명, 파일 경로
				att = new Attachment();
				att.setOriginName(multiRequest.getOriginalFileName("reupfile"));
				att.setModifiedName(multiRequest.getFilesystemName("reupfile"));
				att.setSavePath("resources/board_upfiles");
				// ↑ 여기까지는 새롭게 업로드한 첨부파일에 관한 내용
				
				// 첨부파일이 있을 경우 + 원본파일이 있을 경우  → 원본 파일 번호 가 필요함
				if(multiRequest.getParameter("originFileNo") != null) {
			
					// 기존파일이 존재한다면 기존파일이 가지고있던 FileNo를 att에 담을 것
					att.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					System.out.println("originFileNo : " + att.getFileNo());
					// 파일이 업로드 되는것과 테이블은 상관이 없음 그냥 경로만 저장해서 나중에 불러올때 경로를 참조해 불러오기 위한 것임
					// 그러므로 resources에 있는 기존에 존재하던 첨부파일의 실제를 삭제해야함
					// *바뀐이름으로 resources에 저장되어있기 때문에 바뀐이름을 hidden으로 가지고 와서 삭제해야함 
					// 기존에 존재하는 파일 삭제 ↓
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				} else {
					
					// 새로운 첨부파일은 있는 데 기존파일이 없을 경우  → INSERT
					// 어떤 게시글의 첨부파일인지 (REF_BNO)확인 해야함
					att.setRefNo(boardNo);
				}
			}
			// 서비스 요청  
			int result = new ItemBoardService().iboardUpdate(ib, att);
			if(result > 0) {
				request.setAttribute("alertMsg", "게시글 수정에 성공하였습니다");
				response.sendRedirect(request.getContextPath() + "/detail.ib?bno=" + boardNo);
			} else {
				request.setAttribute("alertMsg", "게시글 수정에 실패하셨습니다");
				request.getRequestDispatcher("views/itemboard/iboardDetailView.jsp?bno=" + boardNo);
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
