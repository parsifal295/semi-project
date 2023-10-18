package com.boseong.jsp.gallery.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.boseong.jsp.gallery.model.vo.Gallery;
import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;

public class GalleryDao {
	private Properties prop = new Properties();
	public GalleryDao() {
		
		String filePath = ItemBoardDao.class.getResource("/sql/gallery/gallery-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertGallery(Connection conn, Gallery gy, String link) {
		
		int insert = 0;
		String sql = prop.getProperty("insertGallery");
		
		try(PreparedStatement ps = conn.prepareStatement(sql)){
			
			  ps.setString(1, link);
		      ps.setString(2, gy.getOriginName());
		      ps.setString(3, gy.getModifiedName());
		      ps.setString(4, gy.getSavePath());
		      
		      insert = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insert;
	}
	

}
