<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testing Site 1</title>
    <link rel="icon" type="image/png" href="logo.png">
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
    echo "<link rel='stylesheet' href='style.css'>";

    // SQL query
    $query = "SELECT BranchID, COUNT(*) AS EmployeeCount
              FROM Employees
              GROUP BY BranchID";

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
