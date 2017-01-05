package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class SpecificationMapper implements RowMapper<Specification>{

	@Override
	public Specification mapRow(ResultSet rs, int rowNum) throws SQLException {

		Specification specification = new Specification();
		specification.setCarId(rs.getInt("carId"));
		specification.setType(rs.getString("type"));
		specification.setSeat(rs.getInt("seat"));		
		specification.setEngine(rs.getDouble("engine"));
		specification.setTorque(rs.getDouble("torque"));
		return specification;
	}
	
}
