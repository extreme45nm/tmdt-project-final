//package edu.java.web.controller;
//
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.Errors;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.context.request.WebRequest;
//import org.springframework.web.servlet.ModelAndView;
//
//import edu.java.web.dao.UserDAO;
//import edu.java.web.model.User;
//
//@Controller
//@RequestMapping("/user")
//public class RegistrationController {
//	
////	@Autowired
////	UserDAO userDao;
//
//	@RequestMapping(value="/registration",method=RequestMethod.GET)
//	public String showRegistrationForm(WebRequest request, Model model){
//		User us = new User();
//		model.addAttribute("user", us);
//		return "registration";
//	}
//	
//	@RequestMapping(value="/registration",method=RequestMethod.POST)
//	public ModelAndView registerUserAccount(@ModelAttribute("user")@Valid User user,
//			BindingResult result, WebRequest request, Errors err){
//		User registerUser = new User();
//		if(!result.hasErrors()){
//			createUserAccount(user, result);
//		}else{
//			return new ModelAndView("registration","user",user);
//		}
////		if(registerUser == null){
////			result.rejectValue("email", "message.regError");
////		}
//		
//		ModelAndView mav = new ModelAndView("CarList");
//		return mav;
//	}
//	
//	private User createUserAccount(User userAccount, BindingResult result){
//		User registerUser = null;
//		try{
//			registerUser = userDao.registerNewUserAccount(userAccount); 
//		}catch(Exception exc){
//			exc.printStackTrace();
//			return null;
//		}
//		return registerUser;
//	}
//	
//	
//	
//}
