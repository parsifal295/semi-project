package com.boseong.jsp.gallery.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.boseong.jsp.common.MyFileRenamePolicy;
import com.boseong.jsp.gallery.model.service.GalleryService;
import com.boseong.jsp.gallery.model.vo.Gallery;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class GalleryEnrollFormController
 */
@WebServlet("/insert.gy")
public class GalleryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryInsertController() {
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
			
			String link = multiRequest.getParameter("link");
			
			Gallery gy = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				gy = new Gallery();
				
				gy.setOriginName(multiRequest.getOriginalFileName("upfile"));
				gy.setSavePath("resources/board_upfiles");
				gy.setModifiedName(multiRequest.getFilesystemName("upfile"));
			} 
			int categoryNo = 20;
			
			int insert = new GalleryService().insertGallery(gy, link);
			if(insert > 0) {
				request.getSession().setAttribute("alertMsg", "갤러리 등록을 성공하였습니다!");
				response.sendRedirect(request.getContextPath() + "/gallery.gy");
			}else {
				request.setAttribute("alertMsg", "갤러리 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/gallery/GalleryListView.jsp").forward(request, response);
				
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
