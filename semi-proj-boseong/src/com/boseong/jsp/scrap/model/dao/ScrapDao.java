package com.boseong.jsp.scrap.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.boseong.jsp.itemboard.model.dao.ItemBoardDao;

public class ScrapDao {
	
	private Properties prop = new Properties();
	
	public ScrapDao() {
		
		String filePath = ItemBoardDao.class.getResource("/sql/scrap/scrap-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
