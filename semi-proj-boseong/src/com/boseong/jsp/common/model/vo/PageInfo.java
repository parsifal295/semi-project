package com.boseong.jsp.common.model.vo;

public class PageInfo {
  private int listCount; // 현재 일반게시글의 게시글 총 개수 => DB에서 총 게시글 개수 질의 count(*) / status='Y'
  private int currentPage; // 현재 페이지 => request.getParameter("cpage")
  private int pageLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개로 고정
  private int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개로 고정
  private int maxPage; // 총 페이지수
  private int startPage; // 시작 페이지
  private int endPage; // 끝 페이지

  public PageInfo() {}

  public PageInfo(
      int listCount,
      int currentPage,
      int pageLimit,
      int boardLimit,
      int maxPage,
      int startPage,
      int endPage) {
    this.listCount = listCount;
    this.currentPage = currentPage;
    this.pageLimit = pageLimit;
    this.boardLimit = boardLimit;
    this.maxPage = maxPage;
    this.startPage = startPage;
    this.endPage = endPage;
  }

  public int getListCount() {
    return this.listCount;
  }

  public void setListCount(int listCount) {
    this.listCount = listCount;
  }

  public int getCurrentPage() {
    return this.currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public int getPageLimit() {
    return this.pageLimit;
  }

  public void setPageLimit(int pageLimit) {
    this.pageLimit = pageLimit;
  }

  public int getBoardLimit() {
    return this.boardLimit;
  }

  public void setBoardLimit(int boardLimit) {
    this.boardLimit = boardLimit;
  }

  public int getMaxPage() {
    return this.maxPage;
  }

  public void setMaxPage(int maxPage) {
    this.maxPage = maxPage;
  }

  public int getStartPage() {
    return this.startPage;
  }

  public void setStartPage(int startPage) {
    this.startPage = startPage;
  }

  public int getEndPage() {
    return this.endPage;
  }

  public void setEndPage(int endPage) {
    this.endPage = endPage;
  }

  @Override
  public String toString() {
    return "{"
        + " listCount='"
        + getListCount()
        + "'"
        + ", currentPage='"
        + getCurrentPage()
        + "'"
        + ", pageLimit='"
        + getPageLimit()
        + "'"
        + ", boardLimit='"
        + getBoardLimit()
        + "'"
        + ", maxPage='"
        + getMaxPage()
        + "'"
        + ", startPage='"
        + getStartPage()
        + "'"
        + ", endPage='"
        + getEndPage()
        + "'"
        + "}";
  }
}
