package com.TRunner.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.TRunner.Entities.User;
import com.TRunner.Repositories.UserRepository;

public class CustomUserDetailService implements UserDetailsService{
	@Autowired
	public UserRepository userRepository;
	
//	CustomUserDetailService(UserRepository usr){
//		this.userRepository=usr;
//	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// fetching user from DB
		User user = userRepository.findByEmail(username);
		if(user==null) {
			throw new UsernameNotFoundException("Couldn't find user !!");
		}
		CustomUserDetails customUserDetails=new CustomUserDetails(user);
		return customUserDetails;
	}

}
