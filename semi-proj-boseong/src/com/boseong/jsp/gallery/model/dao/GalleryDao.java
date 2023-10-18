package com.boseong.jsp.gallery.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
			
		      ps.setString(1, gy.getOriginName());
		      ps.setString(2, gy.getModifiedName());
		      ps.setString(3, gy.getSavePath());
		      ps.setString(4, link);
		      
		      insert = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insert;
	}
	
	public ArrayList<Gallery> selectList(Connection conn){
		
		ArrayList<Gallery> list = new ArrayList();
		String sql = prop.getProperty("selectList");
		ResultSet rset = null;
		try(PreparedStatement ps = conn.prepareStatement(sql)){
			
			rset = ps.executeQuery();
			
			while(rset.next()) {
				Gallery gy = new Gallery();
				gy.setGalleryNo(rset.getInt("GALLERY_NO"));
				gy.setFileNo(rset.getInt("FILE_NO"));
				gy.setOriginName(rset.getString("ORIGIN_NAME"));
				gy.setModifiedName(rset.getString("MODIFIED_NAME"));
				gy.setSavePath(rset.getString("SAVE_PATH"));
				gy.setLink(rset.getString("LINK"));
				list.add(gy);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
