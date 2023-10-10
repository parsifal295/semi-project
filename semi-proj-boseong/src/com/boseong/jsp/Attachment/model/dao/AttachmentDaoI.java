package com.boseong.jsp.Attachment.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import java.sql.Connection;

public interface AttachmentDaoI {

  public int insertAttachment(Connection conn, Attachment att, int categoryNo);

  public Attachment selectAttachment(Connection conn, int boardNo, int categoryNo);

  public int updateAttachment(Connection conn, Attachment att);

  public int deleteAttachment(Connection conn, int boardNo);
}
