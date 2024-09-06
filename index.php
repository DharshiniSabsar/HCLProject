<?php 
  session_start(); 

  if (!isset($_SESSION['Username'])) {
  	$_SESSION['msg'] = "You must log in first";
  	header('location: ULAR_Login.php');
  }
  if (isset($_GET['logout'])) {
  	session_destroy();
  	unset($_SESSION['Username']);
  	header("location: ULAR_Login.php");
  }
?>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="header">
	<h2>LOGIN SUCCESS</h2>
</div>
    <!-- logged in user information -->
    <?php  if (isset($_SESSION['Username'])) : ?>
    	<p><strong>Redirecting you to Admin Page...</strong></p>
    <?php endif ?>
</div>

</body>
</html>