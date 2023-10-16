package com.boseong.jsp.notice.controller;

import com.boseong.jsp.notice.model.service.NoticeService;
import com.boseong.jsp.notice.model.vo.Notice;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class AjaxNoticeUpdateController */
@WebServlet("/update.no")
public class AjaxNoticeUpdateController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public AjaxNoticeUpdateController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int noticeNo = Integer.parseInt(request.getParameter("nno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    Notice n = new Notice();
    n.setNoticeTitle(title);
    n.setNoticeNo(noticeNo);
    n.setNoticeContent(content);
    // 내용
    new NoticeService().updateNotice(n);
    response.sendRedirect(request.getContextPath() + "/fboard.fb?cpage=1");
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
