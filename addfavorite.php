<?php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['userID'])) {
    die("You must be logged in to add favorites.");
}

$userID = $_SESSION['userID'];

// 1. Retrieve data from the URL
$name = $_GET['name'];
$category = $_GET['category'];

// 2. Get categoryID from the category name
$cat_stmt = $conn->prepare("SELECT categoryID FROM category WHERE name = ?");
$cat_stmt->bind_param("s", $category);
$cat_stmt->execute();
$cat_result = $cat_stmt->get_result();

if ($cat_result->num_rows == 0) {
    die("Category not found.");
}
$categoryID = $cat_result->fetch_assoc()['categoryID'];
$cat_stmt->close();

// 3. Get destinationID based on name and category
$dest_stmt = $conn->prepare("SELECT destinationID FROM destination WHERE name = ? AND categoryID = ?");
$dest_stmt->bind_param("si", $name, $categoryID);
$dest_stmt->execute();
$dest_result = $dest_stmt->get_result();

if ($dest_result->num_rows == 0) {
    die("Destination not found.");
}
$destinationID = $dest_result->fetch_assoc()['destinationID'];
$dest_stmt->close();

// 4. Check if the destination is already in favorites
$check_stmt = $conn->prepare("SELECT * FROM favoriteslist WHERE userID = ? AND destinationID = ?");
$check_stmt->bind_param("ii", $userID, $destinationID);
$check_stmt->execute();
$result = $check_stmt->get_result();

if ($result->num_rows > 0) {
    // Already exists, redirect the user
   $previous = $_SERVER['HTTP_REFERER'];
header("Location: $previous");
exit;
}
$check_stmt->close();

// 5. Add destination to favorites
$insert_stmt = $conn->prepare("INSERT INTO favoriteslist (userID, destinationID, categoryID) VALUES (?, ?, ?)");
$insert_stmt->bind_param("iii", $userID, $destinationID, $categoryID);
$insert_stmt->execute();
$insert_stmt->close();

$conn->close();


$previous = $_SERVER['HTTP_REFERER'];
header("Location: $previous");
exit;

?>
