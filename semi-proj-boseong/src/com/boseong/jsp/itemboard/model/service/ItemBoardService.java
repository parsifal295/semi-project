package com.boseong.jsp.itemboard.model.service;

import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;

public class ItemBoardService {
	
	public int insertBoard(ItemBoard ib) {
		
		Connection conn = getConnection();
		
		int result = new ItemBoardDao().insertBoard(conn, ib);
		
		close(conn);
		
		return result;
	}

}
