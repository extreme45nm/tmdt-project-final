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
import edu.java.web.model.SpecificationMapper;
import edu.java.web.model.Util;
import edu.java.web.model.UtilMapper;

public class UtilDAO {
	
	private static final Log log = LogFactory.getLog(UtilDAO.class);
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

	public List<Util> listUtilByAirbag(){
		utilMapper = new UtilMapper();
		String sql ="SELECT * FROM Util WHERE airBag=true";
		return templateObject.query(sql, new Object[]{}, utilMapper);
	}

	public List<Util> listUtilByCarId(int carId){
		utilMapper = new UtilMapper();
		String sql ="SELECT * FROM Util WHERE carId=?";
		return templateObject.query(sql, new Object[]{carId}, utilMapper);
	}

	public List<Util> listUtilBySoundSystem(){
		utilMapper = new UtilMapper();
		String sql ="SELECT * FROM Util WHERE soundSystem=true";
		return templateObject.query(sql, new Object[]{}, utilMapper);
	}
	
	public List<Util> listUtilByWheel(){
		utilMapper = new UtilMapper();
		String sql ="SELECT * FROM Util WHERE wheel=true";
		return templateObject.query(sql, new Object[]{}, utilMapper);
	}

	public Util loadUtilByCarId(int carId){
		utilMapper = new UtilMapper();
		String sql ="SELECT * FROM Util WHERE carId = ?"; 
		return templateObject.queryForObject(sql, new Object[]{carId}, utilMapper);
	}

	public Util loadUtilByAirBag(){
		utilMapper = new UtilMapper();
		String sql ="SELECT * FROM Util WHERE airBag=true";
		return templateObject.queryForObject(sql, new Object[]{}, utilMapper);
	}

	public Util loadUtilByWheel(){
		utilMapper = new UtilMapper();
		String sql = "SELECT * FROM Util WHERE wheel=true";
		return templateObject.queryForObject(sql,new Object[]{}, utilMapper);
	}
	
	public Util loadUtilBySoundSystem(){
		utilMapper = new UtilMapper();
		String sql = "SELECT * FROM Util WHERE soundSystem=true";
		return templateObject.queryForObject(sql,new Object[]{}, utilMapper);
	}

	public List<Util> listUtil(){
		utilMapper = new UtilMapper();
		String sql = "SELECT * FROM Util ";
		List<Util> listUtil = templateObject.query(sql, utilMapper);
		return 	listUtil;
	}



	public void deleteUtil(int id){

		log.info("DELETED Record id="+id);
		String sql = "DELETE FROM Util WHERE id = ?";
		templateObject.update(sql,id);		
	}

	public void updateUtil(Util util){

		String sql = "UPDATE Util SET airbag=?,soundsystem=?,wheel=? WHERE carId=?";
		templateObject.update(sql,util.isAirBag(),util.isSoundSystem(),util.isWheel(),
				util.getCarId());
		log.info("UPDATED Record in Util with carId="+util.getCarId());
	}
	
	public void insertUtil(final Util util){
		
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection konn) throws SQLException {
				 PreparedStatement stmt = konn.prepareStatement(insertSQL);
				 stmt.setInt(1, util.getCarId());
				 stmt.setBoolean(2, util.isAirBag());
				 stmt.setBoolean(3, util.isSoundSystem());
				 stmt.setBoolean(4, util.isWheel());
				return stmt;
			}
		};
		
		templateObject.update(psc);
		log.info("Kreated RECORD in Util with carId = "+util.getCarId());
	}
	
	
	public void createTableUtil(String tableName,String createTableSQL) throws SQLException{
		
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
