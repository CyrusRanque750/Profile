<?php
require '../Include/connect.php';

// Enable error reporting for debugging purposes
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Fetch all approved shops
$query = "SELECT * FROM shopinfo WHERE status = 'approved'";
$result = mysqli_query($conn, $query);

// Check for query errors
if (!$result) {
    echo "Error fetching approved shops: " . mysqli_error($conn);
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@533&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="../Css/approved-shops.css">
    <script src="../Script/NavBar.js" async></script>
    <script src="../Script/Collapsible.js" async></script>
    <title>Approved Shops</title>
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
                <h2 class="admin">ADMIN</h2>
            </div>
            <li class="nav-button"><a href="../FrontPage.php">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
    <div class="site-title">
        <h1>Approved Shops</h1>
        <a href='AfterSearch.php' class="go-back">Go back</a>
    </div>
    <?php while ($shop = mysqli_fetch_assoc($result)): ?>
    <a href="ShopDetails.php?id=<?php echo urlencode($shop['id']); ?>" class="container-shop">
        <div>
            <img src="../Image/<?php echo htmlspecialchars($shop['profilePic']); ?>" width="100" height="100" alt="Profile Picture">
        </div>
        <div class="shop-details">
            <div class="detail-item">
                <p><strong>Shop Name:</strong></p>
                <p><?php echo htmlspecialchars($shop['name']); ?></p>
            </div>
            <div class="detail-item">
                <p><strong>Email:</strong></p>
                <p><?php echo htmlspecialchars($shop['email']); ?></p>
            </div>
            <div class="detail-item">
                <p><strong>Contact:</strong></p>
                <p><?php echo htmlspecialchars($shop['contact']); ?></p>
            </div>
            <div class="detail-item">
                <p><strong>Address:</strong></p>
                <p><?php echo htmlspecialchars($shop['address']); ?></p>
            </div>
            <div class="detail-item">
                <p><strong>Information:</strong></p>
                <p><?php echo !empty($shop['info']) ? htmlspecialchars($shop['info']) : 'No information available'; ?></p>
            </div>
        </div>
    </a>
    <?php endwhile; ?>
</div>


 
</body>
</html>
