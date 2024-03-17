
window.addEventListener('DOMContentLoaded', function() {
	var updateButtons = document.querySelectorAll('.update-btn');

	updateButtons.forEach(function(button) {
		button.addEventListener('click', function() {

			var field = this.getAttribute('data-field');
			var inputField = document.getElementById(field);

			inputField.disabled = !inputField.disabled;

			if (inputField.disabled) {
				this.setAttribute('value', 'Update');
				this.classList.remove("btnsv")
				this.classList.add("btnupd")

			} else {
				this.setAttribute('value', 'Save');
				this.classList.add("btnsv")
				this.classList.remove("btnupd")

				button.removeEventListener('click', updateButtonClick);
				button.addEventListener('click', saveButtonClick);
			}
		});
	});

	function saveButtonClick() {
		var field = this.getAttribute('data-field');
		var inputField = document.getElementById(field);
		var value = inputField.value;

		fetch('/Tournament_Runner/updateTournamentData', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded',
			},
			body: 'field=' + encodeURIComponent(field) + '&value=' + encodeURIComponent(value),
		})

	}

	function updateButtonClick() {
		var field = this.getAttribute('data-field');
		var inputField = document.getElementById(field);

		inputField.disabled = !inputField.disabled;

		if (inputField.disabled) {

		} else {

			button.removeEventListener('click', saveButtonClick);
			button.addEventListener('click', updateButtonClick);
		}
	}
});


//------------------------------------------------------------------------------------------------


function showSection(sectionId, opt) {
	// Get all sections

	let sections = document.getElementsByClassName("section");
	let options = document.getElementsByClassName("item");

	// Hide all sections
	for (var i = 0; i < sections.length; i++) {
		sections[i].classList.remove("active");
	}
	for (var j = 0; j < options.length; j++) {
		options[j].classList.remove("item");
	}
	// Show the selected section
	var section = document.getElementById(sectionId);
	section.classList.add("active");
	var option = document.getElementById(opt);
	option.classList.add("item");

}

function showTab(tabId) {
	// Get all tabs
	var tabs = document.getElementsByClassName("tab");

	// Hide all tabs
	for (var i = 0; i < tabs.length; i++) {
		tabs[i].classList.remove("tabactive");
	}

	// Show the selected tab
	var tab = document.getElementById(tabId);
	tab.classList.add("tabactive");
}

// Event listener for form submission
/*window.addEventListener("DOMContentLoaded", function() {
	var form = document.querySelector("#setupBracket form");
	form.addEventListener("submit", function(event) {
		
		event.preventDefault();
		var numOfTeams = document.getElementById("numOfTeams").value;
		var tournamentType = document.getElementById("tournamentType").value;

		// Render the bracket diagram based on the input values
		renderBracket(parseInt(numOfTeams), tournamentType);
		
	});
});*/
class BracketTree {
	constructor(options) {
		this.container = options.container;
		this.data = options.data;
	}

	render() {
		var bracketDiagram = document.createElement("div");
		bracketDiagram.className = "bracket-diagram";

		this.data.forEach((round) => {
			var roundElement = document.createElement("div");
			roundElement.className = "bracket-round";

			round.forEach((matchup) => {
				var matchupElement = document.createElement("div");
				matchupElement.className = "bracket-matchup";

				if (matchup.team1 && matchup.team2) {
					// Matchup has two teams
					var team1Element = document.createElement("div");
					var selectElement1 = document.createElement("select");
					var optionSelect1 = document.createElement("option");
					team1Element.appendChild(selectElement1);
					selectElement1.appendChild(optionSelect1);
					team1Element.className = "bracket-item";
					optionSelect1.textContent=matchup.team1.name;
					optionSelect1.setAttribute('value',matchup.team1.name);

					var vsElement = document.createElement("div");
					vsElement.className = "vs";
					vsElement.textContent = "vs";

					var team2Element = document.createElement("div");
					var selectelement2 = document.createElement("select");
					var optionSelect2 = document.createElement("option");
					team1Element.appendChild(selectelement2);
					selectelement2.appendChild(optionSelect2);
					team2Element.className = "bracket-item";
					optionSelect2.textContent=matchup.team2.name;
					optionSelect2.setAttribute('value',matchup.team2.name);

					matchupElement.appendChild(team1Element);
					matchupElement.appendChild(vsElement);
					matchupElement.appendChild(team2Element);
				} else if (matchup.team1) {
					// Matchup has only one team (winner of a previous round)
					var team1Element = document.createElement("div");
					var selectElement1 = document.createElement("select");
					var optionSelect1 = document.createElement("option");
					team1Element.appendChild(selectElement1);
					selectElement1.appendChild(optionSelect1);
					team1Element.className = "bracket-item";
					optionSelect1.textContent=matchup.team1.name;
					optionSelect1.setAttribute('value',matchup.team1.name);
					matchupElement.appendChild(team1Element);
				}

				roundElement.appendChild(matchupElement);
			});

			bracketDiagram.appendChild(roundElement);
		});

		this.container.appendChild(bracketDiagram);
	}
}
//-----------------------------------------------------------------------------------

