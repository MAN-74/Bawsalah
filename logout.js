function logoutUser() {
    // Display confirmation prompt
    const isConfirmed = confirm("Are you sure you want to log out?");
    
    if (isConfirmed) {
        // Make an HTTP request to logout.php to destroy the session
        fetch('logout.php', { method: 'POST' })
            .then(response => response.json()) // Expect a JSON response
            .then(data => {
                if (data.status === "success") {
                    console.log("Logout successful:", data.message);
                    // Redirect to the login page after successful logout
                    window.location.href = "main.html"; 
                } else {
                    console.log("Logout failed:", data.message);
                    alert("An error occurred during logout. Please try again.");
                }
            })
            .catch(error => {
                console.error("Logout failed:", error);
                alert("An error occurred during logout. Please try again.");
            });
    }
}


/*function logoutUser() {
    // Display confirmation prompt
    const isConfirmed = confirm("Are you sure you want to log out?");
    
    if (isConfirmed) {
        // Use AJAX to call logout.php to destroy the session on the server
        fetch("logout.php")
            .then(response => response.text())
            .then(data => {
                // After logout, redirect to login page
                window.location.href = "main.html"; // Make sure the path is correct
            })
            .catch(error => {
                console.error("Logout failed:", error);
            });
    }
}

// Attach the function to the logout button
document.addEventListener("DOMContentLoaded", function () {
    const logoutButton = document.querySelector(".logout-btn");
    if (logoutButton) {
        logoutButton.addEventListener("click", logoutUser);
    }
});*/
