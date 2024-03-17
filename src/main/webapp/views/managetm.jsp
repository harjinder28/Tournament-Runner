<%@page import="com.HS.TeamOBJ"%>
<%@page import="com.HS.TournamentView"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>GMT - Manage Tournament</title>
<link rel="stylesheet" type="text/css" href="/css/managetm.css">
<script src="js/managetm.js" type="text/javascript"></script>


</head>
<body>
	<nav>
		<div class="navcontainer">
			<h1>GMT</h1>
			<div>
				<ul>
					<li><a href="firstpage.jsp" class="active">Home</a></li>
					<li><a href="<%=TournamentView.viewTournament%>">View Your
							Tournaments</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="sidebar">
			<ul class="sidebar-menu">
				<li id="o1" class="menu-item active item"
					onclick="showSection('overview','o1')">Overview</li>
				<li id="o2" class="menu-item"
					onclick="showSection('addTeamPlayers','o2')">Team and Players</li>
				<li id="o3" class="menu-item"
					onclick="showSection('setupBracket','o3')">Bracket</li>
				<li id="o4" class="menu-item"
					onclick="showSection('tournamentResults','o4')">Results</li>
				<!-- Add more menu items as needed -->
			</ul>
		</div>

		<div class="content">
			<div id="overview" class="section active">
				<h2>Overview</h2>

				<!-- Display tournament details here -->
				<label>TournamentTitle</label><br> <input type="text"
					class="input-field" id="TournamentTitle" name="TournamentTitle"
					disabled
					value='<%=session.getAttribute("tournamentTitle").toString()%>'><input
					type="button" value="Update" id="UpdateTournamentTitle"
					class="update-btn btnupd" data-field="TournamentTitle"
					id="UpdateTournamentTitle"><br> <label>Game
					Type</label><br> <select class="input-field" id="TournamentGameType"
					name="TournamentGameType" disabled>
					<option
						value='<%=session.getAttribute("tournamentgameType").toString()%>'
						disabled selected><%=session.getAttribute("tournamentgameType").toString()%></option>
					<option value="sports">Sports</option>
					<option value="esports">Esports</option>
				</select><input type="button" value="Update" id="UpdateTournamentGameType"
					class="update-btn btnupd" data-field="TournamentGameType"
					id="UpdateTournamentGameType"><br> <label>Game
					Name</label><br> <select class="input-field" id="tournamentgameName"
					name="tournamentgameName" disabled>
					<option
						value='<%=session.getAttribute("tournamentgameName").toString()%>'
						disabled selected><%=session.getAttribute("tournamentgameName").toString()%></option>
					<!-- Sports Games -->
					<optgroup label="Sports Games">
						<option value="football">Football</option>
						<option value="basketball">Basketball</option>
						<option value="tennis">Tennis</option>
						<option value="golf">Golf</option>
					</optgroup>
					<!-- Esports Games -->
					<optgroup label="Esports Games">
						<option value="dota2">Dota 2</option>
						<option value="leagueoflegends">League of Legends</option>
						<option value="counterstrike">Counter-Strike: Global
							Offensive</option>
						<option value="overwatch">Overwatch</option>
						<option value="Valorant">Valorant</option>
					</optgroup>
				</select><input type="button" value="Update" id="UpdatetournamentgameName"
					class="update-btn btnupd" data-field="tournamentgameName"
					id="UpdatetournamentgameName"><br> <label>Tournament
					Type</label><br> <select class="input-field" id="TournamentType"
					name="TournamentType" disabled>
					<option value="value="
						<%=session.getAttribute("tournamentType").toString()%> disabled
						selected><%=session.getAttribute("tournamentType").toString()%></option>
					<option value="single">Single Elimination</option>
					<option value="double">Double Elimination</option>
					<option value="round-robin">Round Robin</option>
				</select><input type="button" value="Update" id="UpdateTournamentType"
					class="update-btn btnupd" data-field="TournamentType"
					id="UpdateTournamentType"><br> <label>Start
					Date</label><br> <input type="date"
					value='<%=session.getAttribute("tournamentStartDate").toString()%>'
					class="input-field" id="StartDate" name="StartDate" disabled><input
					type="button" value="Update" id="UpdatestartDate"
					class="update-btn btnupd" data-field="StartDate"
					id="UpdatestartDate"><br> <label>Start Time</label><br>
				<input type="time"
					value='<%=session.getAttribute("tournamentStartTime").toString()%>'
					class="input-field" id="StartTime" name="StartTime" disabled><input
					type="button" value="Update" id="UpdatestartTime"
					class="update-btn btnupd" data-field="StartTime"
					id="UpdatestartTime"><br> <label>End Date</label><br>
				<input type="date"
					value='<%=session.getAttribute("tournamentEndDate").toString()%>'
					class="input-field" id="EndDate" name="EndDate" disabled><input
					type="button" value="Update" id="UpdateendDate"
					class="update-btn btnupd" data-field="EndDate" id="UpdateendDate"><br>
				<label>End Time</label><br> <input type="time"
					value='<%=session.getAttribute("tournamentEndTime").toString()%>'
					class="input-field" id="EndTime" name="EndTime" disabled><input
					type="button" value="Update" id="UpdateendTime"
					class="update-btn btnupd" data-field="EndTime" id="UpdateendTime"><br>
				<label>Description</label><br>
				<textarea placeholder="Description" class="input-field"
					id="tournamentDiscription" name="tournamentDiscription" disabled
					cols="" rows=""><%=session.getAttribute("tournamentDiscription").toString()%></textarea>
				<input type="button" value="Update" id="UpdatetournamentDiscription"
					class="update-btn btnupd" data-field="tournamentDiscription"
					id="UpdatetournamentDiscription"><br> <label>Venue</label><br>
				<br> <input type="text" placeholder="Venue"
					id="tournamentVenue" name="tournamentVenue"
					value='<%=session.getAttribute("tournamentVenue").toString()%>'
					class="input-field" id="tournamentVenue" disabled><input
					type="button" value="Update" id="UpdatetournamentVenue"
					class="update-btn btnupd" data-field="tournamentVenue"
					id="UpdatetournamentVenue"><br> <label>Organizer
					Name</label><br> <input type="text" placeholder=" "
					class="input-field" id="organizerName" name="organizerName"
					disabled
					value='<%=session.getAttribute("tournamentOrganizerName").toString()%>'><input
					type="button" value="Update" id="UpdateorganizerName"
					class="update-btn btnupd" data-field="organizerName"
					id="UpdateorganizerName"><br> <label>Sponser
					Name</label><br> <input type="text" placeholder=" "
					class="input-field" id="sponserName" name="sponserName" disabled
					value='<%=session.getAttribute("tournamentSponserName").toString()%>'><input
					type="button" value="Update" id="UpdatesponserName"
					class="update-btn btnupd" data-field="sponserName"
					id="UpdatesponserName"><br> <label>No. of
					Teams</label><br> <input type="number" placeholder="No. of Teams"
					id="tournamentMaxTeam" name="tournamentMaxTeam" disabled
					value='<%=session.getAttribute("tournamentMaxTeam").toString()%>'
					class="input-field" id="noOfTeams"><input type="button"
					value="Update" id="UpdatenoOfTeams" class="update-btn btnupd"
					data-field="tournamentMaxTeam" id="UpdatenoOfTeams"><br>
				<label>Entry Fee</label><br> <input type="number"
					placeholder="Entry Fee" id="tournamentFee" name="tournamentFee"
					value='<%=session.getAttribute("tournamentgameType").toString()%>'
					class="input-field" id="tournamentFee" disabled><input
					type="button" value="Update" id="UpdatetournamentFee"
					class="update-btn btnupd" data-field="tournamentgameType"
					id="UpdatetournamentFee"><br> <label>Prize
					Pool</label><br> <input type="text" placeholder="Prize Pool"
					id="tournamentPrize" name="tournamentPrize"
					value='<%=session.getAttribute("tournamentPrize").toString()%>'
					class="input-field" id="tournamentPrize" disabled><input
					type="button" value="Update" id="UpdatetournamentPrize"
					class="update-btn btnupd" data-field="tournamentPrize"
					id="UpdatetournamentPrize"><br> <label>City</label><br>
				<input type="text" placeholder="City" id="tournamentCity"
					name="tournamentCity"
					value='<%=session.getAttribute("tournamentCity").toString()%>'
					class="input-field" id="tournamentCity" disabled><input
					type="button" value="Update" id="UpdatetournamentCity"
					class="update-btn btnupd" data-field="tournamentCity"
					id="UpdatetournamentCity">
			</div>




			<div id="addTeamPlayers" class="section">
				<h2>Add Team and Players</h2>
				<div class="multitab">
					<div class="tab-header">
						<div class="tab-item tabactive" onclick="showTab('team')">Team</div>
						<div class="tab-item" onclick="showTab('referee')">Referee</div>
					</div>
					<div class="tab-content">
						<div id="team" class="tab tabactive">
							<div class="teamTableDiv">
								<table id="teamTable">
									<thead>
										<tr>
											<th>Team ID</th>
											<th>Team Name</th>
											<th>Team Description</th>
											<th>No. of Players</th>
										</tr>
									</thead>
									<tbody>
    								<%@include file="Alert_JSPs/dynamicManage.jsp"%>
									</tbody>
								</table>
							</div>
							<button id="addTeam" onclick="showAddTeamModal()">+ Add Team</button>
						</div>
						<div id="referee" class="tab">
							<!-- Your referee content here -->
						</div>
					</div>
				</div>
				<!-- Popup modal for adding a team -->
				<div class="overlayTeam hiddendiv">
					<div class="popup-content">
						<h2>Add Team</h2>
						<form id="addTeamForm" action="<%=TournamentView.addteam%>"
							method="post">
							<input type="text" placeholder="Team Name" id="teamName"
								class="input-field" name="teamName"> <input type="text"
								placeholder="Team Description" id="teamDescription"
								class="input-field" name="teamDescription"> <input
								type="text" placeholder="Number Of Players" id="noOfPlayer"
								class="input-field" name="noOfPlayer">
							<div>
								<input type="submit" id="savebtn" value="Save"> <input
									type="button" id="closebtn" value="close" class="close-btn" onclick="hideAddTeamModal()">
							</div>
						</form>
					</div>
				</div>
			</div>

			<div id="setupBracket" class="section">
				<h2>Setup Tournament Bracket</h2>
				<form method="POST" id="form" action="">
					<label for="numOfTeams">Number of Teams:</label> <input
						type="number" id="numOfTeams" id="numOfTeams" class="input-field"
						disabled
						value='<%=session.getAttribute("tournamentMaxTeam").toString()%>'
						required> <label for="tournamentType">Tournament
						Type:</label> <select id="tournamentType" id="tournamentType" required
						class="input-field">
						<option value="Single Elimination"  >Single Elimination</option>
						<option value="Double Elimination">Double Elimination</option>
						<option value="Round Robin">Round Robin</option>
					</select>

					<button type="submit" id="setupBracket">Setup Bracket</button>
				</form>

				<div class="bracket-container" id="bracketContainer"></div>
			</div>




			<div id="tournamentResults" class="section">
				<h2>Results</h2>
				<div class="resultTableDiv">
					<table>
						<thead>
							<tr>
								<th>Team ID</th>
								<th>Team Name</th>
								<th>Description</th>
								<th>Number of Players</th>
							</tr>
						</thead>
						<tbody>
								
						</tbody>
					</table>
				</div>
			</div>
			<!-- Add more sections as needed -->
		</div>
	</div>

</body>
</html>
