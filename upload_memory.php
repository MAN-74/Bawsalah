<?php
session_start();
include 'db_connection.php';

if (!isset($_SESSION['userID'])) {
    echo json_encode(["status" => "error", "message" => "Not logged in"]);
    exit;
}

$userID = $_SESSION['userID'];

if (isset($_FILES['image'])) {
    $targetDir = "uploads/";
    if (!is_dir($targetDir)) {
        mkdir($targetDir, 0777, true);
    }

if ($_FILES['image']['size'] > 8 * 1024 * 1024) {
    echo json_encode(["status" => "error", "message" => "⚠️ Image too large. Max size is 8MB."]);
    exit;
}

    $filename = basename($_FILES["image"]["name"]);
    $targetFile = $targetDir . time() . "_" . $filename;

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
        $caption = isset($_POST["caption"]) ? $_POST["caption"] : "";
        $sql = "INSERT INTO memory (userID, imagePath, caption) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("iss", $userID, $targetFile, $caption);
        $stmt->execute();

        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to upload image"]);
    }
}
?>
