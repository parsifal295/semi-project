package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.freeboard.model.service.FreeboardService;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class AjaxReplyUpdateController */
@WebServlet("/updateReply.fb")
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
    // 댓글수정 버튼클릭시 리디렉션 & 암호 검사(jsp)
    FreeboardReply fr = new FreeboardReply();
    int boardNo = Integer.parseInt(request.getParameter("bno"));
    int rNum = Integer.parseInt(request.getParameter("replyNo"));
    String reply = "";
    reply = request.getParameter("reply");
    fr.setReplyNo(rNum);
    fr.setContent(reply);
    new FreeboardService().updateReply(fr);
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
