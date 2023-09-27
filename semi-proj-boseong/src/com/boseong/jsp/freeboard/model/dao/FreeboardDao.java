package com.boseong.jsp.freeboard.model.dao;

import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.freeboard.model.vo.PageInfo;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class FreeboardDao {

  private Properties prop = new Properties();

  public FreeboardDao() {
    String filePath = Freeboard.class.getResource("/sql/freeBoard/freeboard-mapper.xml").getPath();
    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public ArrayList<Freeboard> selectFboardList(Connection conn, PageInfo pi) {
    ArrayList<Freeboard> list = new ArrayList<>();
    String sql = prop.getProperty("selectFboardList");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      /*
       * boardLimit이 10이라는 가정하에
       * currentPage == 1 => 시작값 1, 끝값 10
       * currentPage == 2 => 시작값 11, 끝값 20
       * currentPage == 3 => 시작값 21, 끝값 30
       *
       *  시작값 = (currentPage - 1) * boardLimit + 1
       *  끝값 = 시작값 + boardLimit - 1;
       */
      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() - 1;
      ps.setInt(1, startRow);
      ps.setInt(2, endRow);
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          Freeboard fboard = new Freeboard();
          fboard.setBoardNo(rs.getInt("BOARD_NO"));
          fboard.setWriter(rs.getString("ART_WRITER") + "(" + rs.getString("IP_ADDRESS") + ")");
          fboard.setTitle(rs.getString("ART_TITLE"));
          fboard.setCount(rs.getInt("COUNT"));
          fboard.setCreateDate(rs.getDate("CREATE_DATE"));
          list.add(fboard);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }

  public int getListCount(Connection conn) {
    int count = 0;
    String sql = prop.getProperty("getListCount");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          count = rs.getInt(1);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return count;
  }
}
