<!DOCTYPE html>
<html>
<head>
    <title>GMT - Create Tournament</title>
    <link rel="stylesheet" type="text/css" href="/css/createtm.css">
</head>
<body>

 <nav>
        <div class="navcontainer">
            <h1>GMT</h1>
            
            <div class="mainnav">
            <ul>
                <li><a href="firstpage.jsp" class="active" >Home</a></li>
                
                 </ul>
                </div>
                <div class="logs">
                 <ul>
           
            </ul></div>
        </div>
    </nav>
    <div class="container">
        <h1>Create Tournament</h1>
        <form action="/createTournament" method="post">
            <input name="title" type="text" placeholder="Tournament Name" required="required" class="input-field">
            <select class="input-field" required="required" name="gametype">
                <option value="" disabled selected>Select Game Type</option>
                <option value="sports">Sports</option>
                <option value="esports">Esports</option>
            </select>
            
            <select class="input-field" name="gameName">
                <option value="" disabled selected>Select Game</option>
                <!-- Sports Games -->
                <optgroup label="Sports Games">
                    <option value="football">Football</option>
                    <option value="basketball">Basketball</option>
                    <option value="tennis">Tennis</option>
                    <option value="golf">Golf</option>
                </optgroup>
                <!-- Esports Games -->
                <optgroup label="Esports Games" >
                    <option value="dota2">Dota 2</option>
                    <option value="leagueoflegends">League of Legends</option>
                    <option value="counterstrike">Counter-Strike: Global Offensive</option>
                    <option value="overwatch">Overwatch</option>
                    <option value="Valorant">Valorant</option>
                </optgroup>
            </select>
            <select class="input-field" name=tournamentType>
                <option value="" disabled selected>Select Tournament Type</option>
                <option value="single">Single Elimination</option>
                <option value="double">Double Elimination</option>
                <option value="round-robin">Round Robin</option>
            </select>
           	Tournament Start Date
            <input type="date" placeholder="Start Date" class="input-field" name="startDate" >
            Tournament Start Time
            <input type="time" placeholder="Start Time" class="input-field" name="startTime">
            Tournament End Date
            <input type="date" placeholder="End Date" class="input-field" name="endDate" >
            Tournament End Time
            <input type="time" placeholder="End Time" class="input-field" name="endTime">
            <textarea placeholder="Description" class="input-field" name="tournamentDiscription"></textarea>
            <input type="text" placeholder="Venue" class="input-field" name="tournamentVenue">
            <input type="text" placeholder="Sponser Name" class="input-field" name="tournamentSponserName">
 <!-- <input type="text" placeholder="Contact Email" class="input-field">
            <input type="text" placeholder="Contact Phone" class="input-field"> -->           
            <input type="number" placeholder="Number of Teams Paricipating" class="input-field" name="tournamentNoOfTeams">
            <input type="number" placeholder="Entry Fee" value="0" class="input-field" name="tournamentFee">
            <input type="text" placeholder="Prize Pool" class="input-field" name="tournamentPrize">
            <input type="text" placeholder="City" class="input-field" name="tournamentCity">
            
            <button type="submit" class="btn">Create Tournament</button>
        </form>
    </div>
</body>
</html>
