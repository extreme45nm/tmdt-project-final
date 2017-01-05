package edu.java.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.java.web.dao.CarDAO;

@Controller
public class HomeController {
	
	@Autowired
	CarDAO carDAO;
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public ModelAndView home(){
		
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		model.addObject("cars", carDAO.listCar());
		return model;
	}
}
