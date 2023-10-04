package com.boseong.jsp.itemboard.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;
  
public class ItemBoardService {
	
	public int insertBoard(ItemBoard ib, Attachment at) {
		
		Connection conn = getConnection();
		// IBOARD INSERT
		int board = new ItemBoardDao().insertBoard(conn, ib);
		// ATTACHMENT INSERT
		int file = 1;
		if(at != null) {
			file = new ItemBoardDao().insertAttachment(conn, at);
		}
		if((board*file)>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (board*file);
	}

}
