<?php
session_start();

// Destroy all session data
session_unset();
session_destroy();

// Return a success response in JSON format
echo json_encode(["status" => "success", "message" => "Logged out successfully"]);
?>
