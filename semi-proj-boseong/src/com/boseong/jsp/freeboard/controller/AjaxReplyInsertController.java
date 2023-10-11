package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.freeboard.model.service.FreeboardService;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class AjaxReplyInsertController */
@WebServlet("/replyinsert.fb")
public class AjaxReplyInsertController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public AjaxReplyInsertController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int boardNo = Integer.parseInt(request.getParameter("bno"));
    String content = request.getParameter("content");
    String writer = request.getParameter("id");
    String ipAddr = request.getParameter("ip");
    String password = request.getParameter("pw");
    FreeboardReply fr = new FreeboardReply();
    fr.setRefNo(boardNo);
    fr.setPassword(password);
    fr.setWriter(writer);
    fr.setContent(content);
    fr.setIpAddress(ipAddr);
    System.out.println(fr);
    int result = new FreeboardService().insertReply(fr);
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
