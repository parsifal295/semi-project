package com.boseong.jsp.freeboard.model.service;

import static com.boseong.jsp.common.JDBCTemplate.*;

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
}
