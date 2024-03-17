package com.TRunner.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import com.TRunner.Entities.User;
import com.TRunner.Repositories.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class SignUpController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/signup")
	public String getMethodName() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String postMethodName(@ModelAttribute User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		System.out.println(user);
		userRepository.save(user);
		return "login";
	}
	
	
}
