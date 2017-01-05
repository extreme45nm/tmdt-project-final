package edu.java.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MemberMapper implements RowMapper<Member>{

	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		 
		Member member = new Member();
		member.setId(rs.getInt("id"));
		member.setName(rs.getString("name"));
		member.setAge(rs.getInt("age"));
//		member.setAccountNumber(rs.getLong("accountNumber"));
		member.setNumber(rs.getLong("number"));
		member.setAddress(rs.getString("address"));
		return null;
	}

}
