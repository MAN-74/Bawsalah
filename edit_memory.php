<?php
session_start();
include 'db_connection.php';

if (!isset($_SESSION['userID'])) {
    echo json_encode(["status" => "error", "message" => "Not logged in"]);
    exit;
}

$userID = $_SESSION['userID'];

if ($_SERVER['CONTENT_TYPE'] === "application/json") {
    $data = json_decode(file_get_contents("php://input"), true);
    $caption = $data["caption"] ?? "";
    $memoryID = $data["memoryID"] ?? 0;

    $stmt = $conn->prepare("UPDATE memory SET caption = ? WHERE memoryID = ? AND userID = ?");
    $stmt->bind_param("sii", $caption, $memoryID, $userID);
    $stmt->execute();
    echo json_encode(["status" => "success"]);
    exit;
}

if (isset($_FILES["image"])) {
    $memoryID = $_POST["memoryID"];

    //  Get the old image path from DB
    $stmt = $conn->prepare("SELECT imagePath FROM memory WHERE memoryID = ? AND userID = ?");
    $stmt->bind_param("ii", $memoryID, $userID);
    $stmt->execute();
    $result = $stmt->get_result();
    $oldData = $result->fetch_assoc();
    $oldImagePath = $oldData["imagePath"] ?? "";

    //  Prepare new image path
    $filename = basename($_FILES["image"]["name"]);
    $path = "uploads/" . time() . "_" . $filename;

    if (!is_dir("uploads/")) {
        mkdir("uploads/", 0777, true);
    }

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $path)) {
        //  Delete the old image file if it exists
        if (file_exists($oldImagePath)) {
            unlink($oldImagePath);
        }

        //  Update DB with new image path
        $stmt = $conn->prepare("UPDATE memory SET imagePath = ? WHERE memoryID = ? AND userID = ?");
        $stmt->bind_param("sii", $path, $memoryID, $userID);
        $stmt->execute();

        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to update image"]);
    }
}

?>
