package com.boseong.jsp.scrap.controller;

import com.boseong.jsp.itemboard.model.service.ItemBoardService;
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
    // response.setContentType("application/json; charset=UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    // 스크랩 버튼 클릭여부 반환값. 널 핸들링 필요
    String scrapStatus = request.getParameter("status");
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    int memberNo = Integer.parseInt(request.getParameter("memberNo"));

    Scrap scrapToFind = new Scrap();
    scrapToFind.setBoardNo(boardNo);
    scrapToFind.setMemberNo(memberNo);

    Scrap scrapToInsert = new Scrap();
    scrapToInsert.setBoardNo(boardNo);
    scrapToInsert.setMemberNo(memberNo);

    // 게시글 번호 & 유저번호로 스크랩 여부 조회
    Scrap scrapResult = new ScrapService().iboardScrapSelect(scrapToFind);

    // 스크랩 여부 저장
    String status = scrapResult.getStatus();

    // 스크랩 버튼 활성화 되었을 때..
    if (scrapStatus.equals("Y")) {
      scrapToInsert.setStatus("Y");
      // case 1: 스크랩된적이 없는 경우
      // 조회결과값이 null (스크랩 된 적이 없음) && 스크랩버튼 클릭시
      if ((scrapResult == null)) {
        new ScrapService().iboardInsertScrap(scrapToInsert);
        // case 2: 스크랩된적이 있으나 현재는 스크랩 상태가 아닌 경우
      } else if ((scrapResult != null) && status.equals("N")) {
        System.out.println("case2 : " + status);
        new ScrapService().iboardScrapUpdate(scrapToInsert);
        // case 3: 스크랩된 상태
      } else if ((scrapResult != null && status.equals("Y"))) {
        System.out.println("case3 : " + status);
        // 스크랩 버튼 활성화
        scrapStatus = "Y";
      }
    }

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
