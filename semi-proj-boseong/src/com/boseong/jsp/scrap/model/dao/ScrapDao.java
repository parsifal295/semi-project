package com.boseong.jsp.scrap.model.dao;

import static com.boseong.jsp.common.JDBCTemplate.close;

import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;
import com.boseong.jsp.scrap.model.vo.Scrap;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class ScrapDao {

  private Properties prop = new Properties();

  public ScrapDao() {

    String filePath = ItemBoardDao.class.getResource("/sql/scrap/scrap-mapper.xml").getPath();

    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public int iboardInsertScrap(Connection conn, Scrap sc) {

    int result = 0;
    String sql = prop.getProperty("iboardInsertScrap");
    //		System.out.println(jObj.get("memberNo"));
    //		System.out.println(jObj.get("boardNo"));
    //		System.out.println(jObj.get("scrap"));

    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setInt(1, sc.getMemberNo());
      pstmt.setInt(2, sc.getBoardNo());
      pstmt.setString(3, sc.getStatus());

      result = pstmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public Scrap iboardScrapSelect(Connection conn, Scrap sc) {

    String sql = prop.getProperty("iboardScrapSelect");
    Scrap sp = null;
    ResultSet rset = null;

    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setInt(1, sc.getMemberNo());
      pstmt.setInt(2, sc.getBoardNo());
      rset = pstmt.executeQuery();
      if (rset.next()) {
        sp = new Scrap();
        sp.setMemberNo(rset.getInt("MEM_NO"));
        sp.setBoardNo(rset.getInt("IBOARD_NO"));
        sp.setStatus(rset.getString("STATUS"));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
    }
    return sp;
  }

  public String iboardInsertNo(Connection conn, Scrap sc) {

    String status = "";
    ResultSet rset = null;
    String sql = prop.getProperty("iboardInsertNo");

    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setInt(1, sc.getMemberNo());
      pstmt.setInt(2, sc.getBoardNo());

      rset = pstmt.executeQuery();

      if (rset.next()) {
        status = rset.getString("STATUS");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
    }
    System.out.println("DAO insert scrap : " + status);
    return status;
  }

  public String iboardUpdateNo(Connection conn, Scrap sc) {

    String status = "";
    String sql = prop.getProperty("iboardUpdateNo");
    ResultSet rset = null;

    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setInt(1, sc.getMemberNo());
      pstmt.setInt(2, sc.getBoardNo());

      rset = pstmt.executeQuery();

      if (rset.next()) {
        status = rset.getString("STATUS");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      close(rset);
    }
    return status;
  }

  public int iboardScrapUpdate(Connection conn, Scrap sc) {

    int update = 0;
    String sql = prop.getProperty("iboardScrapUpdate");

    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, sc.getStatus());
      pstmt.setInt(2, sc.getMemberNo());
      pstmt.setInt(3, sc.getBoardNo());

      update = pstmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    }
    return update;
  }
}
