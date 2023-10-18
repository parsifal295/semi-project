package com.boseong.jsp.scrap.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.commit;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.rollback;

import com.boseong.jsp.scrap.model.dao.ScrapDao;
import com.boseong.jsp.scrap.model.vo.Scrap;
import java.sql.Connection;
import java.util.ArrayList;

public class ScrapService {

  public Scrap iboardScrapSelect(Scrap sc) {
    Connection conn = getConnection();
    Scrap s = null;
    s = new ScrapDao().iboardScrapSelect(conn, sc);
    close(conn);
    return s;
  }

  public int iboardInsertScrap(Scrap sc) {

    Connection conn = getConnection();

    int insert = new ScrapDao().iboardInsertScrap(conn, sc);
    if (insert > 0) {
      commit(conn);
    } else {
      rollback(conn);
    }
    close(conn);
    return insert;
  }

  public int iboardScrapUpdate(Scrap sc) {

    Connection conn = getConnection();

    int update = new ScrapDao().iboardScrapUpdate(conn, sc);
    if (update > 0) {
      commit(conn);
      // String st = new ScrapDao().iboardUpdateNo(conn, sc);
    } else {
      rollback(conn);
    }
    return update;
  }
}
