package com.TRunner.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Repository;

import com.TRunner.Entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	public User findByEmail(String email);
//	public User addUser
}
