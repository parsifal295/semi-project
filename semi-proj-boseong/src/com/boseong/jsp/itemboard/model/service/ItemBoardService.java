package com.boseong.jsp.itemboard.model.service;

import static com.boseong.jsp.common.JDBCTemplate.close;
import static com.boseong.jsp.common.JDBCTemplate.commit;
import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.boseong.jsp.Attachment.model.dao.AttachmentDao;
import com.boseong.jsp.Attachment.model.vo.Attachment;
import com.boseong.jsp.freeboard.model.vo.PageInfo;
import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;
import com.boseong.jsp.itemboard.model.vo.ItemBoard;
  
public class ItemBoardService {
	
	public int insertBoard(ItemBoard ib, Attachment att, int categoryNo) {
		
		Connection conn = getConnection();
		// IBOARD INSERT
		int board = new ItemBoardDao().insertBoard(conn, ib);
		int at = new AttachmentDao().insertAttachment(conn, att, categoryNo);
		if((board * at) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (board*at);
	}
	
	// 게시물의 총 개수
	public int selectListCount(){
		
		Connection conn = getConnection();
		
		int listCount = new ItemBoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 해당 페이지의 starRow에서 endRow까지의 리스트
	public ArrayList<ItemBoard> selectIboardList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<ItemBoard> list = new ItemBoardDao().selectIboardList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int ibIncreaseCount(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new ItemBoardDao().ibIncreaseCount(conn, boardNo);
		
		return result;
	}
	
	public ItemBoard iboardSelect(int boardNo) {
		
		Connection conn = getConnection();
		
		ItemBoard ib = new ItemBoardDao().iboardSelect(conn,boardNo);
		
		close(conn);
		
		return ib;
	}
	

	

}
