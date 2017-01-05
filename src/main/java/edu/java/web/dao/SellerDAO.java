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
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import edu.java.web.model.CarMapper;
import edu.java.web.model.ManufacturerMapper;
import edu.java.web.model.PromotionMapper;
import edu.java.web.model.Seller;
import edu.java.web.model.SellerMapper;
import edu.java.web.model.SpecificationMapper;
import edu.java.web.model.UtilMapper;

public class SellerDAO {
	
	private static final Log log = LogFactory.getLog(SellerDAO.class);
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

	public List<Seller> listSeller(){
		sellerMapper = new SellerMapper();
		String sql = "SELECT * FROM Seller ";
		List<Seller> listSeller = templateObject.query(sql, sellerMapper);
		return 	listSeller;
	}
	
	public List<Seller> listSellerByName(String name){
		sellerMapper = new SellerMapper();
		String sql ="SELECT * FROM Seller WHERE name like ?";
		return templateObject.query(sql, new Object[]{'%'+name+'%'}, sellerMapper);
	}

//	public List<Seller> listSellerByManufacturer(int manufacturerId){
//		sellerMapper = new SellerMapper();
//		String sql ="SELECT * FROM Seller WHERE manufacturerId=?";
//		return templateObject.query(sql, new Object[]{manufacturerId}, sellerMapper);
//	}

//	public List<Seller> listSellerByStatus(boolean status){
//		sellerMapper = new SellerMapper();
//		String sql ="SELECT * FROM Seller WHERE status=?";
//		return templateObject.query(sql, new Object[]{status}, sellerMapper);
//	}

//	public Seller loadSellerByManufacturer(int manufacturerid){
//		sellerMapper = new SellerMapper();
//		String sql ="SELECT * FROM Seller WHERE manufacturerid ="; 
//		return templateObject.queryForObject(sql, new Object[]{manufacturerid}, sellerMapper);
//	}

	public Seller loadSellerByName(String name){
		sellerMapper = new SellerMapper();
		String sql ="SELECT * FROM Seller WHERE name like ?";
		return templateObject.queryForObject(sql, new Object[]{'%'+name+'%'}, sellerMapper);
	}

	public Seller loadSellerById(int id){
		try{
			sellerMapper = new SellerMapper();
			String sql = "SELECT * FROM Seller WHERE id = ?";
			return templateObject.queryForObject(sql,new Object[]{id}, sellerMapper);
		}catch(EmptyResultDataAccessException exc){
			return null;
		}
	}

	public void deleteSeller(int id){

		log.info("DELETED Record id="+id);
		String sql = "DELETE FROM Seller WHERE id = ?";
		templateObject.update(sql,id);		
	}

	public void updateSeller(Seller seller){

		String sql = "UPDATE Seller SET name=?,age=?,accountNumber=?,number=?,address=? WHERE id=?";
		templateObject.update(sql,seller.getName(),seller.getAge(),seller.getAccountNumber(),
				seller.getNumber(),seller.getAddress(),seller.getId());
		log.info("UPDATED Record in Seller with id="+seller.getId()+" name="+seller.getName());
	}
	
	public void insertSeller(final Seller seller){
		
		PreparedStatementCreator psc = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection konn) throws SQLException {
				 PreparedStatement stmt = konn.prepareStatement(insertSQL);
				 stmt.setInt(1, seller.getId());
				 stmt.setString(2, seller.getName());
				 stmt.setInt(3, seller.getAge());
				 stmt.setLong(4,seller.getAccountNumber());
				 stmt.setLong(5, seller.getNumber());
				 stmt.setString(6, seller.getAddress());
				return stmt;
			}
		};
		
		templateObject.update(psc);
		log.info("Kreated RECORD in Seller with id = "+seller.getId()+" name = "+seller.getName());
	}
	
	public void createTableSeller(String tableName,String createTableSQL) throws SQLException{
		
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
