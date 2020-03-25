/*package com.hemanshu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hemanshu.User;
import com.hemanshu.UserService;

//@Controller
public class ApplicationController {
	@Autowired
	UserService userService;
	
	

	@RequestMapping("/admin")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}

	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "welcomepage";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	} 

	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if(userService.findByEmailIDAndPassword(user.getEmailID(),user.getPassword())!=null) {
			return "homepage";
		}
		else {
			request.setAttribute("error", "Invalid email or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
			
		}
	}
	
	@GetMapping("/all-items")
	public String showAllItems(HttpServletRequest request) {
		request.setAttribute("items",ItemService.showAllItems());
		request.setAttribute("mode", "ALL_ITEMS");
		return "allitems";
	}
	
	@RequestMapping("/delete-items")
	
	public String deleteMyItem(@RequestParam int id, HttpServletRequest request) {
	   ItemService.deleteById(id);
		request.setAttribute("items", ItemService.showAllItems());
		request.setAttribute("mode", "ALL_ITEMS");
		return "allitems";
	}
	
	
	}   

*/
