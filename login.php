<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CS-631 Bank & Co.</title>
	<link rel="stylesheet" href="style.css">
	<link rel="icon" type="image/png" href="logo.png">
</head>

<body>
<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["LIName"];
    $ssn = $_POST["LISSN"];

    $servername = "sql1.njit.edu";
    $username = "sds";
    $password = "Pillowcase#1";
    $dbname = "sds";
    $con = mysqli_connect($servername, $username, $password, $dbname);

    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    // Check in the Customers table
    $queryCustomers = "SELECT * FROM Customers WHERE CustName = '$name' AND CustSSN = '$ssn'";
    $resultCustomers = mysqli_query($con, $queryCustomers);

    // Check in the Employees table
    $queryEmployees = "SELECT * FROM Employees WHERE EmpName = '$name' AND EmpSSN = '$ssn'";
    $resultEmployees = mysqli_query($con, $queryEmployees);

    if (mysqli_num_rows($resultCustomers) > 0) {
        $_SESSION["LIName"] = $name;
        $_SESSION["LISSN"] = $ssn;
        echo '<script>alert("Welcome back, ' . $name . '"); window.location.href = "custInfo.php";</script>';
        die;
    } 
    elseif (mysqli_num_rows($resultEmployees) > 0) {
        $_SESSION["LIName"] = $name;
        $_SESSION["LISSN"] = $ssn;
        echo '<script>alert("Welcome back, ' . $name . '"); window.location.href = "employTest.html";</script>';
        die;
    } 
    else {
        echo '<script>alert("User not found. Please make sure all fields were entered correctly.")</script>';
    }
    mysqli_close($con);
}
?>
	<header>
		<h1 class="heading">CS631 Bank & Co.</h1>
		<h3 class="title">Database System Design & Management</h3>
	</header>

	<!-- container div -->
	<div class="container">

		<!-- upper button section to select
			the login or signup form -->
		<div class="slider"></div>
		<div class="btn">
			<button type="button" class="login">Login</button>
			<button type="button" class="signup">Signup</button>
		</div>

		<!-- Form section that contains the
			login and the signup form -->
		<form method="POST" action="login.php" name="LogInPage" id="LoginForm">
		<div class="form-section">

			<!-- login form -->
			<div class="login-box">
				<input type="text"
					class="name ele"
					name = "LIName"
					id = "LIName"
					placeholder="Enter your name">

				<input type="password"
					class="ssn ele"
					placeholder="SSN"
					name = "LISSN"
					id = "LISSN">

				<input type="submit" value="Submit" class="clkbtn">
			</div>
		</form>
		
		<form method="POST" action="login.php" name="SignUpPage" id="SignupForm">
			<!-- signup form -->
			<div class="signup-box">
				<input type="text"
					class="name ele"
					placeholder="Enter your name"
					name = "SUName"
					id = "SUName">

				<input type="text"
					class="zip ele"
					placeholder="Enter your Zipcode"
					name = "SUZip"
					id = "SUZip">

				<input type="password"
					class="ssn ele"
					placeholder="SSN"
					name = "SUSSN"
					id = "SUSSN">
				<input type="submit" value="Submit" class="clkbtn">
			</div>
		</div>
		</form>
	</div>
	<script src="index.js"></script>
</body>
</html>