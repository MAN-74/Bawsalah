document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");
    const errorMessage = document.getElementById("error-message");
  
    loginForm.addEventListener("submit", function (event) {
      event.preventDefault();
  
      const email = document.getElementById("email").value;
      const password = document.getElementById("password").value;
  
     // Retrieve stored user credentials
       const storedEmail = localStorage.getItem("userEmail");
       const storedPassword = localStorage.getItem("userPassword");
      
       if (email === storedEmail && password === storedPassword) {
        localStorage.setItem("loggedIn", "true"); // Keep the user logged in
        window.location.href = "Bawhome.html"; 
      } else {
        errorMessage.style.display = "block"; // Show error message
      }
    });
  
    // Check if user is already logged in
    if (localStorage.getItem("loggedIn") === "true") {
      window.location.href = "Bawhome.html"; // Redirect if already logged in
    }
  });
  