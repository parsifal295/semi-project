package com.boseong.jsp.freeboard.model.service;

import static com.boseong.jsp.common.template.Template.*;
import static com.boseong.jsp.common.JDBCTemplate.*;

import com.boseong.jsp.Attachment.model.dao.AttachmentDao;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.dao.FreeboardDao;
import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
import com.boseong.jsp.common.model.vo.PageInfo;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public class FreeboardService {
  private FreeboardDao boardDao = new FreeboardDao();
  private AttachmentDao attachmentDao = new AttachmentDao();
  
  public ArrayList<Freeboard> selectFboardList(PageInfo pi) {
    ArrayList<Freeboard> list = null;
    try (SqlSession sqlSession = getSqlSession()) {
      list = boardDao.selectFboardList(sqlSession, pi);
    }
    return list;
  }

  public int getListCount() {
    int count = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      count = boardDao.getListCount(sqlSession);
    }
    return count;
  }

  public int insertBoard(Freeboard fb, Attachment att) {
    int result1 = 0;
    int result2 = 1;
    try (SqlSession sqlSession = getSqlSession()) {
      // 1. 자유게시판 등록
      result1 = boardDao.insertBoard(sqlSession, fb);

      // 2. 첨부파일 등록
      if (att != null) {
    	att.setCategoryNo(10);
        result2 = attachmentDao.insertAttachment(sqlSession, att);
      }

      // 3. transaction
      if ((result1 * result2) > 0) {
        sqlSession.commit();
      }
    }
    return result1 * result2;
  }

  public int increaseCount(int boardNo) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = boardDao.increaseCount(sqlSession, boardNo);
      if (result > 0) {
        sqlSession.commit();
      }
    }
    return result;
  }
  

  public Freeboard selectFreeboard(int boardNo) {
    Freeboard fb = null;
    try (SqlSession sqlSession = getSqlSession()) {
      fb = boardDao.selectFreeboard(sqlSession, boardNo);
    }
    return fb;
  }

  public int updateArticle(Freeboard fb, Attachment att) {
    int result1 = 0;
    int result2 = 1;
    try (SqlSession sqlSession = getSqlSession()) {
      result1 = boardDao.updateFreeboard(sqlSession, fb);
      if (att != null) {
        if (att.getFileNo() != 0) {
          // 기존 첨부파일이 있다는 소리 => UPDATE 필요
          result2 = new AttachmentDao().updateAttachment(sqlSession, att);
        } else {
          // 없다는소리 => INSERT
          att.setRefNo(fb.getBoardNo());
          result2 = new AttachmentDao().addAttachment(sqlSession, att);
        }
        if (result1 * result2 > 0) {
        	sqlSession.commit();
        }
      }
    }
    return result1 * result2;
  }

  public int deleteFreeboard(int boardNo) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = boardDao.deleteFreeboard(sqlSession, boardNo);
      if (result > 0) {
        sqlSession.commit();
      } 
    }
    return result;
  }

  public int getSearchCount(HashMap<String, String> map) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = new FreeboardDao().getSearchCount(sqlSession, map);
    }
    return result;
  }

  public ArrayList<Freeboard> getSearchResult(HashMap<String, String> map, RowBounds rowBounds) {
    ArrayList<Freeboard> list = new ArrayList<>();
    try (SqlSession sqlSession = getSqlSession()) {
      list = new FreeboardDao().getSearchResult(sqlSession, map, rowBounds);
    }
    return list;
  }

  public ArrayList<FreeboardReply> selectReplyList(int boardNo) {
    ArrayList<FreeboardReply> list = new ArrayList<>();
    try (SqlSession sqlSession = getSqlSession()) {
      list = new FreeboardDao().selectReplyList(sqlSession, boardNo);
    }
    return list;
  }

  public int insertReply(FreeboardReply fr) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = new FreeboardDao().insertReply(sqlSession, fr);
      if (result > 0) {
        sqlSession.commit();
      } 
    }
    return result;
  }

  public int updateReply(FreeboardReply fr) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = new FreeboardDao().updateReply(sqlSession, fr);
      if (result > 0) {
        sqlSession.commit();
      }
    }
    return result;
  }

  public int deleteReply(int boardNo) {
    int result = 0;
    try (SqlSession sqlSession = getSqlSession()) {
      result = new FreeboardDao().deleteReply(sqlSession, boardNo);
      if (result > 0) {
        sqlSession.commit();
      }
    }
    return result;
  }
}
