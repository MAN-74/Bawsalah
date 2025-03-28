<?php
header("Content-Type: application/json; charset=UTF-8");

session_start();
include 'db_connection.php';

// Enable error logging
ini_set('log_errors', 1);
ini_set('error_log', 'error_log.txt');
error_reporting(E_ALL);

function sendJsonResponse($status, $message) {
    echo json_encode(["status" => $status, "message" => $message]);
    exit;
}

// Check if request is POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    sendJsonResponse("error", "Invalid request");
}

// Get user input
$email = isset($_POST['email']) ? trim($_POST['email']) : "";
$password = isset($_POST['password']) ? $_POST['password'] : "";

// Validate inputs
if (empty($email) || empty($password)) {
    sendJsonResponse("error", "⚠️ Email and password are required");
}

// Prepare SQL statement
$stmt = $conn->prepare("SELECT * FROM user WHERE email = ?");
if (!$stmt) {
    error_log("MySQL error: " . $conn->error);
    sendJsonResponse("error", "⚠️ Server error. Please try again.");
}

$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    error_log("Failed login attempt: Email not found ($email)");
    sendJsonResponse("error", "⚠️ Invalid email or password");
}

$row = $result->fetch_assoc();

if (!password_verify($password, $row['password'])) {
    error_log("Failed login attempt: Incorrect password for email $email");
    sendJsonResponse("error", "⚠️ Invalid email or password");
}

// Successful login

// Successful login
$_SESSION['userID'] = $row['userID'];
$_SESSION['userPlainPassword'] = $password;

sendJsonResponse("success", "🎉 Login successful");


// Close resources
$stmt->close();
$conn->close();
?>
