package edu.java.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.java.web.dao.CarDAO;
import edu.java.web.dao.ManufacturerDAO;
import edu.java.web.dao.PromotionDAO;
import edu.java.web.dao.SellerDAO;
import edu.java.web.dao.SpecificationDAO;
import edu.java.web.dao.UtilDAO;
import edu.java.web.model.Seller;

@Controller
public class SellerController {

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

	@RequestMapping(value="/seller/edit/{id}",method=RequestMethod.GET)
	public ModelAndView editSeller(@PathVariable Integer id){

		Seller seller = sellerDAO.loadSellerById(id);
		ModelAndView model = new ModelAndView("../SellerForm","command",seller);

		model.getModelMap().put("id", seller.getId());
		model.getModelMap().put("name", seller.getName());
		model.getModelMap().put("age", seller.getAge());
		model.getModelMap().put("accountNumber", seller.getAccountNumber());
		model.getModelMap().put("number", seller.getNumber());
		model.getModelMap().put("address", seller.getAddress());
//		model.getModelMap().put("price", seller.getPrice());

		return model;
	}

	@RequestMapping(value="/seller/view/{id}",method=RequestMethod.GET)
	public ModelAndView loadSeller(@PathVariable Integer id){

		ModelAndView model = new ModelAndView();
		Seller seller = sellerDAO.loadSellerById(id);

		model.setViewName("../SellerView");
		model.addObject("seller", seller);
//		model.addObject("cars", carDAO.loadCarBySellerId());
		model.getModelMap().put("id", seller.getId());
		model.getModelMap().put("name",seller.getName());
		model.getModelMap().put("age",seller.getAge()); 
		model.getModelMap().put("accountNumber", seller.getAccountNumber());
		model.getModelMap().put("number", seller.getNumber());
		model.getModelMap().put("address", seller.getAddress());

		return model;	
	}

	@RequestMapping(value={"/seller/list"},method=RequestMethod.GET)
	public ModelAndView listSeller(){

		ModelAndView model = new ModelAndView("SellerList");
		model.addObject("sellers", sellerDAO.listSeller());
//		model.addObject("manufacturers", manufacturerDAO.listManufacturer());
//		model.addObject("sellers", sellerDAO.listSeller());
		return model;
	}

	@RequestMapping(value="/seller/form",method=RequestMethod.GET)
	public ModelAndView sellerForm(){
		System.out.println("form mapping invoked");
		ModelAndView model = new ModelAndView("SellerForm","command",new Seller());
		return model;		
	}

	@RequestMapping(value="/seller/add",method=RequestMethod.POST)
	public ModelAndView addSeller(Seller seller){

		ModelAndView mav = null;
		if(sellerDAO.loadSellerById(seller.getId())!=null){
			sellerDAO.updateSeller(seller);
			mav=new ModelAndView("redirect:/seller/form");
			return mav;
		}else{
			sellerDAO.insertSeller(seller);
		}
		mav = new ModelAndView("redirect:/seller/list");
		return mav;
	}
}
