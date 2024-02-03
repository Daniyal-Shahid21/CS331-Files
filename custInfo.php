<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Customer Information</title>
   <link rel="icon" type="image/png" href="logo.png">
</head>

<?php
session_start();
$servername = "sql1.njit.edu";
$username = "sds";
$password = "Pillowcase#1";
$dbname = "sds";
$con = mysqli_connect($servername, $username, $password, $dbname);

if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$ssn = $_SESSION["LISSN"];
echo "<link rel='stylesheet' href='style.css'>";

// Retrieve AccNumber from HAS table
$queryHas = "SELECT AccNumber FROM HAS WHERE CustSSN = '$ssn'";
$resultHas = mysqli_query($con, $queryHas);

if (mysqli_num_rows($resultHas) > 0) {
    $rowHas = mysqli_fetch_assoc($resultHas);
    $accNumber = $rowHas['AccNumber'];

    // Retrieve data from Accounts table
    $queryAccounts = "SELECT * FROM Accounts WHERE AccNumber = '$accNumber'";
    $resultAccounts = mysqli_query($con, $queryAccounts);

    
    echo '<div class = "container2">';
    echo "<table>";
    echo "<tr>";
    while ($next = mysqli_fetch_field($resultAccounts)) {
        echo "<th>" . $next->name . "</th>";
    }
    echo "</tr>";

    $rowAccounts = mysqli_fetch_assoc($resultAccounts);

    echo "<tr>";
    foreach ($rowAccounts as $value) {
        echo "<td>" . $value . "</td>";
    }
    echo "</tr>";
    echo "</table>";

    // Retrieve data from subclass tables
    $queryLoan = "SELECT * FROM Loan WHERE AccNumber = '$accNumber'";
    $resultLoan = mysqli_query($con, $queryLoan);

    $queryMoneyMarketAcc = "SELECT * FROM MoneyMarketAcc WHERE AccNumber = '$accNumber'";
    $resultMoneyMarketAcc = mysqli_query($con, $queryMoneyMarketAcc);

    $querySavingsAcc = "SELECT * FROM SavingsAcc WHERE AccNumber = '$accNumber'";
    $resultSavingsAcc = mysqli_query($con, $querySavingsAcc);

    $queryCheckingsAcc = "SELECT * FROM CheckingsAcc WHERE AccNumber = '$accNumber'";
    $resultCheckingsAcc = mysqli_query($con, $queryCheckingsAcc);

    // Display data from subclass tables
    echo "<h2>Loan</h2>";
    echo '<span>';
    displayTable($resultLoan);
    echo '<br>';
    echo '</span>';

    echo "<h2>MoneyMarketAcc</h2>";
    echo '<span>';
    displayTable($resultMoneyMarketAcc);
    echo '<br>';
    echo '</span>';

    echo "<h2>SavingsAcc</h2>";
    echo '<span>';
    displayTable($resultSavingsAcc);
    echo '<br>';
    echo '</span>';

    echo "<h2>CheckingsAcc</h2>";
    echo '<span>';
    displayTable($resultCheckingsAcc);
    echo '<br>';
    echo '</span>';

    echo '</div>';
} 
else {
    echo "No account found for the provided SSN.";
}

mysqli_close($con);

// Function to display table
function displayTable($result)
{
    echo "<table>";
    echo "<tr>";
    while ($next = mysqli_fetch_field($result)) {
        echo "<th>" . $next->name . "</th>";
    }
    echo "</tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
        }
        echo "</tr>";
    }

    echo "</table>";
}
?>
</html>