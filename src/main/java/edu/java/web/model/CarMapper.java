package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CarMapper implements RowMapper<Car>{
	
	

	@Override
	public Car mapRow(ResultSet rs, int rowNum) throws SQLException {
		Car car = new Car();
		
		car.setId(rs.getInt("id"));
		car.setName(rs.getString("name"));
		car.setManufacturerId(rs.getInt("manufacturerId"));
		car.setYear(rs.getInt("year"));
		car.setSellerId(rs.getInt("sellerId"));
		car.setStatus(rs.getBoolean("status"));
		car.setPrice(rs.getInt("price"));
		return car;
	}
	
}
