package com.boseong.jsp.notice.controller;

import com.boseong.jsp.notice.model.service.NoticeService;
import com.boseong.jsp.notice.model.vo.Notice;
import java.io.IOException;
import java.util.ArrayList;
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
}
