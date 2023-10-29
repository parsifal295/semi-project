package com.boseong.jsp.freeboard.model.dao;

import com.boseong.jsp.freeboard.model.vo.Freeboard;
import com.boseong.jsp.freeboard.model.vo.FreeboardReply;
import com.boseong.jsp.common.model.vo.PageInfo;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public class FreeboardDao {

  private Properties prop = new Properties();

  public FreeboardDao() {
    String filePath = Freeboard.class.getResource("/sql/freeBoard/freeboard-mapper.xml").getPath();
    try {
      prop.loadFromXML(new FileInputStream(filePath));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public ArrayList<Freeboard> selectFboardList(SqlSession sqlSession, PageInfo pi) {
    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    return (ArrayList)sqlSession.selectList("freeboardMapper.selectFboardList", null, rowBounds);
  }

  public int getListCount(SqlSession sqlSession) {
    return sqlSession.selectOne("freeboardMapper.getListCount");
  }

  public int insertBoard(SqlSession sqlSession, Freeboard fb) {
    return sqlSession.insert("freeboardMapper.insertBoard", fb);
  }

  public int increaseCount(SqlSession sqlSession, int boardNo) {
    return sqlSession.update("freeboardMapper.increaseCount", boardNo);
  }

  public Freeboard selectFreeboard(SqlSession sqlSession, int boardNo) {
    return sqlSession.selectOne("freeboardMapper.selectFreeboard", boardNo);
  }

  public int updateFreeboard(SqlSession sqlSession, Freeboard fb) {
    return sqlSession.update("freeboardMapper.updateFreeboard", fb);
  }

  public int deleteFreeboard(SqlSession sqlSession, int boardNo) {
    return sqlSession.update("freeboardMapper.deleteFreeboard", boardNo);
  }

  public int getSearchCount(SqlSession sqlSession, HashMap<String, String> map) {
    return sqlSession.selectOne("freeboardMapper.getSearchCount", map);
  }

  public ArrayList<Freeboard> getSearchResult(
      SqlSession sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
    return (ArrayList)sqlSession.selectList("freeboardMapper.getSearchResult", map, rowBounds);
  }

  public ArrayList<FreeboardReply> selectReplyList(SqlSession sqlSession, int boardNo) {
    return (ArrayList)sqlSession.selectList("freeboardMapper.selectReplyList", boardNo);
  }

  public int insertReply(SqlSession sqlSession, FreeboardReply fr) {
    return sqlSession.insert("freeboardMapper.insertReply", fr);
  }

  public int updateReply(SqlSession sqlSession, FreeboardReply fr) {
    return sqlSession.update("freeboardMapper.updateReply", fr);
  }

  public int deleteReply(SqlSession sqlSession, int boardNo) {
    return sqlSession.update("freeboardMapper.deleteReply", boardNo);
  }
}
