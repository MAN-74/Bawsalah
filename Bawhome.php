<?php

session_start();
include 'db_connection.php';

// Check if the user is logged in
if (!isset($_SESSION['userID'])) {
    header('Location: main.html');  
    exit();  
}

//php search start

// Check if the user has executed a search query
$hasSearched = isset($_POST['search']) || isset($_POST['category']) || isset($_POST['country']);
$search = isset($_POST['search']) ? "%" . $conn->real_escape_string($_POST['search']) . "%" : "%";
$category = isset($_POST['category']) && $_POST['category'] != "" ? (int)$_POST['category'] : null;
$country = isset($_POST['country']) && $_POST['country'] != "" ? (int)$_POST['country'] : null;

// Prepare SQL query 
if ($hasSearched) {
 $sql = "SELECT d.name, d.image, c.name AS city_name, co.name AS country_name, cat.name AS category_name
        FROM destination d
        JOIN city c ON d.cityID = c.cityID
        JOIN country co ON c.countryID = co.countryID
        JOIN category cat ON d.categoryID = cat.categoryID
        WHERE d.name LIKE ?";



    $params = [$search];
    $types = "s"; // Search query parameter for text-based search

    if ($category) {
        $sql .= " AND d.categoryID = ?";
        $params[] = $category;
        $types .= "i"; // Category parameter
    }

    if ($country) {
        $sql .= " AND co.countryID = ?";
        $params[] = $country;
        $types .= "i"; // Country parameter
    }

    // Execute the query
    $stmt = $conn->prepare($sql);
    $stmt->bind_param($types, ...$params);
    $stmt->execute();
    $result = $stmt->get_result();
   }
    //php search end


?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bawsalah - Explore the Arab Gulf</title>
    <link href="https://fonts.googleapis.com/css2?family=Chenla&family=Cherry+Swash&display=swap" />
    <link rel="stylesheet" href="Bawhome.css">   
    
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
    

      <main class="main-content">
     <!-- search start-->
     <div class="search-section">
     <section class="search-container">
     <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" class="search-form">
        
        <!-- search bar-->
        <div class="search-bar">
            <input type="text" name="search" placeholder="Search destinations..." class="search-input" id="searchInput" />
            
        </div>
        
        <!-- filters-->
        <div class="filters-container">
            <!-- category filter-->
            <select name="category" class="filter-dropdown" id="categoryFilter">
                <option value="">All Categories</option>
                <option value="1">Accommodations</option>
                <option value="2">Cafés & Restaurants</option>
                <option value="3">Adventures</option>
            </select>

            <!-- country filter-->
            <select name="country" class="filter-dropdown" id="countryFilter">
                <option value="">All Countries</option>
                <option value="1">Saudi Arabia</option>
                <option value="2">UAE</option>
                <option value="3">Qatar</option>
                <option value="4">Bahrain</option>
                <option value="5">Kuwait</option>
                <option value="6">Oman</option>
            </select>

            <!-- search button-->
            <button type="submit" class="search-btn">Search</button>
        </div>
    </form>
</section>

<!-- search results-->
<?php if ($hasSearched): ?>
    <section id="results">
        <?php if ($result->num_rows > 0): ?>
            <div class="cards-container">
                <?php while ($row = $result->fetch_assoc()): ?>
                   <div class="card">
    <img src="images/<?php echo htmlspecialchars($row['image']); ?>" alt="<?php echo htmlspecialchars($row['name']); ?>">
    <h3 class="card-title"><?php echo htmlspecialchars($row['name']); ?></h3>
    <p class="card-info">City: <?php echo htmlspecialchars($row['city_name']); ?> | Country: <?php echo htmlspecialchars($row['country_name']); ?></p>

    <!--favorites button-->
<div class="favorite-container" 
     onclick="location.href='addfavorite.php?name=<?= urlencode($row['name'] ?? '') ?>&category=<?= urlencode($row['category_name'] ?? '') ?>'"
     style="background-color: #cbb696; color: #a3201c;">
    <span class="favorite-text">Add to favorites</span>
</div>

</div>

                <?php endwhile; ?>
            </div>
        <?php else: ?>
            <p>No results found.</p>
        <?php endif; ?>
        <!-- close search btn-->
        <button type="button" class="close-btn" onclick="resetSearch()">Close</button>
    </section>
    <?php endif; ?>
        </div>     
 <!-- search end-->

        <section class="image-grid">
          <img
            src="images\season.jpg"
            alt="Landscape"
            class="grid-image-left"
          />
          <img
            src="images\salalah.jpg"
            alt="Middle landscape"
            class="grid-image-middle"
          />
          <div class="right-column">
            <img
              src="images\Landscape.webp"
              alt="Right top"
              class="grid-image-right-top"
            />
            <img
              src="images\madain.jpg"
              alt="Right bottom"
              class="grid-image-right-bottom"
            />
          </div>
        </section>

        <!--<button class="explore-button">Explore</button>-->
      </main>

      <section class="destinations-section">
        <div class="destinations-grid">
          <article class="destination-card">
            <img
              src="images\Saudi.jpg"
              alt="Saudi Arabia"
              class="destination-image"
            />
            <h3 class="destination-name">Saudi Arabia</h3>
          </article>

          <article class="destination-card">
            <img
              src="images\Emirates.jpg"
              alt="UAE"
              class="destination-image"
            />
            <h3 class="destination-name">United Arab Emirates</h3>
          </article>

          <article class="destination-card">
            <img
              src="images\qatar.jpg"
              alt="Qatar"
              class="destination-image"
            />
            <h3 class="destination-name">Qatar</h3>
          </article>

          <article class="destination-card">
            <img
              src="images\oman.jpg"
              alt="Oman"
              class="destination-image"
            />
            <h3 class="destination-name">Oman</h3>
          </article>
        </div>
       
        <button class="more-button" onclick="window.location.href='Countries.php';">More</button>
        
      </section>

      <section class="about-section">
        <div class="about-content">
          <h2 class="about-title">About Bawsalah</h2>
          <div class="about-text">
            <p>
              Bawsalah is a digital platform designed to simplify city
              exploration by providing travelers with accurate and reliable
              information. Our website highlights the top tourist destinations
              across the Arab Gulf countries, ensuring an enjoyable and
              enriching travel experience.
            </p>
            <br />
            <p>
              Whether you're looking for famous landmarks, hidden gems, Bawsalah
              is your ultimate guide to discovering the beauty and culture of
              the Gulf region.
            </p>
          </div>
        </div>
        <img
          src="images\bb.jpg"
          alt="Compass"
          class="about-image"
        />
      </section>
    </div>

    <!-- script for search close btn -->
    <script>
        function resetSearch() {
    document.getElementById("searchInput").value = "";
    document.getElementById("categoryFilter").value = "";
    document.getElementById("countryFilter").value = "";

    const resultsSection = document.getElementById("results");
    if (resultsSection) {
        resultsSection.style.display = "none";
    }
   }
</script>


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


