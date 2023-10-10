package com.boseong.jsp.Attachment.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.*;


import java.sql.Connection;

import com.boseong.jsp.Attachment.model.dao.AttachmentDao;
import com.boseong.jsp.Attachment.model.vo.Attachment;

public class AttachmentService implements AttachmentServiceI {
	
	private AttachmentDao attachment = new AttachmentDao();

  @Override
  public int insertAttachment(Attachment att, int categoryNo) {
	  
	  	Connection conn = getConnection();
	    
		int at = attachment.insertAttachment(conn, att, categoryNo);
		
		close(conn);
		
		return at;
  }

  @Override
  public Attachment selectAttachment(int boardNo, int categoryNo) {
    
    Connection conn = getConnection();
    
	Attachment at = attachment.selectAttachment(conn, boardNo, categoryNo);
	
	close(conn);
	
	return at;
  }

  @Override
  public int updateAttachment(Attachment att) {
	  
	  	Connection conn = getConnection();
	    
		int at = attachment.updateAttachment(conn, att);
		
		close(conn);
		
		return at;
  }

  @Override
  public int deleteAttachment(int boardNo) {
	  
	  	Connection conn = getConnection();
	    
		int at = attachment.deleteAttachment(conn, boardNo);
		
		close(conn);
		
		return at;
  }
  
}
