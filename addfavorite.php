<?php
include 'db_connection.php';
session_start();

if (!isset($_SESSION['userID'])) {
    die("You must be logged in to add favorites.");
}

$userID = $_SESSION['userID'];
$destinationID = $_POST['destinationID'];
$categoryID = $_POST['categoryID'];

// تأكد أن المكان غير مضاف مسبقًا
$check_stmt = $conn->prepare("SELECT * FROM favoriteslist WHERE userID = ? AND destinationID = ?");
$check_stmt->bind_param("ii", $userID, $destinationID);
$check_stmt->execute();
$result = $check_stmt->get_result();

if ($result->num_rows > 0) {
    echo "Already in favorites!";
} else {
    // إدخال المكان في المفضلة
    $stmt = $conn->prepare("INSERT INTO favoriteslist (userID, destinationID, categoryID) VALUES (?, ?, ?)");
    $stmt->bind_param("iii", $userID, $destinationID, $categoryID);
    
    if ($stmt->execute()) {
        echo "Added to favorites!";
    } else {
        echo "Error: " . $stmt->error;
    }
}

$check_stmt->close();
$stmt->close();
$conn->close();
?>
