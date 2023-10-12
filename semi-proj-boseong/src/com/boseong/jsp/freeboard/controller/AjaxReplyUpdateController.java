package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.freeboard.model.service.FreeboardService;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class AjaxReplyUpdateController */
@WebServlet("/replyupdate.fb")
public class AjaxReplyUpdateController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public AjaxReplyUpdateController() {
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
    int replyNo = Integer.parseInt(request.getParameter("replyNo"));
    ArrayList<FreeboardReply> list = new FreeboardService().selectReplyList(boardNo);
    Map<Integer, FreeboardReply> m = new HashMap<>();
    for (FreeboardReply reply : list) {
      m.put(reply.getReplyNo(), reply);
    }
    FreeboardReply fr = new FreeboardReply();
    fr = m.get(replyNo);
    System.out.println(fr);
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
