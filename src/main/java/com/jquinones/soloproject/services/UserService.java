package com.jquinones.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jquinones.soloproject.models.LoginUser;
import com.jquinones.soloproject.models.User;
import com.jquinones.soloproject.repositories.UserRepository;
    
@Service
public class UserService {
    
    @Autowired
    private UserRepository repo;
    
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        // TO-DO: Additional validations!
    	// Get user email if it exist
    	Optional<User> potentialUser = repo.findByEmail(newUser.getEmail());
    	
    	//Check if the email exist in the db
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "An accoount with that email already exist!");
    	}
    	//compare password to confirm password
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Matches", "The confirm password must match the password!");
    	}
    	
    	if(result.hasErrors()) {
            return null;
    	}
    	//add salt and hash password
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
		return repo.save(newUser);
    }
    
    
    
    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO: Additional validations!
    	Optional<User> potentialUser = repo.findByEmail(newLoginObject.getEmail());
    	
    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Invalid Credentials");
    		return null;
    	}
    	
    	User user = potentialUser.get();
        
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Credentials!");
    	}
    	
    	if(result.hasErrors()) {
        	return null;
        }

    	return user;

    }
    
    public List<User> getAll() {
    	return repo.findAll();
    }
    
    public User getOne(Long id) {
    	return repo.findById(id).orElse(null);
    }
    
    public User update(User s) {
    	return repo.save(s);
    }
}