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
		int boardNo = 0;
		if((board * at) > 0) {
			commit(conn);
			// DAO감 ->
			boardNo = new ItemBoardDao().selectCurrval(conn, categoryNo);
		} else {
			rollback(conn);
		}
		close(conn);
		return boardNo;
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
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public ItemBoard iboardSelect(int boardNo) {
		
		Connection conn = getConnection();
		
		ItemBoard ib = new ItemBoardDao().iboardSelect(conn,boardNo);
		
		close(conn);
		
		return ib;
	}
	
	
	public int iboardUpdate(ItemBoard ib , Attachment att) {
		// board update result 초기화
		int result1 = 0;
		// 기존첨부파일이 없다면 초기화된 숫자값이 0이기 때문에 기존첨부파일이 있을때 가정을 1로 초기화한다
		int result2 = 1;
		// att table을 다른 게시판도 같이 사용하기 때문에 보성마켓 categoryNo를 초기화 후 보내줘야 한다
		int categoryNo = 20;
		
		Connection conn = getConnection();
		
		// board UPDATE
		result1 = new ItemBoardDao().iboardUpdate(conn, ib);
		// 하지만 첨부파일은 다시 
		if(att != null) {
			// VO필드에 초기화되어있으면 0이기에 
			if(att.getFileNo() > 0) {
				// 기존첨부파일이 있다면 → UPDATE
				result2 = new AttachmentDao().updateAttachment(conn, att);
			} else {
				// 기존첨부파일이 없다면 → INSERT
				result2 = new AttachmentDao().insertAttachment(conn, att, categoryNo);
			}
		}
		result2 = new AttachmentDao().updateAttachment(conn, att);
		
		close(conn);
		
		return (result1 * result2);
	}
	
	
	public int iboardDelete(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new ItemBoardDao().iboardDelete(conn, boardNo);
		
		close(conn);
		
		return result;
	}

	

}
