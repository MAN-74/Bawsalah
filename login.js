document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");
    const errorMessage = document.getElementById("error-message");
  
    loginForm.addEventListener("submit", function (event) {
      event.preventDefault();
  
      const email = document.getElementById("email").value;
      const password = document.getElementById("password").value;
  
      // Simulated user credentials (authentication logic)
      const validEmail = "user@example.com";
      const validPassword = "password123";
  
      if (email === validEmail && password === validPassword) {
        localStorage.setItem("loggedIn", "true"); // Store login state
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
  