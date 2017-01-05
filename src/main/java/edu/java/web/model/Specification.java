package edu.java.web.model;

public class Specification {
	
	private int carId;
	private String type;
	private int seat;
	private double engine;
	private double torque;
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public double getEngine() {
		return engine;
	}
	public void setEngine(double engine) {
		this.engine = engine;
	}
	public double getTorque() {
		return torque;
	}
	public void setTorque(double torque) {
		this.torque = torque;
	}
}
