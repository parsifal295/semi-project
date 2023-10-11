package com.boseong.jsp.freeboard.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
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

  public int insertBoard(Connection conn, Freeboard fb) {
    int result = 0;
    String sql = prop.getProperty("insertBoard");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, fb.getWriter());
      ps.setString(2, fb.getIpAddress());
      ps.setString(3, fb.getTitle());
      ps.setString(4, fb.getPassword());
      ps.setString(5, fb.getContent());
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public int insertAttachment(Connection conn, Attachment att) {
    int result = 0;
    String sql = prop.getProperty("insertAttachment");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, att.getOriginName());
      ps.setString(2, att.getModifiedName());
      ps.setString(3, att.getSavePath());
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public int increaseCount(Connection conn, int boardNo) {
    int result = 0;
    String sql = prop.getProperty("increaseCount");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, boardNo);
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public Freeboard selectFreeboard(Connection conn, int boardNo) {
    Freeboard fb = null;
    String sql = prop.getProperty("selectFreeboard");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, boardNo);
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          fb = new Freeboard();
          fb.setBoardNo(rs.getInt("BOARD_NO"));
          fb.setCategoryNo(rs.getInt("CATEGORY_NO"));
          fb.setContent(rs.getString("ART_CONTENT"));
          fb.setWriter(rs.getString("ART_WRITER"));
          fb.setIpAddress(rs.getString("IP_ADDRESS"));
          fb.setTitle(rs.getString("ART_TITLE"));
          fb.setPassword(rs.getString("ART_PASSWORD"));
          fb.setCount(rs.getInt("COUNT"));
          fb.setCreateDate(rs.getDate("CREATE_DATE"));
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return fb;
  }

  public Attachment selectAttachment(Connection conn, int boardNo) {
    Attachment att = null;
    String sql = prop.getProperty("selectAttachment");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, boardNo);
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          att = new Attachment();
          att.setFileNo(rs.getInt("FILE_NO"));
          att.setRefNo(rs.getInt("REF_NO"));
          att.setOriginName(rs.getString("ORIGIN_NAME"));
          att.setModifiedName(rs.getString("MODIFIED_NAME"));
          att.setSavePath(rs.getString("SAVE_PATH"));
          att.setUploadDate(rs.getDate("UPLOAD_DATE"));
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return att;
  }

  public int updateFreeboard(Connection conn, Freeboard fb) {
    int result = 0;
    String sql = prop.getProperty("updateFreeboard");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, fb.getTitle());
      ps.setString(2, fb.getPassword());
      ps.setString(3, fb.getContent());
      ps.setInt(4, fb.getBoardNo());
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public int updateAttachment(Connection conn, Attachment att) {
    int result = 0;
    String sql = prop.getProperty("updateAttachment");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, att.getOriginName());
      ps.setString(2, att.getModifiedName());
      ps.setString(3, att.getSavePath());
      ps.setInt(4, att.getFileNo());
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  /**
   * deleteFreeboard method -- deletes a freeboard article from the database
   *
   * @param conn the Connection object to connect to the database
   * @param boardNo
   * @return int
   */
  public int deleteFreeboard(Connection conn, int boardNo) {
    int result = 0;
    String sql = prop.getProperty("deleteFreeboard");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, boardNo);
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public int getSearchCount(Connection conn, String condition, String keyword) {
    int result = 0;
    String sql = prop.getProperty("getSearchCount");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      if (condition.equals("titleContent")) {
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ps.setString(3, "");
        ps.setString(4, "");
      } else if (condition.equals("writer")) {
        ps.setString(1, "");
        ps.setString(2, "");
        ps.setString(3, "%" + keyword + "%");
        ps.setString(4, "");
      } else if (condition.equals("ip")) {
        ps.setString(1, "");
        ps.setString(2, "");
        ps.setString(3, "");
        ps.setString(4, "%" + keyword + "%");
      }
      try (ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
          result = rs.getInt(1);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public ArrayList<Freeboard> getSearchResult(
      Connection conn, String condition, String keyword, PageInfo pi) {
    ArrayList<Freeboard> list = new ArrayList<>();
    String sql = prop.getProperty("getSearchResult");
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
      if (condition.equals("titleContent")) {
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ps.setString(3, "");
        ps.setString(4, "");
      } else if (condition.equals("writer")) {
        ps.setString(1, "");
        ps.setString(2, "");
        ps.setString(3, "%" + keyword + "%");
        ps.setString(4, "");
      } else if (condition.equals("ip")) {
        ps.setString(1, "");
        ps.setString(2, "");
        ps.setString(3, "");
        ps.setString(4, "%" + keyword + "%");
      }
      int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
      int endRow = startRow + pi.getBoardLimit() - 1;
      ps.setInt(5, startRow);
      ps.setInt(6, endRow);
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

  public ArrayList<FreeboardReply> selectReplyList(Connection conn, int boardNo) {
    ArrayList<FreeboardReply> list = new ArrayList<>();
    String sql = prop.getProperty("selectReplyList");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, boardNo);
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          FreeboardReply fr = new FreeboardReply();
          fr.setReplyNo(rs.getInt("REPLY_NO"));
          fr.setWriter(rs.getString("WRITER"));
          fr.setIpAddress(rs.getString("IP_ADDRESS"));
          fr.setContent(rs.getString("REPLY_CONTENT"));
          fr.setCreateDate(rs.getDate("CREATE_DATE"));
          list.add(fr);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }
}
