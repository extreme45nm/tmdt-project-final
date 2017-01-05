package edu.java.web.model;

public class Promotion {
	
	private int carId;
	private boolean registerFee;
//	private boolean warranty;
	private boolean insurance;
	private double discount;
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public boolean isRegisterFee() {
		return registerFee;
	}
	public void setRegisterFee(boolean registerFee) {
		this.registerFee = registerFee;
	}
//	public boolean isWarranty() {
//		return warranty;
//	}
//	public void setWarranty(boolean warranty) {
//		this.warranty = warranty;
//	}
	public boolean isInsurance() {
		return insurance;
	}
	public void setInsurance(boolean insurance) {
		this.insurance = insurance;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	
	
}
