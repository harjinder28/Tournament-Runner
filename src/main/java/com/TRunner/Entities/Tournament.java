package com.TRunner.Entities;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
//import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;
@Entity
public class Tournament {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int tid;
	String title;
	String tournamentType;
	String gametype;
	String gameName;
	String startDate;
	String startTime;
	String endDate;	
	String endTime;
	String tournamentDiscription;
	String tournamentVenue;
	String tournamentCity;
	int tournamentFee;
	int tournamentPrize;
	int tournamentNoOfTeams;
	@OneToOne
	User organizer;
	@ManyToMany
	List<Sponser> sponsers;
	public Tournament() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Tournament(int tid, String title, String tournamentType, String gametype, String gameName, String startDate,
			String startTime, String endDate, String endTime, String tournamentDiscription, String tournamentVenue,
			String tournamentCity, int tournamentFee, int tournamentPrize, int tournamentNoOfTeams, User organizer,
			List<Sponser> sponsers) {
		super();
		this.tid = tid;
		this.title = title;
		this.tournamentType = tournamentType;
		this.gametype = gametype;
		this.gameName = gameName;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
		this.tournamentDiscription = tournamentDiscription;
		this.tournamentVenue = tournamentVenue;
		this.tournamentCity = tournamentCity;
		this.tournamentFee = tournamentFee;
		this.tournamentPrize = tournamentPrize;
		this.tournamentNoOfTeams = tournamentNoOfTeams;
		this.organizer = organizer;
		this.sponsers = sponsers;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getTournamentDiscription() {
		return tournamentDiscription;
	}

	public void setTournamentDiscription(String tournamentDiscription) {
		this.tournamentDiscription = tournamentDiscription;
	}

	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTournamentType() {
		return tournamentType;
	}
	public void setTournamentType(String tournamentType) {
		this.tournamentType = tournamentType;
	}
	public String getGametype() {
		return gametype;
	}
	public void setGametype(String gametype) {
		this.gametype = gametype;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTournamentVenue() {
		return tournamentVenue;
	}
	public void setTournamentVenue(String tournamentVenue) {
		this.tournamentVenue = tournamentVenue;
	}
	public String getTournamentCity() {
		return tournamentCity;
	}
	public void setTournamentCity(String tournamentCity) {
		this.tournamentCity = tournamentCity;
	}
	public int getTournamentFee() {
		return tournamentFee;
	}
	public void setTournamentFee(int tournamentFee) {
		this.tournamentFee = tournamentFee;
	}
	public int getTournamentPrize() {
		return tournamentPrize;
	}
	public void setTournamentPrize(int tournamentPrize) {
		this.tournamentPrize = tournamentPrize;
	}
	public int getTournamentNoOfTeams() {
		return tournamentNoOfTeams;
	}
	public void setTournamentNoOfTeams(int tournamentNoOfTeams) {
		this.tournamentNoOfTeams = tournamentNoOfTeams;
	}
	public User getOrganizer() {
		return organizer;
	}
	public void setOrganizer(User organizer) {
		this.organizer = organizer;
	}

	public List<Sponser> getSponsers() {
		return sponsers;
	}

	public void setSponsers(List<Sponser> sponsers) {
		this.sponsers = sponsers;
	}

	@Override
	public String toString() {
		return "Tournament [tid=" + tid + ", title=" + title + ", tournamentType=" + tournamentType + ", gametype="
				+ gametype + ", gameName=" + gameName + ", startDate=" + startDate + ", startTime=" + startTime
				+ ", endDate=" + endDate + ", endTime=" + endTime + ", tournamentDiscription=" + tournamentDiscription
				+ ", tournamentVenue=" + tournamentVenue + ", tournamentCity=" + tournamentCity + ", tournamentFee="
				+ tournamentFee + ", tournamentPrize=" + tournamentPrize + ", tournamentNoOfTeams="
				+ tournamentNoOfTeams + ", organizer=" + organizer + ", sponsers=" + sponsers + "]";
	}

	
}
