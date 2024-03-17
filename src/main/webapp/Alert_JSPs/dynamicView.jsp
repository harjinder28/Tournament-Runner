<%@page import="com.HS.TournamentView"%>
<% 
int tournamentCount=0;
if(session.getAttribute("tournamentCount")!=null){
tournamentCount = Integer.parseInt(session.getAttribute("tournamentCount").toString()); 
}
if (tournamentCount==0){
	//response.sendRedirect(TournamentView.viewTournament);
	out.print("<h1>No Tournaments Yet</h1>");
}

else if(tournamentCount>0){
for (int i = 0; i < tournamentCount; i++) {	
    String tId = session.getAttribute("tId" + i).toString();
    String tTitle = session.getAttribute("tTitle" + i).toString();
    String tGameName = session.getAttribute("tGame" + i).toString();
    out.print("<div class='tourna'>");
    out.print("<form action='/Tournament_Runner/ViewManager?tId=" + tId + "' method='post'>");
    out.print("<input type='text' name='tTitle' value='" + tTitle + "' disabled>");
    out.print("<input type='text' value='" + tGameName + "' disabled>");
    out.print("<button type='submit' class='btn'>Manage</button>");
    out.print("</form>");
    out.print("</div>");
    session.removeAttribute("tId" + i);
    session.removeAttribute("tTitle" + i);
    session.removeAttribute("tGame" + i);
}}

%>
