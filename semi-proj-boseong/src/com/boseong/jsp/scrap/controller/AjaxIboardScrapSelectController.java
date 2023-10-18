package com.boseong.jsp.scrap.controller;

import com.boseong.jsp.scrap.model.service.ScrapService;
import com.boseong.jsp.scrap.model.vo.Scrap;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class AjaxIboardScrapSelectController */
@WebServlet("/scrapselect.ib")
public class AjaxIboardScrapSelectController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public AjaxIboardScrapSelectController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    // response.setContentType("application/json; charset=UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    int memberNo = Integer.parseInt(request.getParameter("memberNo"));
    String status = "";
    Scrap s = new Scrap();
    s.setBoardNo(boardNo);
    s.setMemberNo(memberNo);
    Scrap result = new ScrapService().iboardScrapSelect(s);
    status = result.getStatus();
    response.getWriter().print(status);
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
