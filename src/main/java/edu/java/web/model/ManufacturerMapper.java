package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ManufacturerMapper implements RowMapper<Manufacturer>{

	@Override
	public Manufacturer mapRow(ResultSet rs, int rowNum) throws SQLException {

		Manufacturer manu = new Manufacturer();
		manu.setId(rs.getLong("id"));
		manu.setName(rs.getString("name"));
		
	    return manu;
	}	
}