// Create the select elements for each matchup in the bracket
function createSelectElements(bracketData) {
    const selectContainer = document.getElementById("selectContainer");
    selectContainer.innerHTML = ""; // Clear previous select elements

    bracketData.forEach((round, roundIndex) => {
        round.forEach((matchup, matchupIndex) => {
            const select1 = document.createElement("select");
            const select2 = document.createElement("select");

            // Add options to the select elements
            createSelectOptions(select1, bracketData[roundIndex - 1][matchupIndex * 2]);
            createSelectOptions(select2, bracketData[roundIndex - 1][matchupIndex * 2 + 1]);

            // Handle changes in the select elements
            select1.addEventListener("change", function () {
                matchup.team1.selectedTeam = this.value;
            });
            select2.addEventListener("change", function () {
                matchup.team2.selectedTeam = this.value;
            });

            // Append the select elements to the container
            selectContainer.appendChild(select1);
            selectContainer.appendChild(select2);
        });
    });
}

// Helper function to create options in a select element
function createSelectOptions(selectElement, teamMatchup) {
    if (teamMatchup && teamMatchup.winner) {
        // If the team has already advanced, show its name as the only option
        const option = document.createElement("option");
        option.textContent = teamMatchup.winner.name;
        option.value = teamMatchup.winner.name;
        selectElement.appendChild(option);
    } else {
        // Otherwise, show all team names as options
        teamNames.forEach((teamName) => {
            const option = document.createElement("option");
            option.textContent = teamName;
            option.value = teamName;
            selectElement.appendChild(option);
        });
    }
}

// Handle form submission to update bracket data
function handleBracketSubmission(event) {
    event.preventDefault();
    // Get the bracket data with user selections
    const updatedBracketData = getBracketDataWithUserSelections();
    // Render the updated bracket
    renderBracket(updatedBracketData);
}

// Function to get the bracket data with user selections
function getBracketDataWithUserSelections() {
    const bracketContainer = document.getElementById("bracketContainer");
    const selectElements = bracketContainer.querySelectorAll("select");
    const updatedBracketData = [];

    // Extract user selections from select elements
    let matchupIndex = 0;
    let currentRound = [];
    selectElements.forEach((select, index) => {
        const selectedTeam = select.value;
        const isTeam1 = index % 2 === 0;

        if (isTeam1) {
            currentRound[matchupIndex].team1.selectedTeam = selectedTeam;
        } else {
            currentRound[matchupIndex].team2.selectedTeam = selectedTeam;
            matchupIndex++;
        }

        // If both teams in the matchup have selections, move to the next matchup
        if (currentRound[matchupIndex] && currentRound[matchupIndex].team1.selectedTeam && currentRound[matchupIndex].team2.selectedTeam) {
            matchupIndex++;
        }

        // If all matchups in the current round have selections, move to the next round
        if (matchupIndex === currentRound.length) {
            updatedBracketData.push(currentRound);
            currentRound = [];
            matchupIndex = 0;
        }
    });

    return updatedBracketData;
}

// Event listener for form submission
window.addEventListener("DOMContentLoaded", function () {
    var form = document.querySelector("#setupBracket form");
    form.addEventListener("submit", handleBracketSubmission);
});


//-----------------------------------------------------------------------------------
function renderBracket(numOfTeams, tournamentType) {
	var bracketContainer = document.getElementById("bracketContainer");

	// Generate the bracket data based on the number of teams and tournament type
	var bracketData = generateBracketData(numOfTeams, tournamentType);

	// Clear the existing bracket container
	bracketContainer.innerHTML = "";

	// Render the bracket diagram
	var bracket = new BracketTree({
		container: bracketContainer,
		data: bracketData,
	});
	bracket.render();
}

