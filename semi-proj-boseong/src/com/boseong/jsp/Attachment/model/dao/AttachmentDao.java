package com.boseong.jsp.Attachment.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class AttachmentDao implements AttachmentDaoI {
  private Properties prop = new Properties();

  public AttachmentDao() {
    String filePath =
        Freeboard.class.getResource("/sql/attachment/attachment-mapper.xml").getPath();
    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @Override
  public int insertAttachment(Connection conn, Attachment att, int categoryNo) {
    int result = 0;
    String sql = prop.getProperty("insertAttachment");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, categoryNo);
      ps.setString(2, att.getOriginName());
      ps.setString(3, att.getModifiedName());
      ps.setString(4, att.getSavePath());
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  @Override
  public Attachment selectAttachment(Connection conn, int boardNo, int categoryNo) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'selectAttachment'");
  }

  @Override
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

  @Override
  public int deleteAttachment(Connection conn, int boardNo) {
    int result = 0;
    String sql = prop.getProperty("deleteAttachment");
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setInt(1, boardNo);
      result = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }
}
