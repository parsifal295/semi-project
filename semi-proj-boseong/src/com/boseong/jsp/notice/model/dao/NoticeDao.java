package com.boseong.jsp.notice.model.dao;

import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.notice.model.vo.Notice;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class NoticeDao {
  private Properties prop = new Properties();

  public NoticeDao() {
    String filePath = Freeboard.class.getResource("/sql/notice/notice-mapper.xml").getPath();
    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public ArrayList<Notice> selectNoticeList(Connection conn) {
    ArrayList<Notice> list = new ArrayList<Notice>();
    String sql = prop.getProperty("selectNoticeList");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          Notice n = new Notice();
          n.setNoticeNo(rs.getInt("NOTICE_NO"));
          n.setCategory(rs.getInt("CATEGORY_NO"));
          n.setNoticeTitle(rs.getString("NOTICE_TITLE"));
          n.setNoticeContent(rs.getString("NOTICE_CONTENT"));
          n.setCreateDate(rs.getString("A"));
          n.setModifyDate(rs.getString("B"));
          n.setCount(rs.getInt("COUNT"));
          list.add(n);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }

  public Notice selectNotice(Connection conn, int noticeNo) {
    Notice n = null;
    String sql = prop.getProperty("selectNotice");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, noticeNo);
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          n = new Notice();
          n.setCategory(10);
          n.setNoticeTitle(rs.getString("NOTICE_TITLE"));
          n.setNoticeContent(rs.getString("NOTICE_CONTENT"));
          n.setCreateDate(rs.getString("A"));
          n.setModifyDate(rs.getString("B"));
          n.setCount(rs.getInt("COUNT"));
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return n;
  }
}
