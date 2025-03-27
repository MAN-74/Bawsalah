<?php
session_start();
include 'db_connection.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"));
$memoryID = $data->memoryID ?? null;

if (!$memoryID || !isset($_SESSION['userID'])) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
    exit();
}

$userID = $_SESSION['userID'];

// Get image path
$stmt = $conn->prepare("SELECT imagePath FROM memory WHERE memoryID = ? AND userID = ?");
$stmt->bind_param("ii", $memoryID, $userID);
$stmt->execute();
$result = $stmt->get_result();
$image = $result->fetch_assoc();

if ($image) {
    $imagePath = $image['imagePath'];
    if (file_exists($imagePath)) {
        unlink($imagePath); //  Delete image file
    }

    // Delete memory from DB
    $stmt = $conn->prepare("DELETE FROM memory WHERE memoryID = ? AND userID = ?");
    $stmt->bind_param("ii", $memoryID, $userID);
    $stmt->execute();

    echo json_encode(['status' => 'success']);
} else {
    http_response_code(404);
    echo json_encode(['status' => 'error', 'message' => 'Memory not found']);
}
?>
