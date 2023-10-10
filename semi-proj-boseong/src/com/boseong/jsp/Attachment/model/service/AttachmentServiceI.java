package com.boseong.jsp.Attachment.model.service;

import com.boseong.jsp.Attachment.model.vo.Attachment;

public interface AttachmentServiceI {

  public int insertAttachment(Attachment att, int categoryNo);

  public Attachment selectAttachment(int boardNo, int categoryNo);

  public int updateAttachment(Attachment att);

  public int deleteAttachment(int boardNo);
}
