<?php
// Database connection details
$servername = "localhost";
$username = "Username";
$password = "Userpass";
$dbname = "ular_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get user input
$input_username = $_POST['Username'];
$input_password = $_POST['Userpass'];

// Prepare and execute query
$stmt = $conn->prepare("SELECT password FROM login_info WHERE Username = ?");
$stmt->bind_param("s", $input_username);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $stmt->bind_result($hashed_password);
    $stmt->fetch();

    // Verify password
    if (password_verify($input_password, $hashed_password)) {
        echo "Login successful!";
        // Start session and redirect or other login actions
    } else {
        echo "Invalid username or password.";
    }
} else {
    echo "Invalid username or password.";
}

$stmt->close();
$conn->close();
?>
