package edu.java.web.controller;

//import org.apache.commons.io.output.ByteArrayOutputStream;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
//import java.io.OutputStream;
//import java.util.List;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.java.web.dao.CarDAO;
import edu.java.web.dao.ManufacturerDAO;
import edu.java.web.dao.PromotionDAO;
import edu.java.web.dao.SellerDAO;
import edu.java.web.dao.SpecificationDAO;
import edu.java.web.dao.UtilDAO;
import edu.java.web.model.Car;
import edu.java.web.model.Promotion;
import edu.java.web.model.Specification;
import edu.java.web.model.Util;

@Controller
public class CarController {

	@Autowired
	CarDAO carDAO;
	@Autowired
	ManufacturerDAO manufacturerDAO;
	@Autowired
	SellerDAO sellerDAO;
	@Autowired
	PromotionDAO promotionDAO;
	@Autowired
	UtilDAO utilDAO;
	@Autowired
	SpecificationDAO specificationDAO;

	//	@RequestMapping(value="/car/json",produces=MediaType.APPLICATION_JSON_VALUE)
	//	public @ResponseBody 



	@RequestMapping(value="/car/img/{id}",method=RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(@PathVariable Integer id,HttpServletRequest request) throws IOException{

		ServletContext servletContext = request.getSession().getServletContext();
		String absoluteDiskPath = servletContext.getRealPath("/");
		ByteArrayOutputStream byteOutput = new ByteArrayOutputStream();

		File folder = new File(absoluteDiskPath+File.separator+"car"+File.separator+"img"+File.separator);
		if(folder.exists()){
			File file = new File(folder,id+".jpg");
			if(file.exists()){
				//				System.out.println("IMG found");
				FileInputStream stream = new FileInputStream(file);
				int readedBytes;
				byte[] buf = new byte[1024];
				while((readedBytes = stream.read(buf))>0){
					byteOutput.write(buf, 0, readedBytes);
				}
				stream.close();
			}
		}

		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(byteOutput.toByteArray(),headers,HttpStatus.CREATED);
	}

	@RequestMapping(value="/car/delete/{carId}",method=RequestMethod.GET)
	public ModelAndView deleteCar(@PathVariable Integer carId){
		carDAO.deleteCar(carId);
		System.out.println("delete car invoked");

		return new ModelAndView("redirect:../list");
	}

	@RequestMapping(value="/car/edit/{id}",method=RequestMethod.GET)
	public ModelAndView editCar(@PathVariable Integer id){

		Car car = carDAO.loadCarById(id);
		ModelAndView model = new ModelAndView("../CarForm","command",car);

		model.getModelMap().put("id", car.getId());
		model.getModelMap().put("name", car.getName());
		model.getModelMap().put("manufacturerId", car.getManufacturerId());
		model.getModelMap().put("year", car.getYear());
		model.getModelMap().put("sellerId", car.getSellerId());
		model.getModelMap().put("status", car.getStatus());
		model.getModelMap().put("price", car.getPrice());

		return model;
	}

	@RequestMapping(value="/car/view/{id}",method=RequestMethod.GET)
	public ModelAndView loadCar(@PathVariable Integer id){

		ModelAndView model = new ModelAndView();
		Car car = carDAO.loadCarById(id);

		model.setViewName("../CarView");
		model.addObject("car", car);
		model.addObject("manufacturer", manufacturerDAO.loadManufacturerById(car.getManufacturerId()));
		model.addObject("seller", sellerDAO.loadSellerById(car.getSellerId()));
		model.addObject("specification", specificationDAO.loadSpecificationByCarId(id));
		model.addObject("util", utilDAO.loadUtilByCarId(id));
		model.addObject("promotion", promotionDAO.loadPromotionByCarId(id));

		model.getModelMap().put("id", car.getId());
		model.getModelMap().put("name",car.getName());
		model.getModelMap().put("manufacturer", 
				manufacturerDAO.loadManufacturerById(car.getManufacturerId()));
		model.getModelMap().put("year", car.getYear());
		model.getModelMap().put("seller", sellerDAO.loadSellerById(car.getSellerId()));
		model.getModelMap().put("status", car.getStatus());
		model.getModelMap().put("price", car.getPrice());
		model.getModelMap().put("specification", specificationDAO.loadSpecificationByCarId(id));
		model.getModelMap().put("util", utilDAO.loadUtilByCarId(id));
		model.getModelMap().put("promotion", promotionDAO.loadPromotionByCarId(id));


		return model;	
	}

	@RequestMapping(value={"/car/list"},method=RequestMethod.GET)
	public ModelAndView listCar(
			@RequestParam(value="queryForName",required=false)String findByName,
			@RequestParam(value="queryForManu",required=false)String findByManu,
			@RequestParam(value="queryForYear",required=false)Integer findByYear,
			@RequestParam(value="queryForStatus",required=false )Boolean findByStatus){

		ModelAndView model = new ModelAndView("CarList");
		model.addObject("manufacturers", manufacturerDAO.listManufacturer());
		model.addObject("sellers", sellerDAO.listSeller());
		model.addObject("specification", specificationDAO.listSpecification());

		if(findByName!=null||findByManu!=null||findByYear!=null){
			if(findByYear == null){
				findByYear = 0;				
			}
			System.out.println("Manu ="+findByManu);
			System.out.println("Name ="+findByName);
			System.out.println("Year ="+findByYear);
			System.out.println("Status ="+findByStatus);
			
			model.addObject("cars", carDAO.multipleSearch(findByName, findByManu, findByYear, findByStatus));
		}else{
			model.addObject("cars", carDAO.listCar());
		}
		return model;
	}

	@RequestMapping(value="/car/form",method=RequestMethod.GET)
	public ModelAndView carForm(){
		ModelAndView model = new ModelAndView("CarForm","command",new Car());
		return model;		
	}


	@RequestMapping(value="/car/add",method=RequestMethod.POST )
	public ModelAndView addCar(@Valid 
			@ModelAttribute("command")Car car,	BindingResult rel,
			@RequestParam(value="id")Integer id
			//			@RequestParam(value="file")MultipartFile file,
			) throws IOException{

		ModelAndView mav = null;
		if(rel.hasErrors()){
			mav =new ModelAndView("CarForm","command",car);
			mav.addObject("error",rel);
			return mav;
		}
		if(carDAO.loadCarById(car.getId())!=null){
			carDAO.updateCar(car);
			mav=new ModelAndView("redirect:/car/form");
			return mav;
		}else{
			carDAO.insert(car);
		}
		mav = new ModelAndView("CarFormPicture");
		mav.getModelMap().put("id", id);
		return mav;
	}

	@RequestMapping(value="car/add-picture", method=RequestMethod.POST)
	public ModelAndView addPicture(
			@RequestParam(value="id")Integer id,
			@RequestParam("file")MultipartFile file,
			HttpServletRequest request) throws IOException{

		ModelAndView mav = null;
		if(file.isEmpty()){
			mav = new ModelAndView("CarError");
			return mav;
		}
		System.out.println("handleFormUpload invoked!!");
		ServletContext servletContext = request.getSession().getServletContext();
		String absoluteDiskPath = servletContext.getRealPath("/");

		File folder = new File(absoluteDiskPath+File.separator+"car"+File.separator+"img"+File.separator);
		if(!folder.exists()){
			folder.mkdirs();
		}
		File avatarFile = new File(folder,String.valueOf(id)+".jpg");
		if(!avatarFile.exists()) avatarFile.createNewFile();

		FileOutputStream outputStream = null;
		try{
			outputStream = new FileOutputStream(avatarFile);
			outputStream.write(file.getBytes());
		}finally{
			if(outputStream!=null) outputStream.close();
		}
		Specification spec = new Specification();
		spec.setCarId(id);
		mav = new ModelAndView("CarFormSpecification","command",spec);
		mav.getModelMap().put("carId", id);
		return mav;
	}

	@RequestMapping(value="car/add-specification",method=RequestMethod.POST)
	public ModelAndView addSpecification(
			@Valid@ModelAttribute("command")
			Specification spec,
			@RequestParam("carId")Integer id){

		ModelAndView mav = null;
		//		ModelAndView mav = new ModelAndView("CarFormSpecification");
		//		mav.addObject("command", spec);
		//		if(rel.hasErrors()){
		//			mav =new ModelAndView("CarFormSpecification","command",spec);
		//			mav.addObject("error",rel);
		//			return mav;
		//		}
		specificationDAO.insertSpecification(spec);
		Util util = new Util();
		util.setCarId(id);
		mav = new ModelAndView("CarFormUtilities","command",util);
		mav.getModelMap().put("carId", id);
		return mav;
	}

	@RequestMapping(value="car/add-utilities",method=RequestMethod.POST)
	public ModelAndView addUtilities(
			@Valid@ModelAttribute("command")
			Util util,
			@RequestParam(value="carId")Integer id){

		ModelAndView mav = null;
		//		mav.addObject("command", util);
		//		if(rel.hasErrors()){
		//			mav = new ModelAndView("CarFormUtilities","command",util);
		//			mav.addObject("error", rel);
		//			return mav;
		//		}
		utilDAO.insertUtil(util);
		mav = new ModelAndView("CarFormPromotion","command",new Promotion());
		mav.getModelMap().put("carId", id);

		return mav;
	}

	@RequestMapping(value="car/add-promotion",method=RequestMethod.POST)
	public ModelAndView addPromotion(
			@Valid@ModelAttribute("command")Promotion promotion,
			@RequestParam(value="carId")Integer id){
		ModelAndView mav = null;
		promotionDAO.insertPromotion(promotion);
		mav = new ModelAndView("redirect:/car/list");
		return mav;
	}

	@RequestMapping(value={"/car/img/save"},method=RequestMethod.POST)
	public String handleFormUpload(
			@RequestParam("id")Integer id,
			@RequestParam("file")MultipartFile file,
			HttpServletRequest request) throws IOException{

		System.out.println("handledfdfdfdff\n\n\n");
		System.out.println(file.getName());
		if(file.isEmpty()){
			return "CarError";
		}
		System.out.println("handleFormUpload invoked!!");
		ServletContext servletContext = request.getSession().getServletContext();
		String absoluteDiskPath = servletContext.getRealPath("/");

		File folder = new File(absoluteDiskPath+File.separator+"car"+File.separator+"img"+File.separator);
		if(!folder.exists()){
			folder.mkdirs();
		}
		File avatarFile = new File(folder,String.valueOf(id)+".jpg");
		if(!avatarFile.exists()) avatarFile.createNewFile();

		FileOutputStream outputStream = null;
		try{
			outputStream = new FileOutputStream(avatarFile);
			outputStream.write(file.getBytes());
		}finally{
			if(outputStream!=null) outputStream.close();
		}

		//		return "redirect:/car/view/"+String.valueOf(id);
		return "redirect:/car/list";
	}

	//	@RequestMapping(value="/car/add",method=RequestMethod.POST)
	//	public ModelAndView addCar(@Valid 
	//			@ModelAttribute("command")Car car,	BindingResult rel){
	//
	//		ModelAndView mav = null;
	//		if(rel.hasErrors()){
	//			mav =new ModelAndView("CarForm","command",car);
	//			mav.addObject("error",rel);
	//			return mav;
	//		}
	//		if(carDAO.loadCarById(car.getId())!=null){
	//			carDAO.updateCar(car);
	//			mav=new ModelAndView("redirect:/car/form");
	//			return mav;
	//		}else{
	//			carDAO.insert(car);
	//		}
	//		mav = new ModelAndView("redirect:/car/list");
	//		return mav;
	//	}
}
