package com.boseong.jsp.itemboard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ItemBoardDao {
	
	private Properties prop = new Properties();
	
	public ItemBoardDao() {
		
		String filePath = ItemBoardDao.class.getResource("/sql/itemBoard/itemBoard-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
