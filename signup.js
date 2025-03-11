function validateForm(event) {
    event.preventDefault();
    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirm-password").value;
    let error = false;

    function showError(id, message) {
        let element = document.getElementById(id);
        element.textContent = message;
        element.style.display = "block";
    }

    function hideError(id) {
        let element = document.getElementById(id);
        element.style.display = "none";
    }

    // Name validation
    if (name === "") {
        showError("name-error", "⚠️ Name is required");
        error = true;
    } else {
        hideError("name-error");
    }

    // Email validation
    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        showError("email-error", "⚠️ Email is required");
        error = true;
    } else if (!emailPattern.test(email)) {
        showError("email-error", "⚠️ Invalid email format");
        error = true;
    } else {
        hideError("email-error");
    }

    // Password validation
    let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
    if (password === "") {
        showError("password-error", "⚠️ Password is required");
        error = true;
    } else if (!passwordPattern.test(password)) {
        showError("password-error", "⚠️ Password must be at least 8 characters with one uppercase, one lowercase, and one number");
        error = true;
    } else {
        hideError("password-error");
    }

    // Confirm password validation
    if (confirmPassword === "") {
        showError("confirm-password-error", "⚠️ Confirm Password is required");
        error = true;
    } else if (password !== confirmPassword) {
        showError("confirm-password-error", "⚠️ Passwords do not match");
        error = true;
    } else {
        hideError("confirm-password-error");
    }

    if (!error) {
        //Store user credentials (not secure for production; use backend for real apps)
        localStorage.setItem("userEmail", email);
        localStorage.setItem("userPassword", password);
        
        alert("Signup successful! You can now log in.");
        window.location.href = 'login.html';
    }

}
