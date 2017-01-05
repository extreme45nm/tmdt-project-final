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
import edu.java.web.model.Manufacturer;
import edu.java.web.model.ManufacturerMapper;
import edu.java.web.model.PromotionMapper;
import edu.java.web.model.SellerMapper;
import edu.java.web.model.SpecificationMapper;
import edu.java.web.model.UtilMapper;

public class ManufacturerDAO {
	
	private static final Log log = LogFactory.getLog(ManufacturerDAO.class);
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

	public List<Manufacturer> listManufacturer(){
		manufacturerMapper = new ManufacturerMapper();
		String sql = "SELECT * FROM Manufacturer ";
		List<Manufacturer> listManufacturer = templateObject.query(sql, manufacturerMapper);
		return 	listManufacturer;
	}
	
	public List<Manufacturer> listManufacturerByName(String name){
		manufacturerMapper = new ManufacturerMapper();
		String sql ="SELECT * FROM Manufacturer WHERE name like ?";
		return templateObject.query(sql, new Object[]{'%'+name+'%'}, manufacturerMapper);
	}

//	public List<Manufacturer> listManufacturerByManufacturer(int manufacturerId){
//		manufacturerMapper = new ManufacturerMapper();
//		String sql ="SELECT * FROM Manufacturer WHERE manufacturerId=?";
//		return templateObject.query(sql, new Object[]{manufacturerId}, manufacturerMapper);
//	}

//	public List<Manufacturer> listManufacturerByStatus(boolean status){
//		manufacturerMapper = new ManufacturerMapper();
//		String sql ="SELECT * FROM Manufacturer WHERE status=?";
//		return templateObject.query(sql, new Object[]{status}, manufacturerMapper);
//	}

//	public Manufacturer loadManufacturerByManufacturer(int manufacturerid){
//		manufacturerMapper = new ManufacturerMapper();
//		String sql ="SELECT * FROM Manufacturer WHERE manufacturerid ="; 
//		return templateObject.queryForObject(sql, new Object[]{manufacturerid}, manufacturerMapper);
//	}

	public Manufacturer loadManufacturerByName(String name){
		manufacturerMapper = new ManufacturerMapper();
		String sql ="SELECT * FROM Manufacturer WHERE name like ?";
		return templateObject.queryForObject(sql, new Object[]{'%'+name+'%'}, manufacturerMapper);
	}

	public Manufacturer loadManufacturerById(long id){
		manufacturerMapper = new ManufacturerMapper();
		String sql = "SELECT * FROM Manufacturer WHERE id = ?";
		return templateObject.queryForObject(sql,new Object[]{id}, manufacturerMapper);
	}


	public void deleteManufacturer(int id){

		log.info("DELETED Record id="+id);
		String sql = "DELETE FROM Manufacturer WHERE id = ?";
		templateObject.update(sql,id);		
	}

	public void updateManufacturer(Manufacturer manufacturer){

		String sql = "UPDATE Manufacturer SET name=? WHERE id=?";
		templateObject.update(sql,manufacturer.getName(),manufacturer.getId());
		log.info("UPDATED Record in Manufacturer with id="+manufacturer.getId()+" name="+manufacturer.getName());
	}
	
	public void insertManufacturer(final Manufacturer manufacturer){
		
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection konn) throws SQLException {
				 PreparedStatement stmt = konn.prepareStatement(insertSQL);
				 stmt.setLong(1, manufacturer.getId());
				 stmt.setString(2, manufacturer.getName());
				return stmt;
			}
		};
		
		templateObject.update(psc);
		log.info("Kreated RECORD in Manufacture id = "+manufacturer.getId()
							+" name = "+manufacturer.getName());
	}
	
	public void createTableManufacturer(String tableName,String createTableSQL) throws SQLException{
		
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
