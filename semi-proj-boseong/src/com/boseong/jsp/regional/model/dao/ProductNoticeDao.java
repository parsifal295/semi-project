package com.boseong.jsp.regional.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ProductNoticeDao {
	
	private Properties prop = new Properties();
	
	public ProductNoticeDao() {
		
		String fileName = ProductNoticeDao.class.getResource("/sql/regional/productnotice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
