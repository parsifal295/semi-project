package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.freeboard.model.service.FreeboardService;
import com.boseong.jsp.freeboard.model.vo.Freeboard;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeboardController {

  public String requestFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    ArrayList<Freeboard> list = null;
    // list = new FreeboardService().selectFboardList();
    int listCount; // 현재 일반게시글의 게시글 총 개수 => DB에서 총 게시글 개수 질의 count(*) / status='Y'
    int currentPage; // 현재 페이지 => request.getParameter("cpage")
    int pageLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개로 고정
    int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개로 고정
    int maxPage; // 총 페이지수
    int startPage; // 시작 페이지
    int endPage; // 끝 페이지

    // listcount는 DB에서 전체 자유게시판 글의 개수를 조회해야함. count로 DB 질의
    listCount = new FreeboardService().getListCount();
    System.out.println(listCount);
    String returnMe = "/views/freeboard/fboardListView.jsp";
    return returnMe;
  }
}
