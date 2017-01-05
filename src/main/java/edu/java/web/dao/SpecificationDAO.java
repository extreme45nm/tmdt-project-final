package edu.java.web.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import edu.java.web.model.CarMapper;
import edu.java.web.model.ManufacturerMapper;
import edu.java.web.model.PromotionMapper;
import edu.java.web.model.SellerMapper;
import edu.java.web.model.Specification;
import edu.java.web.model.SpecificationMapper;
import edu.java.web.model.UtilMapper;

public class SpecificationDAO {
	
	private static final Log log = LogFactory.getLog(SpecificationDAO.class);
	private DataSource dataSource;
	private JdbcTemplate templateObject;
	private String insertSQL;
	
	@Autowired
	@Qualifier("carMapper")
	CarMapper carMapper;

	@Autowired
	@Qualifier("manufacturerMapper")
	ManufacturerMapper manufacturerMapper;

	@Autowired
	@Qualifier("specificationMapper")
	SpecificationMapper specificationMapper;

	@Autowired
	@Qualifier("promotionMapper")
	PromotionMapper promotionMapper;

	@Autowired
	@Qualifier("utilMapper")
	UtilMapper utilMapper;

	@Autowired
	@Qualifier("sellerMapper")
	SellerMapper sellerMapper;

	public List<Specification> listSpecificationBySeat(int seat){
		specificationMapper = new SpecificationMapper();
		String sql ="SELECT * FROM Specification WHERE seat = ?";
		return templateObject.query(sql, new Object[]{seat}, specificationMapper);
	}

	public List<Specification> listSpecificationByType(String type){
		specificationMapper = new SpecificationMapper();
		String sql ="SELECT * FROM Specification WHERE type like ?";
		return templateObject.query(sql, new Object[]{'%'+type+'%'}, specificationMapper);
	}

//	public List<Specification> listSpecificationByStatus(boolean status){
//		specificationMapper = new SpecificationMapper();
//		String sql ="SELECT * FROM Specification WHERE status=?";
//		return templateObject.query(sql, new Object[]{status}, specificationMapper);
//	}

	public Specification loadSpecificationBySeat(int seat){
		specificationMapper = new SpecificationMapper();
		String sql ="SELECT * FROM Specification WHERE seat = ?"; 
		return templateObject.queryForObject(sql, new Object[]{seat}, specificationMapper);
	}

	public Specification loadSpecificationByType(String type){
		specificationMapper = new SpecificationMapper();
		String sql ="SELECT * FROM Specification WHERE type like ?";
		return templateObject.queryForObject(sql, new Object[]{'%'+type+'%'}, specificationMapper);
	}

	public Specification loadSpecificationByCarId(int carId){
		specificationMapper = new SpecificationMapper();
		String sql = "SELECT * FROM Specification WHERE carId = ?";
		return templateObject.queryForObject(sql,new Object[]{carId}, specificationMapper);
	}

	public List<Specification> listSpecification(){
		specificationMapper = new SpecificationMapper();
		String sql = "SELECT * FROM Specification ";
		List<Specification> listSpecification = templateObject.query(sql, specificationMapper);
		return 	listSpecification;
	}

		
	public void deleteSpecification(int carId){

		log.info("DELETED Record in Specification with carId = "+carId);
		String sql = "DELETE FROM Specification WHERE carId = ?";
		templateObject.update(sql,carId);		
	}

	public void updateSpecification(Specification specification){

		String sql = "UPDATE Specification SET type=?,seat=?,engine=?,torque=? WHERE carId=?";
		templateObject.update(sql,specification.getType(),specification.getSeat(),
				specification.getEngine(),specification.getTorque(),specification.getCarId());
		log.info("UPDATED Record in Specification with carId ="+specification.getCarId());
	}
	
	public void insertSpecification(final Specification specification){
		
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection konn) throws SQLException {
				 PreparedStatement stmt = konn.prepareStatement(insertSQL);
				 stmt.setInt(1, specification.getCarId());
				 stmt.setString(2, specification.getType());
				 stmt.setInt(3, specification.getSeat());
				 stmt.setDouble(4, specification.getEngine());
				 stmt.setDouble(5, specification.getTorque());
				return stmt;
			}
		};
		System.out.println("specification.carId() = "+specification.getCarId()+"\n\n");
		templateObject.update(psc);
		log.info("Kreated RECORD in Specification with carId = "+specification.getCarId());
	}
	
	public void createTableSpecification(String tableName,String createTableSQL) throws SQLException{
		
		DatabaseMetaData dbmd = dataSource.getConnection().getMetaData();
		ResultSet rs = dbmd.getTables(null, null, tableName.toUpperCase(), null);
		if(rs.next()){
			log.info("\nTable "+tableName+" already exists!!\n");
			return;
		}else{
			templateObject.execute(createTableSQL);
			log.info("\n Created table "+tableName+" !\n");
		}
		
	}
	
	public void shutdown(){
	
		try{
			dataSource.getConnection().close();
		}catch (SQLException exc){
			log.error(exc);
		}
		try{
			log.info("\n\n shutdown Database!\n\n");
			DriverManager.getConnection("jdbc:sqlserver:;shutdown=true");
		}catch(SQLException exc){
			log.error(exc);
		}
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		templateObject = new JdbcTemplate(dataSource);
	}
	public String getInsertSQL() {
		return insertSQL;
	}
	public void setInsertSQL(String insertSQL) {
		this.insertSQL = insertSQL;
	}
	public static Log getLog() {
		return log;
	}	
}
