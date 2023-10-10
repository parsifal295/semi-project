package com.boseong.jsp.Attachment.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;

public class AttachmentDao implements AttachmentDaoI {

  @Override
  public int insertAttachment(Connection conn, Attachment att, int categoryNo) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'insertAttachment'");
  }

  @Override
  public Attachment selectAttachment(Connection conn, int boardNo, int categoryNo) {
    throw new UnsupportedOperationException("Unimplemented method 'selectAttachment'");
	
  }

  @Override
  public int updateAttachment(Connection conn, Attachment att) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'updateAttachment'");
  }

  @Override
  public int deleteAttachment(Connection conn, int boardNo) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'deleteAttachment'");
  }
}
