package edu.java.web.dao;

import edu.java.web.model.User;

public class UserDAO {

	
	public User registerNewUserAccount(final User user){
		return null;
	}
	
	public boolean emailExist(String email){
		User user = findByEmail(email); 
		if(user == null){
			return false;
		}
		return true;
	}
	
	public User findByEmail(String email){
		return null;
	}
	
	public User addUser(final User user){
		return null;
	}
}
