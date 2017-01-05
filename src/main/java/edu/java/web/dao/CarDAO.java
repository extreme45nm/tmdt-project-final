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
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import edu.java.web.model.Car;
import edu.java.web.model.CarMapper;
import edu.java.web.model.Manufacturer;
import edu.java.web.model.ManufacturerMapper;
import edu.java.web.model.PromotionMapper;
import edu.java.web.model.SellerMapper;
import edu.java.web.model.SpecificationMapper;
import edu.java.web.model.UtilMapper;

public class CarDAO {

	private static final Log log = LogFactory.getLog(CarDAO.class);
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

	public List<Car> multipleSearch(String name,String manuName,Integer year, Boolean status){

		carMapper = new CarMapper();
		List<Car> listCar = templateObject.query("SELECT * FROM Car", new Object[]{},carMapper);
		
		if(status == null){
			System.out.println("Status is null");
			String sql = "SELECT * FROM Car ";
			listCar = templateObject.query(sql, new Object[]{},carMapper);
			if(name != ""){
				if(manuName.trim().length() == 0 && year==0){
					sql = "SELECT * From Car WHERE name like ?";
					listCar = templateObject.query(sql, new Object[]{'%' + name + '%'},carMapper);
				}
				if(manuName.trim().length() == 0 && year!=0){
					sql = "SELECT * From Car WHERE name like ? and year = ?";
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',year},carMapper);
				}
				if(manuName !=null && manuName.trim().length() > 0 && year==0){
					System.out.println("manuName=--"+manuName+"--");
					sql = "SELECT * From Car WHERE name like ? and manufacturerId = ?";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',manufacturer.getId()},carMapper);
				}
				if(manuName.trim().length() > 0 && year!=0){
					sql = "SELECT * From Car WHERE name like ? and manufacturerId = ? and year = ?";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',manufacturer.getId(),year},carMapper);
				}
			}else{
				if(manuName==""&&year==0){
					sql = "SELECT * From Car";
					listCar = templateObject.query(sql, new Object[]{},carMapper);
				}
				if(manuName==""&&year!=0){
					sql = "SELECT * From Car WHERE year = ?";
					listCar = templateObject.query(sql, new Object[]{year},carMapper);
				}
				if(manuName != null && manuName.trim().length() > 0&&year==0){
					sql = "SELECT * From Car WHERE  manufacturerId = ?";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{manufacturer.getId()},carMapper);
				}
				
				if(manuName != null && manuName.trim().length() > 0 && year!=0){
					sql = "SELECT * From Car WHERE manufacturerId = ? and year = ?";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{manufacturer.getId(),year},carMapper);
				}
			}
			return listCar;
		}
		
		if(status==true){
			System.out.println("Status is true");
			String sql = "SELECT * FROM Car WHERE status = 'true'";
			listCar = templateObject.query(sql, new Object[]{},carMapper);
			if(name != ""){
				if(manuName==""&&year==0){
					sql = "SELECT * From Car WHERE name like ? and status = 'true'";
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%'},carMapper);
				}
				if(manuName==""&&year!=0){
					sql = "SELECT * From Car WHERE name like ? and year = ? and status = 'true'";
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',year},carMapper);
				}
				
				if(manuName != null && !manuName.trim().isEmpty()){
					sql = "SELECT * From Car WHERE name like ? and manufacturerId = ? and status = 'true'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',manufacturer.getId()},carMapper);
				}
				if(manuName!=""&&year!=0){
					sql = "SELECT * From Car WHERE name like ? and manufacturerId = ? and year = ? and status = 'true'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',manufacturer.getId(),year},carMapper);
				}
			}else{
				if(manuName==""&&year==0){
					sql = "SELECT * From Car WHERE  status = 'true'";
					listCar = templateObject.query(sql, new Object[]{},carMapper);
				}
				if(manuName==""&&year!=0){
					sql = "SELECT * From Car WHERE year = ? and status = 'true'";
					listCar = templateObject.query(sql, new Object[]{year},carMapper);
				}
				if(manuName!=""&&year==0){
					sql = "SELECT * From Car WHERE  manufactturerId = ? and status = 'true'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{manufacturer.getId()},carMapper);
				}
				if(manuName!=""&&year!=0){
					sql = "SELECT * From Car WHERE manufacturerId = ? and year = ? and status = 'true'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{manufacturer.getId(),year},carMapper);
				}
			}
		}else{
			System.out.println("Status is false");
			String sql = "SELECT * FROM Car WHERE status = 'false'";
			listCar = templateObject.query(sql, new Object[]{},carMapper);
			if(name != ""){
				if(manuName==""&&year==0){
					sql = "SELECT * From Car WHERE name like ? and status = 'false'";
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%'},carMapper);
				}
				if(manuName==""&&year!=0){
					sql = "SELECT * From Car WHERE name like ? and year = ? and status = 'false'";
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',year},carMapper);
				}
				if(manuName!=""&&year==0){
					sql = "SELECT * From Car WHERE name like ? and manufacrturerId = ? and status = 'false'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',manufacturer.getId()},carMapper);
				}
				if(manuName!=""&&year!=0){
					sql = "SELECT * From Car WHERE name like ? and manufacturerId = ? and year = ? and status = 'false'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{'%'+name+'%',manufacturer.getId(),year},carMapper);
				}
			}else{
				if(manuName==""&&year==0){
					sql = "SELECT * From Car WHERE  status = 'false'";
					listCar = templateObject.query(sql, new Object[]{},carMapper);
				}
				if(manuName==""&&year!=0){
					sql = "SELECT * From Car WHERE year = ? and status = 'false'";
					listCar = templateObject.query(sql, new Object[]{year},carMapper);
				}
				if(manuName!=""&&year==0){
					sql = "SELECT * From Car WHERE  manufacrturerId = ? and status = 'false'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{manufacturer.getId()},carMapper);
				}
				if(manuName!=""&&year!=0){
					sql = "SELECT * From Car WHERE manufacturerId = ? and year = ? and status = 'false'";
					manufacturerMapper = new ManufacturerMapper();
					String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
					Manufacturer manufacturer = null;
					try{
						manufacturer = templateObject.queryForObject(sqlForManufacturer,
								new Object[]{'%'+manuName+'%'},manufacturerMapper);
					}catch(IncorrectResultSizeDataAccessException exc){
						exc.printStackTrace();
						return null;
					}
					listCar = templateObject.query(sql, new Object[]{manufacturer.getId(),year},carMapper);
				}
			}
		}
		
		return listCar;
	}
	
	public List<Car> listCarByName(String name){
//		carMapper = new CarMapper();
		String sql ="SELECT * FROM Car WHERE name like ?";
		System.out.println("carDAO.findByName() = "+name+"\n\n");
		return templateObject.query(sql, new Object[]{'%'+name+'%'}, carMapper);
	}

	public List<Car> listCarByManufacturer(int manufacturerId){
		carMapper = new CarMapper();
		String sql ="SELECT * FROM Car WHERE manufacturerId=?";
		return templateObject.query(sql, new Object[]{manufacturerId}, carMapper);
	}
	
	public List<Car> listCarByYear(int year){
		carMapper = new CarMapper();
		String sql = "SELECT * FROM Car WHERE year = ?";
		return templateObject.query(sql, new Object[]{year},carMapper);
	}
	
	public List<Car> listCarByManufacturerName(String manufacturerName){
		carMapper = new CarMapper();
		manufacturerMapper = new ManufacturerMapper();
		String sqlForManufacturer = "SELECT * FROM Manufacturer WHERE name like ?";
		Manufacturer manufacturer = null;
		try{
			manufacturer = templateObject.queryForObject(sqlForManufacturer,
					new Object[]{'%'+manufacturerName+'%'},manufacturerMapper);
		}catch(IncorrectResultSizeDataAccessException exc){
			exc.printStackTrace();
			return null;
		}
		String sql ="SELECT * FROM Car WHERE manufacturerid = ?"; 
		System.out.println("Manu facturer Name = "+manufacturer.getId());
		return templateObject.query(sql, new Object[]{manufacturer.getId()}, carMapper);
	}
	
	public List<Car> listCarByStatus(boolean status){
		carMapper = new CarMapper();
		String sql ="SELECT * FROM Car WHERE status=?";
		return templateObject.query(sql, new Object[]{status}, carMapper);
	}

	public Car loadCarByManufacturer(int manufacturerid){
		carMapper = new CarMapper();
		String sql ="SELECT * FROM Car WHERE manufacturerid ="; 
		return templateObject.queryForObject(sql, new Object[]{manufacturerid}, carMapper);
	}

	public Car loadCarByManufacturerName(String manufacturerName){
		carMapper = new CarMapper();
		String sqlForManufacturer = "SELECT * FROM Manufacturer where name like ?";
		Manufacturer manufacturer = templateObject.queryForObject(sqlForManufacturer,
				new Object[]{manufacturerName},manufacturerMapper);
		String sql ="SELECT * FROM Car WHERE manufacturerid ="; 
		return templateObject.queryForObject(sql, new Object[]{manufacturer.getId()}, carMapper);
	}

	public Car loadCarByName(String name){
		carMapper = new CarMapper();
		String sql ="SELECT * FROM Car WHERE name like ?";
		return templateObject.queryForObject(sql, new Object[]{'%'+name+'%'}, carMapper);
	}

	public Car loadCarById(int id){
		try{
			carMapper = new CarMapper();
			String sql = "SELECT * FROM Car WHERE id = ?";
			return templateObject.queryForObject(sql,new Object[]{id}, carMapper);
		}catch(EmptyResultDataAccessException exc){
			return null;
		}
	}

	public List<Car> listCar(){
		carMapper = new CarMapper();
		String sql = "SELECT * FROM Car ";
		List<Car> listCar = templateObject.query(sql, carMapper);
		return 	listCar;
	}



	public void deleteCar(int id){

		log.info("DELETED Record id="+id);
		String sql = "DELETE FROM Car WHERE id = ?";
		templateObject.update(sql,id);		
	}

	public void updateCar(Car car){

		String sql = "UPDATE Car SET name=?,manufacturerId=?,year=?,sellerId=?,status=?,price=? WHERE id=?";
		templateObject.update(sql,car.getName(),car.getManufacturerId(),car.getYear(),
				car.getSellerId(),car.getStatus(),car.getPrice(),car.getId());
		log.info("UPDATED Record with id="+car.getId()+" name="+car.getName());
	}

	public void insert(final Car car){

		PreparedStatementCreator psc = new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection konn) throws SQLException {
				PreparedStatement stmt = konn.prepareStatement(insertSQL);
				stmt.setInt(1, car.getId());
				stmt.setString(2, car.getName());
				stmt.setLong(3, car.getManufacturerId());
				stmt.setInt(4, car.getYear());
				stmt.setInt(5,car.getSellerId());
				stmt.setBoolean(6, car.getStatus());
				stmt.setInt(7, car.getPrice());

				return stmt;
			}
		};
		templateObject.update(psc);
		log.info("KREATED RECORD ID = "+car.getId());
	}


	public void createTableCar(String tableName,String createTableSQL) throws SQLException{

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
