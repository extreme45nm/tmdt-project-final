package edu.java.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.java.web.dao.CarDAO;
import edu.java.web.dao.ManufacturerDAO;
import edu.java.web.dao.PromotionDAO;
import edu.java.web.dao.SellerDAO;
import edu.java.web.dao.SpecificationDAO;
import edu.java.web.dao.UtilDAO;

@Controller
public class PromotionController {
	
	@Autowired
	CarDAO carDAO;
	@Autowired
	ManufacturerDAO manufacturerDAO;
	@Autowired
	SellerDAO sellerDAO;
	@Autowired
	PromotionDAO promotionDAO;
	@Autowired
	UtilDAO UtilDAO;
	@Autowired
	SpecificationDAO specificationDAO;
}	
