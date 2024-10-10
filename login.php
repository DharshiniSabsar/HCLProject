<?php
// Database configuration
$servername = "localhost"; // Database server
$username = "root"; // Database username
$password = ""; // Database password
$dbname = "ular_db"; // Database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Start the session
session_start();

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get username and password from the form
    $input_username = $_POST['username'];
    $input_password = $_POST['password'];

    // Prepare and bind
    $stmt = $conn->prepare("SELECT Userpass FROM user_info WHERE Username = ?");
    $stmt->bind_param("s", $input_username);
    $stmt->execute();
    $stmt->store_result();
    

    $table = "user_info"; // Your table name

    // Check if the user exists
    if ($stmt->num_rows > 0) {
        // Fetch the hashed password
        $stmt->bind_result($hashed_password);
        $stmt->fetch();

        // Verify the password (use password_verify if passwords are hashed)
        if ($input_password === $hashed_password) {
            // Password is correct, start a session
            $_SESSION['username'] = $input_username;
            echo "Login successful! Welcome, " . $input_username;
            $status="success";
        } else {
            echo "Invalid username or password.";
            $status="fail";
        }
    } else {
        echo "Login Failed.";
        $status="fail";
    }

    $stmt->close();
}

// Close the connection
$conn->close();
?>


