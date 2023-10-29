package com.boseong.jsp.Attachment.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;
import static com.boseong.jsp.common.template.Template.*;

import com.boseong.jsp.Attachment.model.dao.AttachmentDao;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

public class AttachmentService implements AttachmentServiceI {

  private AttachmentDao attachment = new AttachmentDao();

  @Override
  public int insertAttachment(Attachment att, int categoryNo) {
	int result = 0;
	att.setCategoryNo(categoryNo);
    try (SqlSession sqlSession = getSqlSession()) {
    	int at = attachment.insertAttachment(sqlSession, att);
    	if (result > 0) {
    		sqlSession.commit();
    	}
    }
    return result;
  }

  @Override
  public Attachment selectAttachment(int boardNo, int categoryNo) {
	Attachment att = null;
    try (SqlSession sqlSession = getSqlSession()) {
    	att = attachment.selectAttachment(sqlSession, boardNo, categoryNo);
    }
    return att;
  }

  @Override
  public int updateAttachment(Attachment att) {
	int result = 0;
	try (SqlSession sqlSession = getSqlSession()) {
		result = attachment.updateAttachment(sqlSession, att);
	}
	return result;
  }

  @Override
  public int deleteAttachment(int boardNo, int categoryNo) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = attachment.deleteAttachment(sqlSession, boardNo, categoryNo);
    } 
    return result;
  }
}
