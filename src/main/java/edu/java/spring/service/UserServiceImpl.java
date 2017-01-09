package edu.java.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.java.spring.error.UserAlreadyExistException;
import edu.java.web.dao.UserDAO;
import edu.java.web.model.User;

public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDao;
	
	@Override
	public User registerNewUserAccount(User userAccount) throws UserAlreadyExistException {
		 if(!userDao.emailExist(userAccount.getEmail())){
			 throw new UserAlreadyExistException(
					 "There is an account with that email address:"+userAccount.getEmail());
		 }
		 User user = new User();
		 user.setFullName(userAccount.getFullName());
		 user.setPassword(userAccount.getPassword());
		 user.setEmail(userAccount.getEmail());
		 user.setPhone(userAccount.getPhone());
		 user.setAddress(userAccount.getAddress());
		 user.setAccount(userAccount.getAccount());
		 
		 return userDao.addUser(user);
	}

	@Override
	public User getUser(String verificationToken) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveRegisteredUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getUsersFromSessionRegistry() {
		// TODO Auto-generated method stub
		return null;
	}

}
