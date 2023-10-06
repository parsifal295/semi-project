package com.boseong.jsp.freeboard.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.dao.FreeboardDao;
import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.freeboard.model.vo.PageInfo;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class FreeboardService {
  public ArrayList<Freeboard> selectFboardList(PageInfo pi) {
    ArrayList<Freeboard> list = new ArrayList<Freeboard>();
    try (Connection conn = getConnection()) {
      list = new FreeboardDao().selectFboardList(conn, pi);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return list;
  }

  public int getListCount() {
    int count = 0;
    try (Connection conn = getConnection()) {
      count = new FreeboardDao().getListCount(conn);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return count;
  }

  public int insertBoard(Freeboard fb, Attachment att) {
    int result1 = 0;
    int result2 = 1;
    try (Connection conn = getConnection()) {
      // 1. 자유게시판 등록
      result1 = new FreeboardDao().insertBoard(conn, fb);

      // 2. 첨부파일 등록
      if (att != null) {
        result2 = new FreeboardDao().insertAttachment(conn, att);
      }

      // 3. transaction
      if ((result1 * result2) > 0) {
        commit(conn);
      } else {
        rollback(conn);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result1 * result2;
  }

  public int increaseCount(int boardNo) {
    int result = 0;
    try (Connection conn = getConnection()) {
      result = new FreeboardDao().increaseCount(conn, boardNo);
      if (result > 0) {
        commit(conn);
      } else {
        rollback(conn);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public Freeboard selectFreeboard(int boardNo) {
    Freeboard fb = null;
    try (Connection conn = getConnection()) {
      fb = new FreeboardDao().selectFreeboard(conn, boardNo);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return fb;
  }

  public Attachment selectAttachment(int boardNo) {
    Attachment att = null;
    try (Connection conn = getConnection()) {
      att = new FreeboardDao().selectAttachment(conn, boardNo);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return att;
  }
}
