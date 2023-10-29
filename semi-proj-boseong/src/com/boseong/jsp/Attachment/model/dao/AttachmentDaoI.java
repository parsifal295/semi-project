package com.boseong.jsp.Attachment.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import java.sql.Connection;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public interface AttachmentDaoI {

  public int insertAttachment(SqlSession sqlSession, Attachment att);

  public int addAttachment(SqlSession sqlSession, Attachment att);
  
  public Attachment selectAttachment(SqlSession sqlSession, int boardNo, int categoryNo);

  public int updateAttachment(SqlSession sqlSession, Attachment att);

  public int deleteAttachment(SqlSession sqlSession, int boardNo, int categoryNo);
}
