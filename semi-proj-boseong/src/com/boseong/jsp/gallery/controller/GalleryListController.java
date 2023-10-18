package com.boseong.jsp.gallery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boseong.jsp.gallery.model.service.GalleryService;
import com.boseong.jsp.gallery.model.vo.Gallery;

/**
 * Servlet implementation class GalleryListController
 */
@WebServlet("/gallery.gy")
public class GalleryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Gallery> list = new GalleryService().selectList();
		
		request.setAttribute("list", list);
		
		if(list.isEmpty() && list == null) {
			request.setAttribute("alertMsg", "갤러리에 사진이 없습니다.");
			request.getRequestDispatcher(request.getContextPath());
		} else {
			request.setAttribute("alertMsg", "사진업로드 성공!");
			request.getRequestDispatcher("views/gallery/galleryListView.jsp").forward(request, response);
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
