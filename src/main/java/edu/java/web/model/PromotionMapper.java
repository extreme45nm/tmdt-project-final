package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PromotionMapper implements RowMapper<Promotion>{

	@Override
	public Promotion mapRow(ResultSet rs, int rowNum) throws SQLException {

		Promotion promotion = new Promotion();
		promotion.setCarId(rs.getInt("carId"));
		promotion.setRegisterFee(rs.getBoolean("registerFee"));
//		promotion.setWarranty(rs.getBoolean("warranty"));
		promotion.setInsurance(rs.getBoolean("insurance"));		
		promotion.setDiscount(rs.getDouble("discount"));
		return promotion;
	}
	
	
}
