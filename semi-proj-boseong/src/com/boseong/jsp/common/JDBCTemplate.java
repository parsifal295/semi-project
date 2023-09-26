package com.boseong.jsp.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

  // don't let anyone instantiate it
  private JDBCTemplate() {}

  public static Connection getConnection() {
    Connection conn = null;
    Properties prop = new Properties();
    // 읽어들이고자 하는 파일의 물리적인 경로
    String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
    try {
      prop.load(new FileInputStream(fileName));
      Class.forName(prop.getProperty("driver"));
      conn =
          DriverManager.getConnection(
              prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
      conn.setAutoCommit(false);
    } catch (IOException ioe) {
      ioe.printStackTrace();
    } catch (SQLException e) {
      e.printStackTrace();
    } catch (ClassNotFoundException cn) {
      cn.printStackTrace();
    }
    return conn;
  }

  public static void commit(Connection conn) {
    try {
      if (conn != null && !conn.isClosed()) {
        conn.commit();
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void rollback(Connection conn) {
    try {
      if (conn != null && !conn.isClosed()) {
        conn.rollback();
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void close(Connection conn) {
    try {
      if (conn != null && !conn.isClosed()) {
        conn.close();
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void close(Statement stmt) {
    try {
      if (stmt != null && !stmt.isClosed()) {
        stmt.close();
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static void close(ResultSet rSet) {
    try {
      if (rSet != null && !rSet.isClosed()) {
        rSet.close();
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
