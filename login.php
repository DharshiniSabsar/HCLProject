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
            $status="Success";
        } else {
            echo "Invalid username or password.";
            $status="Fail";
        }
    } else {
        echo "Login Failed.";
        $status="Fail";
    }

    $stmt->close();
}

// Database connection settings
$charset = 'utf8mb4';

$dsn = "mysql:host=$servername;dbname=$dbname;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $username, $password, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}


function insertLoginEvent($pdo, $UserName, $ipAddress, $deviceInfo, $geoLoc, $loginStatus) {
    $tStamp = date('Y-m-d H:i:s'); // Current timestamp

    $sql = "INSERT INTO login_event (Username, TStamp, IP_Address, Device_Info, GeoLoc, Login_Status) 
            VALUES (:Username, :tStamp, :ipAddress, :deviceInfo, :geoLoc, :loginStatus)";

    $stmt = $pdo->prepare($sql);
    
    // Bind parameters
    $stmt->bindParam(':Username', $UserName);
    $stmt->bindParam(':tStamp', $tStamp);
    $stmt->bindParam(':ipAddress', $ipAddress);
    $stmt->bindParam(':deviceInfo', $deviceInfo);
    $stmt->bindParam(':geoLoc', $geoLoc);
    $stmt->bindParam(':loginStatus', $loginStatus);

    // Execute the statement
    if ($stmt->execute()) {
        echo "<br>";
        echo "Login event recorded successfully.";
        if ($loginStatus == 'Success') {
            header("Location: ULAR_Dashboard.html"); // Redirect to dashboard
            exit();
        }
        else if ($loginStatus == 'Fail') {
            header("Location: ULAR_Login.html"); // Redirect to login page if not logged in
            exit();
        } 
    } else {
        echo "<br>";
        echo "Error recording login event.";
        header("Location: ULAR_Home.html");
        exit();
    }
}

// Example usage
$UserName = $input_username; // Replace with actual Username
$ipAddress = $_SERVER['REMOTE_ADDR']; // Capture the IP address
$deviceInfo = 'Chrome'; // Replace with actual device info
$geoLoc = 'Canada'; // Replace with actual geo location
$loginStatus = $status; // Can be 'Success' or 'Failed'

insertLoginEvent($pdo, $UserName, $ipAddress, $deviceInfo, $geoLoc, $loginStatus);



// Close the connection
$conn->close();
?>


