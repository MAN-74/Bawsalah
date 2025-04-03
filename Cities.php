<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include '../db_connection.php';

// 1. Check if city name is passed
if (!isset($_GET['name'])) {
    die("City name not specified.");
}
$cityName = $_GET['name'];

// 2. Get cityID for the given name
$cityStmt = $conn->prepare("SELECT cityID FROM city WHERE name = ?");
$cityStmt->bind_param("s", $cityName);
$cityStmt->execute();
$cityResult = $cityStmt->get_result();

if ($cityResult->num_rows === 0) {
    die("City not found.");
}

$cityID = $cityResult->fetch_assoc()['cityID'];

// 3. Get all categories
$categoryResult = $conn->query("SELECT categoryID, name FROM category");
$categories = [];
while ($row = $categoryResult->fetch_assoc()) {
    $categories[$row['categoryID']] = $row['name'];
}

// 4. Get destinations by category for this city
$destQuery = "SELECT name, image, categoryID FROM destination WHERE cityID = $cityID";
$destResult = $conn->query($destQuery);

$destinationsByCategory = [];
while ($row = $destResult->fetch_assoc()) {
    $catID = $row['categoryID'];
    $destinationsByCategory[$catID][] = [
        'name' => $row['name'],
        'image' => $row['image']
    ];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($cityName) ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Chenla&display=swap" rel="stylesheet">
    <style>
        /* Paste your Al-Ula styles here or import a shared CSS file */
        body {
            font-family: 'Chenla', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffaf1;
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

        .carousel-container {
            position: relative;
            width: 100%;
            height: 600px;
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

        .heart-box img {
            width: 24px;
            height: 24px;
        }

        .favorite-text {
            font-size: 14px;
            color: #7C1F1B;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="logo-container">
        <a href="../Bawhome.php"><img src="../images/logo.png" alt="Logo" class="nav-icon"></a>
        <a href="../favorites.php"><img src="../images/heart.png" alt="Heart" class="nav-icon"></a>
    </div>
    <a href="../profile.php"><img src="../images/profile_color.png" alt="Profile" class="nav-icon"></a>
</header>

<nav class="breadcrumb-nav">
    <span><a href="../Bawhome.php" style="text-decoration: none; color: #7C1F1B;">Home</a> &gt;
          <a href="../Countries/Countries.php" style="text-decoration: none; color: #7C1F1B;">Countries</a> &gt;
          <?= htmlspecialchars($cityName) ?></span>
    <div class="divider"></div>
</nav>

<section class="carousel-container">
    <div class="carousel" id="carousel">
        <img src="../images/landscape1.jpg" class="active">
        <img src="../images/landscape2.webp">
        <img src="../images/landscape5.jpg">
    </div>
    <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
    <button class="next" onclick="moveSlide(1)">&#10095;</button>
</section>

<section class="about-section">
    <h2>About <?= htmlspecialchars($cityName) ?></h2>
    <p>[Add city-specific description here or later fetch it from DB if you add a `description` column]</p>
</section>

<?php foreach ($destinationsByCategory as $categoryID => $items): ?>
    <h3 class="category-title"><?= htmlspecialchars($categories[$categoryID]) ?></h3>
    <div class="category-grid">
        <?php foreach ($items as $item): ?>
            <div class="category-card" data-name="<?= htmlspecialchars($item['name']) ?>" data-category="<?= strtolower($categories[$categoryID]) ?>">
                <img src="../<?= htmlspecialchars($item['image']) ?>" alt="<?= htmlspecialchars($item['name']) ?>">
                <p><?= htmlspecialchars($item['name']) ?></p>
                <div class="favorite-container" onclick="location.href='addfavorite.php?name=<?= urlencode($item['name']) ?>&category=<?= urlencode($categories[$categoryID]) ?>&userID=<?= $userID ?>'">
    <div class="heart-box"><img src="../images/fav.png" alt="Favorite"></div>
    <span class="favorite-text">Add to favorites</span>
</div>
            </div>
        <?php endforeach; ?>
    </div>
<?php endforeach; ?>

<footer class="footer">
    <div class="footer-links">
        <a href="../about.php">About Us</a>
        <a href="../contact.php">Contact</a>
        <a href="../privacy.php">Privacy Policy</a>
        <a href="../terms.php">Terms of Service</a>
    </div>
    <p>&copy; 2025 Bawsalah All rights reserved.</p>
</footer>

<script>
    // Carousel script
    let index = 0;
    const images = document.querySelectorAll('.carousel img');

    function moveSlide(step) {
        images[index].classList.remove('active');
        index = (index + step + images.length) % images.length;
        images[index].classList.add('active');
    }

    // Favorites (using localStorage for now)
    function toggleFavorite(element, category) {
        const card = element.closest('.category-card');
        const itemName = card.getAttribute('data-name');
        const heartImg = element.querySelector('.heart-box img');
        const favoriteText = element.querySelector('.favorite-text');
        const key = category + 'Favorites';
        let favorites = JSON.parse(localStorage.getItem(key) || '[]');

        const index = favorites.findIndex(f => f.name === itemName);

        if (index === -1) {
            favorites.push({ name: itemName });
            heartImg.src = "../images/heart-filled.png";
            favoriteText.textContent = "Added to favorites";
        } else {
            favorites.splice(index, 1);
            heartImg.src = "../images/fav.png";
            favoriteText.textContent = "Add to favorites";
        }

        localStorage.setItem(key, JSON.stringify(favorites));
    }
</script>
</body>
</html>
