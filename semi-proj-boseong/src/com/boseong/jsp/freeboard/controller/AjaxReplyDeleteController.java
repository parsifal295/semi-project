package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.freeboard.model.service.FreeboardService;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class AjaxReplyDeleteController */
@WebServlet("/deleteReply.fb")
public class AjaxReplyDeleteController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public AjaxReplyDeleteController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");

    // 게시글 번호, 유저가 입력한 비밀번호, 댓글번호
    int boardNo = Integer.parseInt(request.getParameter("bno"));
    String userPass = request.getParameter("usrPass");
    int rNum = Integer.parseInt(request.getParameter("rNum"));

    // 댓글 전체목록 map에 넣고 댓글번호로 비밀번호 조회 (비교 용도)
    // 이유 : 댓글 객체 한개 조회용 코드치기가 싫었음
    // K : 댓글 번호 , V : Reply 객체
    ArrayList<FreeboardReply> list = new ArrayList<>();
    list = new FreeboardService().selectReplyList(boardNo);
    Map<Integer, FreeboardReply> map = new HashMap<>();
    for (FreeboardReply reply : list) {
      map.put(reply.getReplyNo(), reply);
    }
    // 댓글 번호로 검색한 객체의 암호와 유저의 암호가 일치하면 삭제 진행
    if (map.get(rNum).getPassword().equals(userPass)) {
      // 댓글 게시판 번호 넘김
      new FreeboardService().deleteReply(rNum);
      // ajax injection
      response.setContentType("text/html; charset=UTF-8");
      // 암호 일치시 1 넘기면 jsp에서 정상적으로 삭제 되었다고 alert창 띄우는 용도
      response.getWriter().print("1");
    }
    // request.getContextPath() + "/detailView.fb?bno=" + boardNo;
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
