<?php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['userID'])) {
    die("You must be logged in to view favorites.");
}

$userID = $_SESSION['userID'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Countries & Destinations</title>
    <link href="https://fonts.googleapis.com/css2?family=Chenla&display=swap" rel="stylesheet">
    <style>
        body {
            font-family:  'Chenla', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffaf1;
            text-align: center;
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

        .title {
            font-size: 32px;
            color: #9E1A1A;
            margin-bottom: 20px;
        }
        .country-section {
            margin: 20px auto;
            max-width: 1000px;
        }
        .country-title {
            font-size: 24px;
            color: #9E1A1A;
            margin-bottom: 10px;
        }
        .cards-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            background-color: rgba(124, 31, 27, 0.95);
            padding: 20px;
            border-radius: 15px;
            flex-wrap: wrap;
        }
        .card {
            background-color: #cbb696;
            border-radius: 15px;
            padding: 10px;
            width: 220px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.1);
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
        }
        .card-title {
            font-size: 18px;
            color: black;
            margin-top: 5px;
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
    <span><a href="Bawhome.php" style="text-decoration: none; color: #7C1F1B;">Home</a> &gt; Countries</span>
    <div class="divider"></div>
</nav>

<?php
$countryQuery = "SELECT * FROM country";
$countryResult = $conn->query($countryQuery);

if (!$countryResult || $countryResult->num_rows === 0) {
    die("No countries found.");
}

while ($country = $countryResult->fetch_assoc()) {
    $countryID = $country['countryID'];
    $countryName = $country['name'];

    echo "<section class='country-section'>";
    echo "<h2 class='country-title'>" . htmlspecialchars($countryName) . "</h2>";
    echo "<div class='cards-container'>";

    $cityQuery = "SELECT * FROM city WHERE countryID = $countryID";
    $cityResult = $conn->query($cityQuery);

    while ($city = $cityResult->fetch_assoc()) {
        $cityName = $city['name'];
        $cityImage = $city['image'];
        $cityPage = "Cities.php?name=" . urlencode($cityName);

        echo "<a href='{$cityPage}' style='text-decoration: none; color: inherit;'>";
        echo "<div class='card'>";
        echo "<img src='images/" . htmlspecialchars($cityImage) . "' alt='" . htmlspecialchars($cityName) . "'>";
        echo "<h3 class='card-title'>" . htmlspecialchars($cityName) . "</h3>";
        echo "</div>";
        echo "</a>";
    }

    echo "</div></section>";
}
?>

<footer class="footer">
    <div class="footer-links">
        <a href="about.php">About Us</a>
        <a href="contact.php">Contact</a>
        <a href="privacy.php">Privacy Policy</a>
        <a href="terms.php">Terms of Service</a>
    </div>
    <p>&copy; 2025 Bawsalah All rights reserved.</p>
</footer>
</body>
</html>
