package com.boseong.jsp.Attachment.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.vo.Freeboard;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;

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
  public int insertAttachment(SqlSession sqlSession, Attachment att) {
	  return sqlSession.insert("attachmentMapper.insertAttachment", att);
  }
  
  @Override
  public int addAttachment(SqlSession sqlSession, Attachment att) {
	  return sqlSession.insert("attachmentMapper.addAttachment", att);
  }

  @Override
  public Attachment selectAttachment(SqlSession sqlSession, int boardNo, int categoryNo) {
    HashMap<String, Integer> map = new HashMap<>();
    map.put("boardNo", boardNo);
    map.put("categoryNo", categoryNo);
    return sqlSession.selectOne("attachmentMapper.selectAttachment", map);
  }

  @Override
  public int updateAttachment(SqlSession sqlSession, Attachment att) {
    return sqlSession.update("attachmentMapper.updateAttachment", att);
  }

  @Override
  public int deleteAttachment(SqlSession sqlSession, int boardNo, int categoryNo) {
	HashMap<String, Integer> map = new HashMap<>();
	map.put("boardNo", boardNo);
	map.put("categoryNo", categoryNo);
	return sqlSession.selectOne("attachmentMapper.deleteAttachment", map);
  }
}
