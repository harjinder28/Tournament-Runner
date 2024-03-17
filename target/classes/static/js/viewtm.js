
  window.onload = function() {
    // Function to reload data when the page is reloaded
    function reloadData() {
      // Make an AJAX call to the servlet controller
      var xhr = new XMLHttpRequest();
      xhr.open("GET", "/Tournament_Runner/viewTournament", true);
/*     xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

        }
      };*/
      xhr.send();
    }
    
    if (window.performance && window.performance.navigation.type === window.performance.navigation.TYPE_RELOAD) {
      reloadData();
    }
  };

