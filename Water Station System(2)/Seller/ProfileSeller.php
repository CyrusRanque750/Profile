<?php
require "../Include/connect.php";

// Check if status is set via GET
if (isset($_GET['status']) && isset($_GET['id'])) {
    $status = $_GET['status']; // Get the status (Available or Not Available)
    $id = intval($_GET['id']); // Get the employee ID

    // Start a transaction to ensure both operations are atomic
    mysqli_begin_transaction($conn);

    try {
        // Update the availability status in the tb_upload table
        $updateQuery = "UPDATE tb_upload SET availability_status = ? WHERE id = ?";
        $stmt = mysqli_prepare($conn, $updateQuery);
        mysqli_stmt_bind_param($stmt, 'si', $status, $id); // 'si' means string and integer
        mysqli_stmt_execute($stmt);

        // Insert the status change into the status_logs table
        $logQuery = "INSERT INTO status_logs (employee_id, status) VALUES (?, ?)";
        $stmtLog = mysqli_prepare($conn, $logQuery);
        mysqli_stmt_bind_param($stmtLog, 'is', $id, $status); // 'is' means integer and string
        mysqli_stmt_execute($stmtLog);

        // Commit the transaction
        mysqli_commit($conn);
        
        // Close the prepared statements
        mysqli_stmt_close($stmt);
        mysqli_stmt_close($stmtLog);

        // Redirect to the ProfileSeller page to show the result
        header("Location: ProfileSeller.php?status=" . urlencode($status));
        exit();

    } catch (Exception $e) {
        // Rollback in case of an error
        mysqli_rollback($conn);
        echo "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@533&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="../Css/ProfileSeller.css">
    <script src="../Script/NavBar.js" async></script>
    <script src="../Script/Collapsible.js" async></script>
    <title>Profile Seller</title>
</head>
<body>
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
        <path fill="#0099ff" fill-opacity="1" d="M0,96L13.3,112C26.7,128,53,160,80,181.3C106.7,203,133,213,160,218.7C186.7,224,213,224,240,186.7C266.7,149,293,75,320,69.3C346.7,64,373,128,400,176C426.7,224,453,256,480,272C506.7,288,533,288,560,250.7C586.7,213,613,139,640,122.7C666.7,107,693,149,720,186.7C746.7,224,773,256,800,250.7C826.7,245,853,203,880,197.3C906.7,192,933,224,960,202.7C986.7,181,1013,107,1040,85.3C1066.7,64,1093,96,1120,90.7C1146.7,85,1173,43,1200,48C1226.7,53,1253,107,1280,144C1306.7,181,1333,203,1360,224C1386.7,245,1413,267,1427,277.3L1440,288L1440,0L1426.7,0C1413.3,0,1387,0,1360,0C1333.3,0,1307,0,1280,0C1253.3,0,1227,0,1200,0C1173.3,0,1147,0,1120,0C1093.3,0,1067,0,1040,0C1013.3,0,987,0,960,0C933.3,0,907,0,880,0C853.3,0,827,0,800,0C773.3,0,747,0,720,0C693.3,0,667,0,640,0C613.3,0,587,0,560,0C533.3,0,507,0,480,0C453.3,0,427,0,400,0C373.3,0,347,0,320,0C293.3,0,267,0,240,0C213.3,0,187,0,160,0C133.3,0,107,0,80,0C53.3,0,27,0,13,0L0,0Z"></path>
    </svg>

    <nav>
        <ul class="home-ul">
            <li class="logo"><a href="../FrontPage.php"><img src="../Image/Thirstdrop.png" alt="" height="30" width="30" class="logo"></a></li>
            <span class="menu-toggle" onclick="toggleMenu()">☰</span>
            <div class="nav-center">
                <li class="nav-links"><a href="#about">SELLER</a></li>
            </div>
            <li class="nav-button"><a href="../FrontPage.php">Logout</a></li>
        </ul>
    </nav>

    <!-- Side Bar -->
    <input type="checkbox" id="menu-toggle">
    <label for="menu-toggle" class="menu-icon">
    <i class="fa fa-bars" aria-hidden="true"></i>
    </label>
    <div class="slideout-sidebar">
        <ul>
            <li><a href="ProfileSeller.php">Profile</a></li>
            <li><a href="SellerDashboard.php">Dashboard</a></li>
            <li class="collapsible">Information</li>
            <div class="info">
                <i><a href="Orders.php">Orders</a></i>
                <i><a href="Shop.php">Shop</a></i>
                <i><a href="Employee.php">Employee</a></i>
                <i><a href="Reviews.php">Reviews</a></i>
            </div>
        </ul>
    </div>

    <div class="container">
        <div class="child-container">
            <h3>Seller's Information</h3>
            <div class="img-container">
                <img src="../Image/UserIcon.jpg" alt="User Icon">
            </div>
            <button class="edit-profile-button">Edit Profile</button>
            <div class="info-container">
                <h4>Owner's Name:</h4>
                <p>Joniel Gesta</p>
                <h4>Contact Number:</h4>
                <p>092121031186</p>
                <h4>Telephone Number:</h4>
                <p>000-000-000</p>
                <h4>Email Address:</h4>
                <p>water@gmail.com</p>
                <h4>Station Address:</h4>
                <p>Jones, Sambag 2, Cebu City</p>
            </div>
        </div>

        <div class="employee-container">
            <h3>Employee</h3>
            <div class="table-container">
                <table class="table-container">
                    <tr>
                        <th>#</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Information</th>
                        <th>Available</th>
                        <th>Actions</th>
                    </tr>
                    <?php
                    $i = 1;
                    $rows = mysqli_query($conn, "SELECT * FROM tb_upload ORDER BY id DESC");

                    foreach ($rows as $row) : ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td>
                            <img src="../Image/<?php echo htmlspecialchars($row["image"]); ?>" alt="Image" width="100" height="100">
                        </td>
                        <td><?php echo htmlspecialchars($row["name"]); ?></td>
                        <td><?php echo !empty($row["info"]) ? htmlspecialchars($row["info"]) : 'No information available'; ?></td>
                        <td><?php echo htmlspecialchars($row["availability_status"]); ?></td>
                        
                        <td>
                            <form action="" method="get" style="display:inline;">
                                <button type="submit" name="status" value="Available" class="view-button">√</button>
                                <input type="hidden" name="id" value="<?php echo htmlspecialchars($row['id']); ?>">
                            </form>
                            <form action="" method="get" style="display:inline;">
                                <button type="submit" name="status" value="Not Available" class="delete-button">X</button>
                                <input type="hidden" name="id" value="<?php echo htmlspecialchars($row['id']); ?>">
                            </form>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
