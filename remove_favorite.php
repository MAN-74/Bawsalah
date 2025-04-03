<?php
session_start();
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['destinationID']) && isset($_POST['categoryID'])) {
        $destinationID = $_POST['destinationID'];

        // تأكدي أن المستخدم مسجل دخول
        if (!isset($_SESSION['userID'])) {
            die("You must be logged in to remove favorites.");
        }

        $userID = $_SESSION['userID'];

        // تنفيذ عملية الحذف
        $stmt = $conn->prepare("DELETE FROM favoriteslist WHERE userID = ? AND destinationID = ?");
        $stmt->bind_param("ii", $userID, $destinationID);

        if ($stmt->execute()) {
            // إعادة التوجيه بعد الحذف
            header("Location: favorites.php"); 
            exit();
        } else {
            echo "Error removing favorite.";
        }

        $stmt->close();
        $conn->close();
    } else {
        echo "Invalid request.";
    }
} else {
    echo "Invalid request method.";
}
?>
