package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.Attachment.model.service.AttachmentService;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.common.MyFileRenamePolicy;
import com.boseong.jsp.freeboard.model.service.FreeboardService;
import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.freeboard.model.vo.PageInfo;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import javax.rmi.CORBA.StubDelegate;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

public class FreeboardController {

  /**
   * @param request
   * @param response
   * @return String
   * @throws ServletException
   * @throws IOException
   */
  public String requestFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    int listCount; // 현재 일반게시글의 게시글 총 개수 => DB에서 총 게시글 개수 질의 count(*) / status='Y'
    int currentPage; // 현재 페이지 => request.getParameter("cpage")
    int pageLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개로 고정
    int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개로 고정
    int maxPage; // 총 페이지수
    int startPage; // 시작 페이지
    int endPage; // 끝 페이지

    // listcount는 DB에서 전체 자유게시판 글의 개수를 조회해야함. count로 DB 질의
    listCount = new FreeboardService().getListCount(); // 전체 게시글 개수
    currentPage = Integer.parseInt(request.getParameter("cpage"));
    pageLimit = 10;
    boardLimit = 10;
    maxPage = (int) Math.ceil((double) listCount / boardLimit);
    startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    endPage = startPage + pageLimit - 1;
    if (endPage > maxPage) {
      endPage = maxPage;
    }
    PageInfo pi =
        new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

