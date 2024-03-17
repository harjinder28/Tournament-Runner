package com.TRunner.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TRunner.Entities.Tournament;
import com.TRunner.Repositories.TournamentRepository;



@Controller
@RequestMapping("/user")
public class CreateController {
	@Autowired
	TournamentRepository repository;
	
	@GetMapping("/createTournament")
	public String createTournament(){
		return "createtm";
	}
	
	@PostMapping("/createTournament")
	public String postMethodName(@ModelAttribute Tournament tournament) {
		//TODO: process POST request
		System.out.println(tournament);
		repository.save(tournament);
		return "viewtm";
	}
	
}
