package com.boseong.jsp.notice.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;

import com.boseong.jsp.notice.model.dao.NoticeDao;
import com.boseong.jsp.notice.model.vo.Notice;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeService {
  public ArrayList<Notice> selectNoticeList() {
    ArrayList<Notice> list = new ArrayList<>();
    try (Connection conn = getConnection()) {
      list = new NoticeDao().selectNoticeList(conn);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }

  public Notice selectNotice(int noticeNo) {
    Notice n = null;
    try (Connection conn = getConnection()) {
      n = new NoticeDao().selectNotice(conn, noticeNo);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return n;
  }
}
