package com.hemanshu;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {

private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository=userRepository;
	}
	

	
	public List<User> showAllUsers(){
		List<User> users = new ArrayList<User>();
		for(User user : userRepository.findAll()) {
			users.add(user);
		}
		
		return users;
	}
	
	public void deleteMyUser(int id) {
		userRepository.deleteById(id);
	}
	
	/*public User editUser(int id) {
		return userRepository.findById(id);
	}*/
	
	public User findByEmailIDAndPassword(String email,String pass) {
		return userRepository.findByEmailIDAndPassword(email, pass);
	}
	
	}
