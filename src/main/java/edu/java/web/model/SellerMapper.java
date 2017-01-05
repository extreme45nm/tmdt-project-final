package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class SellerMapper implements RowMapper<Seller>{

	@Override
	public Seller mapRow(ResultSet rs, int rowNum) throws SQLException {

		Seller seller = new Seller();
		seller.setId(rs.getInt("id"));
		seller.setName(rs.getString("name"));
		seller.setAge(rs.getInt("age"));
		seller.setAccountNumber(rs.getLong("accountNumber"));
		seller.setNumber(rs.getLong("number"));
		seller.setAddress(rs.getString("address"));
		return seller;
	}
	
}
