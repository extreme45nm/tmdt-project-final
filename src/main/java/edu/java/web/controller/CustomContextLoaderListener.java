package edu.java.web.controller;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;

import edu.java.web.dao.CarDAO;
import edu.java.web.dao.ManufacturerDAO;
import edu.java.web.dao.PromotionDAO;
import edu.java.web.dao.SellerDAO;
import edu.java.web.dao.SpecificationDAO;
import edu.java.web.dao.UtilDAO;

public class CustomContextLoaderListener extends ContextLoaderListener{
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		
		System.out.println("\n\n destroyed!!!!\n\n");
		getCurrentWebApplicationContext().getBean(CarDAO.class).shutdown();
		getCurrentWebApplicationContext().getBean(SellerDAO.class).shutdown();
		getCurrentWebApplicationContext().getBean(PromotionDAO.class).shutdown();
		getCurrentWebApplicationContext().getBean(ManufacturerDAO.class).shutdown();
		getCurrentWebApplicationContext().getBean(UtilDAO.class).shutdown();
		getCurrentWebApplicationContext().getBean(SpecificationDAO.class).shutdown();
		super.contextDestroyed(event);
	}
	
	@Override
	public void contextInitialized(ServletContextEvent event) {		
		System.out.println("\n\n inited!!!!\n\n");
		super.contextInitialized(event);
	}
}
