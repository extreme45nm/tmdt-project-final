package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UtilMapper implements RowMapper<Util>{

	@Override
	public Util mapRow(ResultSet rs, int rowNum) throws SQLException {

		Util util = new Util();
		util.setCarId(rs.getInt("carId"));
		util.setAirBag(rs.getBoolean("airBag"));
		util.setSoundSystem(rs.getBoolean("soundSystem"));
		util.setWheel(rs.getBoolean("wheel"));
		
		return util;
	}
	
	
}
