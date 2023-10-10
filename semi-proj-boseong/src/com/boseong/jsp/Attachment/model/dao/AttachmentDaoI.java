package com.boseong.jsp.Attachment.model.dao;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import java.sql.Connection;

public interface AttachmentDaoI {

  public int insertAttachment(Connection conn, Attachment att);

  public Attachment selectAttachment(Connection conn, int boardNo);
}
