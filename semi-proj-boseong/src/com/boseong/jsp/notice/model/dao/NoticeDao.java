package com.boseong.jsp.notice.model.dao;

import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.notice.model.vo.Notice;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
