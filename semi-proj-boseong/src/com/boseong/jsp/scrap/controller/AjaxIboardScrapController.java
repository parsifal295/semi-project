package com.boseong.jsp.scrap.controller;

import com.boseong.jsp.scrap.model.service.ScrapService;
import com.boseong.jsp.scrap.model.vo.Scrap;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/** Servlet implementation class IboardScrapSelectController */
@WebServlet("/scrapselect.ib")
public class AjaxIboardScrapController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public AjaxIboardScrapController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("application/json; charset=UTF-8");

    // 스크랩 버튼 클릭여부 반환값. 널 핸들링 필요
    String scrapStatus = request.getParameter("status");
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    int memberNo = Integer.parseInt(request.getParameter("memberNo"));

    Scrap scrapToFind = new Scrap();
    scrapToFind.setBoardNo(boardNo);
    scrapToFind.setMemberNo(memberNo);

    // 게시글 번호 & 유저번호로 스크랩 여부 조회
    Scrap scrapResult = new ScrapService().iboardScrapSelect(scrapToFind);

    // 스크랩 여부 저장
    String status = scrapResult.getStatus();

    // 조회결과값이 null (스크랩 된 적이 없음) && 스크랩버튼 클릭시
    if ((scrapResult == null) && scrapStatus == "Y") {}

    System.out.println("Controller insert Scrap : " + status);

    JSONObject jObj = new JSONObject();
    jObj.put("status", status);
    jObj.put("boardNo", boardNo);
    jObj.put("memberNo", memberNo);
    response.getWriter().print(jObj);
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
