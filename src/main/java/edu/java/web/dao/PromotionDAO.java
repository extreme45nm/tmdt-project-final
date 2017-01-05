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
import edu.java.web.model.Promotion;
import edu.java.web.model.PromotionMapper;
import edu.java.web.model.SellerMapper;
import edu.java.web.model.SpecificationMapper;
import edu.java.web.model.UtilMapper;

public class PromotionDAO {
	
	private static final Log log = LogFactory.getLog(PromotionDAO.class);
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

	public List<Promotion> listPromotion(){
		promotionMapper = new PromotionMapper();
		String sql = "SELECT * FROM Promotion ";
		List<Promotion> listPromotion = templateObject.query(sql, promotionMapper);
		return 	listPromotion;
	}
	
	public List<Promotion> listPromotionByName(String name){
		promotionMapper = new PromotionMapper();
		String sql ="SELECT * FROM Promotion WHERE name like ?";
		return templateObject.query(sql, new Object[]{'%'+name+'%'}, promotionMapper);
	}

//	public List<Promotion> listPromotionByManufacturer(int manufacturerId){
//		promotionMapper = new PromotionMapper();
//		String sql ="SELECT * FROM Promotion WHERE manufacturerId=?";
//		return templateObject.query(sql, new Object[]{manufacturerId}, promotionMapper);
//	}

//	public List<Promotion> listPromotionByStatus(boolean status){
//		promotionMapper = new PromotionMapper();
//		String sql ="SELECT * FROM Promotion WHERE status=?";
//		return templateObject.query(sql, new Object[]{status}, promotionMapper);
//	}

//	public Promotion loadPromotionByManufacturer(int manufacturerid){
//		promotionMapper = new PromotionMapper();
//		String sql ="SELECT * FROM Promotion WHERE manufacturerid ="; 
//		return templateObject.queryForObject(sql, new Object[]{manufacturerid}, promotionMapper);
//	}

	public Promotion loadPromotionByName(String name){
		promotionMapper = new PromotionMapper();
		String sql ="SELECT * FROM Promotion WHERE name like ?";
		return templateObject.queryForObject(sql, new Object[]{'%'+name+'%'}, promotionMapper);
	}

	public Promotion loadPromotionByCarId(int carId){
		promotionMapper = new PromotionMapper();
		String sql = "SELECT * FROM Promotion WHERE carId = ?";
		return templateObject.queryForObject(sql,new Object[]{carId}, promotionMapper);
	}


	public void deletePromotion(int carId){

		log.info("DELETED Record id="+carId);
		String sql = "DELETE FROM Promotion WHERE carId = ?";
		templateObject.update(sql,carId);		
	}

	public void updatePromotion(Promotion promotion){

		String sql = "UPDATE Promotion SET registerFee=?,insurance=?,discount=? WHERE carId=?";
		templateObject.update(sql,promotion.isRegisterFee(),promotion.isInsurance(),
				promotion.getDiscount(),promotion.getCarId());
		log.info("UPDATED Record in Promotion with carId="+promotion.getCarId()+" name=");
	}
	
	public void insertPromotion(final Promotion promotion){
		
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection konn) throws SQLException {
				 PreparedStatement stmt = konn.prepareStatement(insertSQL);
				 stmt.setInt(1, promotion.getCarId());
				 stmt.setBoolean(2, promotion.isRegisterFee());
				 stmt.setBoolean(3, promotion.isInsurance());
				 stmt.setDouble(4, promotion.getDiscount());
				return stmt;
			}
		};
		
		templateObject.update(psc);
		log.info("Kreated RECORD in Promotion with carId = "+promotion.getCarId());
	}
	
	
	public void createTablePromotion(String tableName,String createTableSQL) throws SQLException{
		
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
