package com.boseong.jsp.notice.controller;

import com.boseong.jsp.notice.model.service.NoticeService;
import com.boseong.jsp.notice.model.vo.Notice;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeController {
  public String selectNotice(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int noticeNo = Integer.parseInt(request.getParameter("nno"));
    Notice n = new NoticeService().selectNotice(noticeNo);
    request.setAttribute("n", n);
    return "/views/notice/noticeDetailView.jsp";
  }

  public String updateView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
    Notice n = new Notice();
    n.setNoticeTitle(title);
    n.setNoticeNo(noticeNo);
    n.setNoticeContent(content);
    request.setAttribute("n", n);
    return "views/notice/noticeUpdateView.jsp";
  }

  public String updateNotice(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
    Notice n = new Notice();
    n.setNoticeTitle(title);
    n.setNoticeNo(noticeNo);
    n.setNoticeContent(content);
    new NoticeService().updateNotice(n);

    return request.getContextPath() + "/fboard.fb?cpage=1";
  }

  public String deleteNotice(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int noticeNo = Integer.parseInt(request.getParameter("nno"));
    new NoticeService().deleteNotice(noticeNo);
    return "";
  }
}
