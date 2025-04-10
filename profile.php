<?php
session_start();
include 'db_connection.php';

if (!isset($_SESSION['userID'])) {
    header("Location: main.html");
    exit();
}

$userID = $_SESSION['userID'];

$sql = "SELECT username, email, password FROM user WHERE userID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $userID);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Profile Page</title>
  <link href="https://fonts.googleapis.com/css2?family=Chenla&display=swap" rel="stylesheet">
  <script src="logout.js"></script>
  <style>
     body {
            font-family: 'Chenla', sans-serif;
            margin: 0;
            background-color: #FFF8F1;
            transition: background-color 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .header, .footer {
            background-color: #7C1F1B;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 0 0 30px 30px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        }
        .footer {
            padding: 10px;
            border-radius: 30px 30px 0 0;
            flex-direction: column;
            text-align: center;
            margin-top: 10px;
        }
        .footer-links {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }
        .footer-links a {
            color: #CBB696;
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 14px;
        }
        .footer-links a:hover {
            color: #ae9c80;
        }
        .footer p {
            color: #CBB696;
            margin-top: 3px;
            font-size: 12px;
        }
        .logo-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .nav-icon {
            width: 50px;
            transition: transform 0.3s ease;
        }
        .nav-icon:hover {
            transform: scale(1.1);
        }
        .breadcrumb-nav {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            font-size: 18px;
            color: #7C1F1B;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            font-weight: bold;
        }
        .divider {
            flex-grow: 1;
            height: 2px;
            background-color: #9E1A1A;
            margin-left: 10px;
        }
        .content {
            flex: 1; 
        }
        .profile-container {
            display: flex;
            align-items: center;
            justify-content: center;
            max-width: 900px;
            margin: 40px auto;
            background-color: #E3D8C5;
            padding: 40px;
            border-radius: 30px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease;
        }
        .profile-container:hover {
            transform: scale(1.02);
        }
        .memory-section {
            background-color: #7C1F1B;
            border-radius: 30px;
            padding: 70px;
            text-align: center;
            color: white;
            width: 20%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .memory-placeholder {
            width: 100px;
            display: block;
            margin-bottom: 10px;
        }
        .memory-btn, .logout-btn{
            background-color: #CBB696;
            color: #7C1F1B;
            padding: 6px 12px;
            border-radius: 15px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            width: auto;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }
        .logout-btn{
            padding: 6px 26px;  
        }

        .memory-btn:hover, .logout-btn:hover {
            background-color: #b0a084;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease;
        }
        .form-section {
            flex: 1;
            text-align: left;
            padding: 20px 40px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-size: 18px;
            color: #7C1F1B;
            display: block;
            margin-bottom: 5px;
        }
        .form-field {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            background-color: #C4AFA0;
            font-size: 16px;
            color: #5B3C2A;
            transition: border 0.3s ease;
        }
        .form-field:focus {
            outline: none;
            border: 2px solid #7C1F1B;
        }
        @media (max-width: 768px) {
            .profile-container {
                flex-direction: column;
                text-align: center;
                padding: 20px;
            }
            .memory-section {
                width: 100%;
                border-radius: 30px 30px 0 0;
            }
            .form-section {
                padding: 20px;
                width: 100%;
            }
        }
  </style>
</head>
<body>
<header class="header">
  <div class="logo-container">
    <a href="Bawhome.php"><img src="images/logo.png" alt="Logo" class="nav-icon"></a>
    <a href="favorites.php"><img src="images/heart.png" alt="Heart" class="nav-icon"></a>
  </div>
  <a href="profile.php"><img src="images/profile_color.png" alt="Profile" class="nav-icon"></a>
</header>

<nav class="breadcrumb-nav">
  <span><a href="Bawhome.php" style="text-decoration: none; color: #7C1F1B;">Home</a> &gt; <a href="profile.php" style="text-decoration: none; color: #7C1F1B;">Profile</a></span>
  <div class="divider"></div>
</nav>

<div class="content">
  <section class="profile-container">
    <div class="memory-section">
      <img src="images/profile_color.png" alt="Profile Image" class="memory-placeholder">
      <button class="memory-btn" onclick="window.location.href='memory.php';">Your Memory</button>
      <button class="logout-btn">Log Out</button>
    </div>
    <div class="form-section">
      <form>
        <div class="form-group">
          <label class="form-label">Username</label>
          <input type="text" class="form-field" value="<?= htmlspecialchars($user['username']) ?>" readonly>
        </div>
        <div class="form-group">
          <label class="form-label">Email</label>
          <input type="email" class="form-field" value="<?= htmlspecialchars($user['email']) ?>" readonly>
        </div>
        <div class="form-group">
          <label class="form-label">Password</label>
<?php
$passwordStars = isset($_SESSION['userPlainPassword']) 
    ? str_repeat('*', strlen($_SESSION['userPlainPassword'])) 
    : '********';
?>
<input type="password" class="form-field" value="<?= $passwordStars ?>" readonly>
        </div>
      </form>
    </div>
  </section>
</div>

<footer class="footer">
  <div class="footer-links">
    <a href="about.html">About Us</a>
    <a href="contact.html">Contact</a>
    <a href="privacy.html">Privacy Policy</a>
    <a href="terms.html">Terms of Service</a>
  </div>
  <p>&copy; 2025 Bawsalah All rights reserved.</p>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const logoutButton = document.querySelector(".logout-btn");
    if (logoutButton) {
      logoutButton.addEventListener("click", logoutUser);
    }
  });
</script>
</body>
</html>
