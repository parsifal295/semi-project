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

    String scrap = request.getParameter("status");
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    int memberNo = Integer.parseInt(request.getParameter("memberNo"));

    Scrap scrapToFind = new Scrap();
    scrapToFind.setStatus(scrap);
    scrapToFind.setBoardNo(boardNo);
    scrapToFind.setMemberNo(memberNo);

    // scrapNo 로 받은 값을 String status로 바꿔서 반환해줌
    int scrapNo = 0;
    String status = "";
    Scrap scrapResult = new ScrapService().iboardScrapSelect(scrapToFind);

    if (list != null && !list.isEmpty()) {
      scrapNo = new ScrapService().iboardScrapUpdate(sc);
      if (scrapNo == 1) {
        status = "Y";
      } else {
        status = "D";
      }
      System.out.println("list == null  : " + status);
    } else {
      scrapNo = new ScrapService().iboardInsertScrap(sc);
      if (scrapNo == 1) {
        status = "Y";
      } else {
        status = "N";
      }
    }
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
