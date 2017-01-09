package edu.java.spring.service;



import java.util.List;

import edu.java.spring.error.UserAlreadyExistException;
import edu.java.web.model.User;

public interface UserService {
	User registerNewUserAccount(User userAccount) throws UserAlreadyExistException;		
	
    User getUser(String verificationToken);

    void saveRegisteredUser(User user);
    
    User findUserByEmail(String email);
    
    List<String> getUsersFromSessionRegistry();
}
