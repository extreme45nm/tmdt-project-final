package edu.java.web.model;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class Car {
	
	private int id;
	private String name;
	private long manufacturerId;
	private int year;
	private boolean status;
	private int sellerId;
	private int price;
//	private MultipartFile file;
//	
//	
//	public MultipartFile getFile() {
//		return file;
//	}
//	public void setFile(MultipartFile file) {
//		this.file = file;
//	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(long manufacturerId) {
		this.manufacturerId = manufacturerId;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
