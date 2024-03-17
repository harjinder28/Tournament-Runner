<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.HS.TeamOBJ"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

int teamcount=Integer.parseInt(session.getAttribute("teamcount").toString());
if(teamcount==1){
List<TeamOBJ> teams = new ArrayList<>();
teams = (List<TeamOBJ>) session.getAttribute("teams"); 
for (TeamOBJ team : teams) {
	out.print("<tr>");
	out.print("<td>" + team.getTeamId() + "</td>");
	out.print("<td>" + team.getTeamName() + "</td>");
	out.print("<td>" + team.getTeamDescription() + "</td>");
	out.print("<td>" + team.getNumberOfPlayers() + "</td>");
	out.print("</tr>");
	session.removeAttribute("teams");
}
}
else{out.print("No Teams Added yet! +_+ ");
	
}
%>

