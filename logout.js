function logoutUser() {
    // Display confirmation prompt
    const isConfirmed = confirm("Are you sure you want to log out?");
    
    if (isConfirmed) {
        localStorage.removeItem("loggedIn"); // Clear login state
        window.location.href = "login.html"; // Redirect to login page
    }
}

// Attach the function to the logout button
document.addEventListener("DOMContentLoaded", function () {
    const logoutButton = document.querySelector(".logout-btn");
    if (logoutButton) {
        logoutButton.addEventListener("click", logoutUser);
    }
});
