package com.boseong.jsp.Attachment.model.service;

import com.boseong.jsp.Attachment.model.vo.Attachment;

public interface AttachmentServiceI {

  public int insertAttachment(Attachment att);

  public Attachment selectAttachment(int boardNo);

  public int updateAttachment(Attachment att);

  public int deleteAttachment(int boardNo);
}
