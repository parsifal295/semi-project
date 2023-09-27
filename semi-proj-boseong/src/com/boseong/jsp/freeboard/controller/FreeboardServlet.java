package com.boseong.jsp.freeboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class FreeboardServlet */
@WebServlet("*.fb")
public class FreeboardServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public FreeboardServlet() {
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
      case "fboard.fb":
        view = new FreeboardController().requestFreeboard(request, response);
        flag = false;
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