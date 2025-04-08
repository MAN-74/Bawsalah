<?php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['userID'])) {
    die("You must be logged in to view favorites.");
}

$userID = $_SESSION['userID'];

// Query to fetch favorite places by category
$stmt = $conn->prepare("SELECT d.destinationID, d.name AS destination_name, d.image AS destination_image, c.name AS category_name
                        FROM favoriteslist f
                        JOIN destination d ON f.destinationID = d.destinationID
                        JOIN category c ON f.categoryID = c.categoryID
                        WHERE f.userID = ?");
$stmt->bind_param("i", $userID);
$stmt->execute();
$result = $stmt->get_result();

// Store data in an array for each category
$favorites = [
    "Accommodations" => [],
    "Cafés & Restaurants" => [],
    "Adventures" => []
];

// Distribute data based on category
while ($row = $result->fetch_assoc()) {
    $favorites[$row['category_name']][] = $row;
}

$stmt->close();
$conn->close();
?>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bawsalah - Favorites</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffaf1;
            min-height: 100vh; 
            display: flex;
            flex-direction: column; 
        }

        .header,
        .footer {
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
            margin-top: auto; 
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
        .category-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            padding: 20px;
            background-color: rgba(124, 31, 27, 0.95);
            border-radius: 20px;
            margin: 20px;
        }

        .category-card {
            background-color: #cbb696;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            width: 220px;
            position: relative;
            transition: transform 0.3s ease-in-out;
        }

        .category-card:hover {
            transform: scale(1.1);
        }

        .category-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        .favorite-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 5px;
            cursor: pointer;
        }

        .heart-box {
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 5px;
        }

        .heart-box img {
            width: 24px;
            height: 24px;
        }

        .favorite-text {
            font-size: 14px;
            color: #7C1F1B;
        }

        .carousel-container {
            position: relative;
            width: 100%;
            height: 900px;
            overflow: hidden;
            border-radius: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .carousel {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .carousel img {
            width: auto;
            max-width: 100%;
            height: 100%;
            object-fit: contain;
            display: none;
            border-radius: 15px;
        }

        .carousel img.active {
            display: block;
        }

        .prev,
        .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
            font-size: 24px;
        }

        .prev {
            left: 15px;
        }

        .next {
            right: 15px;
        }

        .about-section {
            padding: 20px;
            text-align: center;
        }

        .about-section h2 {
            color: #7C1F1B;
        }

        .about-section p {
            font-size: 18px;
            color: #333;
            max-width: 800px;
            margin: auto;
        }

        .category-title {
            font-size: 24px;
            color: #7C1F1B;
            padding: 10px;
            border-radius: 10px;
            text-align: left;
            margin: 20px;
            text-indent: 20px;
        }

        /* Add this style to handle empty categories */
        .empty-message {
            color: black;
            text-align: center;
            padding: 20px;
            font-style: italic;
        }
        .remove-button {
    background: none;
    border: none;
    color:#B71C1C;  
    font-size: 16px;
    cursor: pointer;
    text-align: center;
}

.remove-button:hover {
    color: #B71C1C; 
}
    </style>
</head>

<body>
    <header class="header">
        <div class="logo-container">
            <a href="Bawhome.php">
                <img src="images/logo.png" alt="Logo" class="nav-icon"></a>
            <a href="favorites.php">
                <img src="images/heart.png" alt="Heart" class="nav-icon"></a>
        </div>
        <a href="profile.php">
            <img src="images/profile_color.png" alt="Profile" class="nav-icon"></a>
    </header>
    <nav class="breadcrumb-nav">
        <span>
            <a href="Bawhome.php" style="text-decoration: none; color: #7C1F1B;">Home</a>
            &gt; <a href="favorites.html" style="text-decoration: none; color: #7C1F1B;">Favorites</a>
        </span>
        <div class="divider"></div>
    </nav>
     <h3 class="category-title">Favorite Accommodations</h3>
    <div class="category-grid">
   <?php
if (!empty($favorites["Accommodations"])) {
    foreach ($favorites["Accommodations"] as $place) {
        echo "<div class='category-card'>";
        echo "<img src='images/" . htmlspecialchars($place['destination_image']) . "' alt='" . htmlspecialchars($place['destination_name']) . "'>";
        echo "<p>" . htmlspecialchars($place['destination_name']) . "</p>";
        
       
        echo "<form method='POST' action='remove_favorite.php' style='display:inline;'>";
        echo "<input type='hidden' name='destinationID' value='" . htmlspecialchars($place['destinationID']) . "'>";
        echo "<input type='hidden' name='categoryID' value='" . htmlspecialchars($place['category_name']) . "'>";
        echo "<button type='submit' class='remove-button' style='color:#B71C1C; border: none; background: none; cursor: pointer;'>";
        echo "Remove from favorites";
        echo "</button>";
        echo "</form>";

        echo "</div>";
    }
} else {
    echo "<p>No favorite accommodations yet.</p>";
}
?>



    </div>

    <h3  class="category-title">Favorite Cafés & Restaurants</h3>
    <div class="category-grid">
        <?php
        if (!empty($favorites["Cafés & Resturants"])) {
            foreach ($favorites["Cafés & Resturants"] as $place) {
                echo "<div class='category-card'>";
 echo "<img src='images/" . htmlspecialchars($place['destination_image']) . "' alt='" . htmlspecialchars($place['destination_name']) . "'>";
        echo "<p>" . htmlspecialchars($place['destination_name']) . "</p>";
        
       
        echo "<form method='POST' action='remove_favorite.php' style='display:inline;'>";
        echo "<input type='hidden' name='destinationID' value='" . htmlspecialchars($place['destinationID']) . "'>";
        echo "<input type='hidden' name='categoryID' value='" . htmlspecialchars($place['category_name']) . "'>";
        echo "<button type='submit' class='remove-button' style='color:#B71C1C; border: none; background: none; cursor: pointer;'>";
        echo "Remove from favorites";
        echo "</button>";
        echo "</form>";

        echo "</div>";
    }
} else {
    echo "<p>No favorite accommodations yet.</p>";
}
?>
    </div>

    <h3  class="category-title">Favorite Adventures</h3>
    <div class="category-grid">
        <?php
        if (!empty($favorites["Adventures"])) {
            foreach ($favorites["Adventures"] as $place) {
                echo "<div class='category-card'>";
 echo "<img src='images/" . htmlspecialchars($place['destination_image']) . "' alt='" . htmlspecialchars($place['destination_name']) . "'>";                echo "<p>" . htmlspecialchars($place['destination_name']) . "</p>";
        echo "<form method='POST' action='remove_favorite.php' style='display:inline;'>";
        echo "<input type='hidden' name='destinationID' value='" . htmlspecialchars($place['destinationID']) . "'>";
        echo "<input type='hidden' name='categoryID' value='" . htmlspecialchars($place['category_name']) . "'>";
        echo "<button type='submit' class='remove-button' style='color:#B71C1C; border: none; background: none; cursor: pointer;'>";
        echo "Remove from favorites";
        echo "</button>";
        echo "</form>";

     
        echo "</div>";
    }
} else {
    echo "<p>No favorite accommodations yet.</p>";
}
        ?>
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
</body>

</html>
