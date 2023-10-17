package com.boseong.jsp.notice.controller;

import com.boseong.jsp.freeboard.controller.FreeboardController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class NoticeServlet */
@WebServlet("*.no")
public class NoticeServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public NoticeServlet() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String mapping = request.getRequestURI();
    String uri = mapping.substring(mapping.lastIndexOf("/") + 1);
    String view = "";
    boolean flag = true;
    switch (uri) {
      case "noticeView.no":
        flag = false;
        view = new NoticeController().selectNotice(request, response);
        break;
    }

    if (flag) {
      response.sendRedirect(view);
    } else {
      request.getRequestDispatcher(view).forward(request, response);
    }
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }
}