    ArrayList<Freeboard> list = new FreeboardService().selectFboardList(pi); // 전체 게시글 객체
    request.setAttribute("list", list);
    request.setAttribute("pi", pi);
    return "/views/freeboard/fboardListView.jsp";
  }

  public String searchFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int listCount; // 현재 검색할 게시글 총 개수 => DB에서 검색결과 개수 회신
    int currentPage; // 현재 페이지 => request.getParameter("cpage")
    int pageLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개로 고정
    int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개로 고정
    int maxPage; // 총 페이지수
    int startPage; // 시작 페이지
    int endPage; // 끝 페이지
    String returnMe = "/views/freeboard/fboardSearchResultView.jsp";
    // 필요한 변수 뽑기
    // ** 검색조건 (제목+내용 or 작성자 or ip 주소) / 검색어 **
    String condition = request.getParameter("condition");
    String keyword = request.getParameter("conditionText");

    listCount = new FreeboardService().getSearchCount(condition, keyword);
    System.out.println(listCount);
    currentPage = Integer.parseInt(request.getParameter("cpage"));
    pageLimit = 10;
    boardLimit = 10;
    maxPage = (int) Math.ceil((double) listCount / boardLimit);
    startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    endPage = startPage + pageLimit - 1;
    if (endPage > maxPage) {
      endPage = maxPage;
    }
    PageInfo pi =
        new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
    ArrayList<Freeboard> list = new FreeboardService().getSearchResult(condition, keyword, pi);
    request.setAttribute("list", list);
    request.setAttribute("pi", pi);
    request.setAttribute("condition", condition);
    request.setAttribute("keyword", keyword);
    return returnMe;
  }

  public String insertFreeboardView(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    return "views/freeboard/fboardInsertView.jsp";
  }

  public String insertFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    String returnMe = "";
    // change encoding to UTF
    request.setCharacterEncoding("UTF-8");
    if (ServletFileUpload.isMultipartContent(request)) {
      int maxSize = 1024 * 1024 * 20;
      HttpSession session = request.getSession();
      ServletContext application = session.getServletContext();

      // assign file path
      String savePath = application.getRealPath("/resources/board_upfiles");

      // renaming uploaded file
      MultipartRequest multiRequest =
          new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

      // 1. 자유게시판 내용 => 무조건 업로드 되어야 함.
      Freeboard fb = new Freeboard();
      String ip = multiRequest.getParameter("ip");
      String writer = multiRequest.getParameter("nickname");
      String password = multiRequest.getParameter("password");
      String title = multiRequest.getParameter("title");
      String content = multiRequest.getParameter("content");
      fb.setWriter(writer);
      fb.setIpAddress(ip);
      fb.setPassword(password);
      fb.setTitle(title);
      fb.setContent(content);
      System.out.println(fb.toString());

      // 2. 첨부파일 => 선택적임. 업로드 안할수도 있다고 가정.
      Attachment att = null;

      // 3. 첨부파일 유무 파악
      if (multiRequest.getOriginalFileName("upfile") != null) {
        // 첨부파일이 있을 경우 =>
        att = new Attachment();
        att.setOriginName(multiRequest.getOriginalFileName("upfile"));

        // 파일 업로드 경로 지정
        att.setSavePath("resources/board_upfiles");

        // 수정된 파일명
        att.setModifiedName(multiRequest.getFilesystemName("upfile"));
      }

      // 4. 서비스 요청
      int result = new FreeboardService().insertBoard(fb, att);

      // 5. 응답 페이지 지정
      if (result > 0) {
        returnMe = request.getContextPath() + "/fboard.fb?cpage=1";
      } else {
        if (att != null) {
          new File(savePath + att.getModifiedName()).delete();
        }
      }
    }
    return returnMe;
  }

  public String detailViewFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    // 0. 게시글 번호 추출
    int boardNo = Integer.parseInt(request.getParameter("bno"));
    FreeboardService fService = new FreeboardService();
    // 1. 조회수 증가
    int result = fService.increaseCount(boardNo);

    // 2. 조회수 증가 후
    if (result > 0) {
      // Freeboard 테이블 조회
      Freeboard fb = fService.selectFreeboard(boardNo);
      // Attachment 조회
      Attachment att = fService.selectAttachment(boardNo);
      request.setAttribute("fb", fb);
      request.setAttribute("att", att);
    }
    return "views/freeboard/fboardDetailView.jsp";
  }

  public String updateFreeboardView(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    // post method
    request.setCharacterEncoding("UTF-8");
    FreeboardService fService = new FreeboardService();
    int boardNo = Integer.parseInt(request.getParameter("bno"));
    Freeboard fb = fService.selectFreeboard(boardNo);
    Attachment att = fService.selectAttachment(boardNo);
    request.setAttribute("fb", fb);
    if (att != null) {
      request.setAttribute("att", att);
    }
    return "views/freeboard/fboardUpdateView.jsp";
  }

  public String updateArticle(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.setCharacterEncoding("UTF-8");
    int boardNo = 0;
    if (ServletFileUpload.isMultipartContent(request)) {
      int maxSize = 1024 * 1024 * 20;
      String savePath =
          request.getSession().getServletContext().getRealPath("/resources/board_upfiles");

      // 전달된 파일명 수정후 서버에 업로드
      MultipartRequest multiRequest =
          new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

      // 객체 생성으로 파일은 업로드 완료됨.

      // 게시판 업데이트용 값 뽑기
      // 비밀번호, 제목, 내용
      FreeboardService fService = new FreeboardService();
      boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
      Freeboard fb = fService.selectFreeboard(boardNo);
      fb.setPassword(multiRequest.getParameter("password"));
      fb.setTitle(multiRequest.getParameter("title"));
      fb.setContent(multiRequest.getParameter("content"));

      // Attachment 객체 선언 -> 실제 첨부파일이 있을때만 instantiate 없으면 null
      Attachment att = null;
      if (multiRequest.getOriginalFileName("upfile") != null) {
        // 첨부가 새로 된 경우 : 첨부파일 테이블 추가를 위한 새 Attachment 객체 생성
        att = new Attachment();
        att.setOriginName(multiRequest.getOriginalFileName("upfile"));
        att.setModifiedName(multiRequest.getFilesystemName("upfile"));
        att.setSavePath("resources/board_upfiles");

        // 첨부파일이 있고 원본파일이 존재할 경우 (첨부파일 교체) => 원본파일번호 필요
        if (multiRequest.getParameter("originFileNo") != null) {
          // 기존의 파일번호를 att객체로 지정.
          att.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));

          // 기존 첨부파일 삭제
          new File(savePath + multiRequest.getParameter("originFileName")).delete();

          // 첨부된 파일은 있고 원본파일은 없는 경우
        } else {
          // 참조 게시글 번호 지정
          att.setRefNo(boardNo);
        }
      }
      int result = fService.updateArticle(fb, att);
    }
    return request.getContextPath() + "/detailView.fb?bno=" + boardNo;
  }

  public String deleteFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.setCharacterEncoding("UTF-8");
    int boardNo = Integer.parseInt(request.getParameter("bno"));
    // 첨부파일이 없는 경우 : 게시글만 지워주면 됨. => status = 'N'
    new FreeboardService().deleteFreeboard(boardNo);

    // 첨부파일이 있는 경우 : attachment 테이블에 refno 조회 후 결과값 확인되면 이 테이블의 데이터도 같이 지울것.
    if (new FreeboardService().selectAttachment(boardNo) != null) {
      new AttachmentService().deleteAttachment(boardNo, 10);
    }

    return request.getContextPath() + "/fboard.fb?cpage=1";
  }
}