/* function generateBracketData(numOfTeams) {
    var table = document.getElementById("teamTable");
    var rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");

    // Extract team names from the table
    var teamNames = [];
    for (var i = 0; i < rows.length; i++) {
        const row = rows[i];
        const teamName = row.cells[1].textContent;
        teamNames.push(teamName);
    }

    // Initialize an empty array to store the rounds and matchups
    var bracketData = [];

    // Start with the first round (containing the initial matchups)
    var firstRound = [];
    // Create matchups for the first round with all teams as options
    for (let i = 0; i < numOfTeams; i += 2) {
        const matchup = {
            team1: { id: i + 1, name: teamNames[i] },
            team2: { id: i + 2, name: teamNames[i + 1] },
        };
        firstRound.push(matchup);
    }

    // Add the first round to the bracket data
    bracketData.push(firstRound);

    // Now, simulate the advancement of winning teams to the next rounds
    // Repeat this process until we have only one winner
    while (bracketData[bracketData.length - 1].length > 1) {
        const currentRound = bracketData[bracketData.length - 1];
        const nextRound = [];
        for (let i = 0; i < currentRound.length; i += 2) {
            const team1 = currentRound[i].winner ? currentRound[i].winner : currentRound[i].team1;
            const team2 = currentRound[i + 1].winner ? currentRound[i + 1].winner : currentRound[i + 1].team1;
            const matchup = {
                team1: team1,
                team2: team2,
            };
            nextRound.push(matchup);
        }
        bracketData.push(nextRound);
    }
    const finalRound = bracketData[bracketData.length - 1];
    if (finalRound.length === 1) {
        finalRound[0].winner = finalRound[0].team1.id < finalRound[0].team2.id ? finalRound[0].team1 : finalRound[0].team2;
    }

    return bracketData;
} */


function generateBracketData(numOfTeams) {
	var table = document.getElementById("teamTable");
	var rows = teamTable.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
	    
    var extraTeam=numOfTeams-rows.length;
    
	// Initialize an empty array to store the rounds and matchups
	var bracketData = [];

	// Start with the first round (containing the initial matchups)
	var firstRound = [];
	// Iterate through each row
	for (var i = 0; i < rows.length; i+=2) {
    const row1 = rows[i];
    const row2 = rows[i+1];
    const team1Name = row1.cells[1].textContent;
    const team2Name = row2.cells[1].textContent;
    const matchup = {
			team1: { id: i + 1, name: team1Name },
			team2: { id: i + 2, name: team2Name },
		};
         firstRound.push(matchup);
    }
    

	
	// Create matchups for the first round with placeholders for teams
	for (let i = numOfTeams-extraTeam; i < extraTeam; i += 2) {
		const matchup = {
			team1: { id: i + 1, name: `Team ${i + 1}` },
			team2: { id: i + 2, name: `Team ${i + 2}` },
		};
		firstRound.push(matchup);
	}

	// Add the first round to the bracket data
	bracketData.push(firstRound);

	// Now, simulate the advancement of winning teams to the next rounds
	// Repeat this process until we have only one winner
	while (bracketData[bracketData.length - 1].length > 1) {
		const currentRound = bracketData[bracketData.length - 1];
		const nextRound = [];
		for (let i = 0; i < currentRound.length; i += 2) {
			const team1 = currentRound[i].winner ? currentRound[i].winner : currentRound[i].team1;
			const team2 = currentRound[i + 1].winner ? currentRound[i + 1].winner : currentRound[i + 1].team1;
			const matchup = {
				team1: team1,
				team2: team2,
			};
			//   const matchup = {
			//   team1: currentRound[i].winner,
			// team2: currentRound[i + 1].winner,
			// };
			nextRound.push(matchup);
		}
		bracketData.push(nextRound);
	}
	const finalRound = bracketData[bracketData.length - 1];
	if (finalRound.length === 1) {
		finalRound[0].winner = finalRound[0].team1.id < finalRound[0].team2.id ? finalRound[0].team1 : finalRound[0].team2;
	}

	return bracketData;
}

//function saveTeam() {
//    var modal = document.querySelector(".overlayTeam");
//    modal.classList.remove("hiddendiv");
//}
// Function to show the Add Team popup modal
function showAddTeamModal() {
	var modal = document.querySelector(".overlayTeam");
	modal.classList.remove("hiddendiv");
}

// Function to hide the Add Team popup modal
function hideAddTeamModal() {
	var modal = document.querySelector(".overlayTeam");
	modal.classList.add("hiddendiv");
}
// Event listener to show the Add Team popup modal when the "Add Team" button is clicked
/* document.addEventListener("DOMContentLoaded", function() {
	// Your JavaScript code here, including the event listeners
	// for showing and hiding the popup modal
	// ...

	// Event listener to show the Add Team popup modal when the "Add Team" button is clicked
	document.getElementById("addTeam").addEventListener("click", function(event) {
		
		showAddTeamModal();
	});
	// Event listener to hide the Add Team popup modal when the "Save" button is clicked
   document.getElementById("closebtn").addEventListener("click", function(event) {
		
		hideAddTeamModal();
	});
});

  // Function to scroll to the desired section based on URL parameter
  function scrollToSection() {
	var activeSection = window.location.hash.substring(1);
	let sections = document.getElementsByClassName("section");
	for (var i = 0; i < sections.length; i++) {
		sections[i].classList.remove("active");
	}
	var targetSection = document.getElementById(activeSection);
	if (targetSection) {
	  targetSection.classList.add("active");
//      targetSection.scrollIntoView({ behavior: 'smooth' });
	}
  }

  // Call the function when the page loads
//  window.addEventListener('DOMContentLoaded', function() {
//    scrollToSection();
//  }); */





