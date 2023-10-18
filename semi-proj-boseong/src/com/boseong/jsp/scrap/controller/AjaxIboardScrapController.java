package com.boseong.jsp.scrap.controller;

import com.boseong.jsp.scrap.model.service.ScrapService;
import com.boseong.jsp.scrap.model.vo.Scrap;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet implementation class IboardScrapSelectController */
@WebServlet("/scrap.ib")
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

    String pageStatus = request.getParameter("status"); // 페이지에서 스크랩 버튼이 눌렸는지 안눌렸는지 판별 
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));  // 스크랩 게시판 조회용 
    int memberNo = Integer.parseInt(request.getParameter("memberNo")); // 스크랩 게시판 조회용 

    // 조회용 객체 
    Scrap scrapToFind = new Scrap();
    scrapToFind.setBoardNo(boardNo);
    scrapToFind.setMemberNo(memberNo);

    // 추가용 객체 
    Scrap scrapToInsert = new Scrap();
    scrapToInsert.setBoardNo(boardNo);
    scrapToInsert.setMemberNo(memberNo);

    // 게시글 번호 & 유저번호로 스크랩 여부 조회
    Scrap scrapResult = new ScrapService().iboardScrapSelect(scrapToFind);

    // 스크랩 여부 저장
    String status = "N";
    if (scrapResult != null) {
      status = scrapResult.getStatus();
    }

    //  스크랩 함
    if (pageStatus.equals("Y")) {
    	System.out.println("스크랩 Y " + pageStatus);
      scrapToInsert.setStatus("Y");
      // case 1: 스크랩된적이 없는 경우
      // 조회결과값이 null (스크랩 된 적이 없음) && 스크랩버튼 클릭시
      if (scrapResult == null) {
        new ScrapService().iboardInsertScrap(scrapToInsert);
        System.out.println("없던거 Y 처리 , 추가함 ");
        // case 2: 스크랩된적이 있으나 현재는 스크랩 상태가 아닌 경우
      } else if (status.equals("N")) {
        new ScrapService().iboardScrapUpdate(scrapToInsert);
        System.out.println("N이었던거 Y 처리함  ");
      }
      // 스크랩 안함 
    } else if (pageStatus.equals("N")) {
      System.out.println("스크랩 X " + pageStatus);
      scrapToInsert.setStatus("N");
      new ScrapService().iboardScrapUpdate(scrapToInsert);
      System.out.println("Y였던거 N 처리" );
    }
//    System.out.println(status);
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
