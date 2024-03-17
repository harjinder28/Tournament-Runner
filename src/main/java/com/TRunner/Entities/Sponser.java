package com.TRunner.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class Sponser {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int sId;
	String sName;
	public Sponser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sponser(int sId, String sName) {
		super();
		this.sId = sId;
		this.sName = sName;
	}
	
}
