<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testing Site 2</title>
    <link rel="icon" type="image/png" href="logo.png">
    <link rel='stylesheet' href='style.css'>
</head>

<body>
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

    // SQL query
    $query = "SELECT Employees.EmpSSN
              FROM Employees
              INNER JOIN Customers ON Customers.PersBankerSSN = Employees.EmpSSN
              GROUP BY Employees.EmpSSN
              HAVING COUNT(*) > 1";

    $result = mysqli_query($con, $query);

    echo '<div class="container4">';
    echo "<table>";
    echo "<tr>";

    // Display column headers
    while ($next = mysqli_fetch_field($result)) {
        echo "<th>" . $next->name . "</th>";
    }
    echo "</tr>";

    // Display data rows
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
        }
        echo "</tr>";
    }

    echo "</table>";
    echo '<a href="https://web.njit.edu/~sds/CS361Bank/employTest.html" class="clkbtn">Home</a>';
    echo '</div>';

    mysqli_close($con);
    ?>

</body>

</html>