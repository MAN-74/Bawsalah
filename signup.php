<?php
header("Content-Type: application/json; charset=UTF-8");

//  Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
include 'db_connection.php'; 

//  Check if the request is POST
if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["status" => "error", "message" => "Invalid request"]);
    exit;
}

//  Retrieve and sanitize form inputs
$username = trim($_POST["name"]);
$email = trim($_POST["email"]);
$password = $_POST["password"];
$confirmPassword = $_POST["confirm-password"];

//  Validate inputs
if (empty($username)) {
    echo json_encode(["status" => "error", "field" => "name", "message" => "⚠️ Name is required"]);
    exit;
}
if (empty($email)) {
    echo json_encode(["status" => "error", "field" => "email", "message" => "⚠️ Email is required"]);
    exit;
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["status" => "error", "field" => "email", "message" => "⚠️ Invalid email format"]);
    exit;
}
if (empty($password)) {
    echo json_encode(["status" => "error", "field" => "password", "message" => "⚠️ Password is required"]);
    exit;
}
if (strlen($password) < 8 || !preg_match('/[A-Z]/', $password) || !preg_match('/\d/', $password)) {
    echo json_encode(["status" => "error", "field" => "password", "message" => "⚠️ Password must have at least 8 characters, 1 uppercase letter, and 1 number"]);
    exit;
}
if (empty($confirmPassword)) {
    echo json_encode(["status" => "error", "field" => "confirm-password", "message" => "⚠️ Confirm Password is required"]);
    exit;
}
if ($password !== $confirmPassword) {
    echo json_encode(["status" => "error", "field" => "confirm-password", "message" => "⚠️ Passwords do not match"]);
    exit;
}

//  Check if email already exists
$sql = "SELECT * FROM user WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo json_encode(["status" => "error", "field" => "email", "message" => "⚠️ Email is already registered"]);
    exit;
}

//  Hash the password
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

//  Insert user into database
$sql = "INSERT INTO user (username, email, password) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $username, $email, $hashedPassword);

if ($stmt->execute()) {
    $_SESSION["userID"] = $stmt->insert_id;
    $_SESSION["userPlainPassword"] = $password; // storing temporarily in session
    echo json_encode(["status" => "success", "message" => "🎉 Signup successful!"]);
} else {
    echo json_encode(["status" => "error", "message" => "⚠️ Registration failed, please try again"]);
}

$stmt->close();
$conn->close();
?>
