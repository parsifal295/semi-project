package com.boseong.jsp.gallery.model.service;

import static com.boseong.jsp.common.JDBCTemplate.getConnection;
import static com.boseong.jsp.common.JDBCTemplate.commit;
import static com.boseong.jsp.common.JDBCTemplate.rollback;
import static com.boseong.jsp.common.JDBCTemplate.close;

import java.sql.Connection;

import com.boseong.jsp.gallery.model.dao.GalleryDao;
import com.boseong.jsp.gallery.model.vo.Gallery;

public class GalleryService {
	
	
	public int insertGallery(Gallery gy, String link) {
		
		Connection conn = getConnection();
		
		int insert = new GalleryDao().insertGallery(conn,gy,link);
		
		if(insert > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return insert;
	}

}
