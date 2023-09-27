package com.boseong.jsp.freeboard.model.dao;

import com.boseong.jsp.freeboard.model.vo.Freeboard;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class FreeboardDao {

  private Properties prop = new Properties();

  public FreeboardDao() {
    String filePath = Freeboard.class.getResource("/sql/freeboard/freeboard-mapper.xml").getPath();
    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public ArrayList<Freeboard> selectFboardList(Connection conn) {
    ArrayList<Freeboard> list = new ArrayList<>();
    String sql = prop.getProperty("selectFboardList");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }
}
