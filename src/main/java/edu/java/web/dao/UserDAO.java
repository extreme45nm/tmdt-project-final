package edu.java.web.dao;

import edu.java.web.model.User;

public class UserDAO {

	
	public void registerNewUserAccount(final User user){
		
	}
	
	private boolean emailExist(String email){
		User user = findByEmail(email); 
		if(user == null){
			return false;
		}
		return true;
	}
	
	public User findByEmail(String email){
		return null;
	}
}
