<?php
session_start();
include 'db_connection.php';

if (!isset($_SESSION['userID'])) {
    header("Location: login.html");
    exit();
}

$userID = $_SESSION['userID'];

// Fetch user memories
$sql = "SELECT memoryID, imagePath, caption FROM memory WHERE userID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $userID);
$stmt->execute();
$result = $stmt->get_result();
$memories = $result->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Memory Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Chenla&display=swap" rel="stylesheet">
    <style>
 body {
            font-family: 'Chenla', sans-serif;
            margin: 0;
            background-color: #FFF8F1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .header, .footer {
            background-color: #7C1F1B;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 0 0 30px 30px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        }
        .footer {
            padding: 10px;
            border-radius: 30px 30px 0 0;
            flex-direction: column;
            text-align: center;
            margin-top: 10px;
        }
        .footer-links {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }
        .footer-links a {
            color: #CBB696;
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 14px;
        }
        .footer-links a:hover {
            color: #ae9c80;
        }
        .footer p {
            color: #CBB696;
            margin-top: 3px;
            font-size: 12px;
        }
        .logo-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .nav-icon {
            width: 50px;
            transition: transform 0.3s ease;
        }
        .nav-icon:hover {
            transform: scale(1.1);
        }
        .breadcrumb-nav {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            font-size: 18px;
            color: #7C1F1B;
            margin-bottom: 0px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            font-weight: bold;
        }
        .divider {
            flex-grow: 1;
            height: 2px;
            background-color: #9E1A1A;
            margin-left: 10px;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        .content {
            flex: 1; 
        }

        .upload-section-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .upload-title {
            font-size: 24px;
            color: #7C1F1B;
            margin-bottom: 10px;
        }
        .upload-section {
            background-color: #CBB696;
            border-radius: 50px;
            width: 70px;
            height: 70px;
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .upload-section:hover {
            transform: scale(1.05);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease;
        }
        .memory-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
            justify-content: center;
        }
        .memory-card {
            background-color: #7C1F1B;
            padding: 20px;
            border-radius: 20px;
            text-align: center;
            color: #FFF;
            position: relative;
        }
        .memory-card img {
            width: 200px;
            border-radius: 10px;
        }
        .memory-card:hover{
            transform: scale(1.02);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            transition: transform 0.3s ease;
        }
        .edit-btn, .delete-btn {
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }
        .edit-btn {
            background-color: #CBB696;
            color: white;
            margin-right: 5px;
        }
        .edit-btn:hover {
            background-color: #aa9c86;
        }
        .delete-btn {
            background-color: #CBB696;
            color: white;
        }
        .delete-btn:hover {
            background-color: #aa9c86;
        }    </style>
</head>
<body>
    <header class="header">
        <div class="logo-container">
            <a href="Bawhome.php">
                <img src="images/logo.png" alt="Logo" class="nav-icon"></a>
                <a href="favorites.php">
                <img src="images/heart.png" alt="Heart" class="nav-icon"></a>
        </div>
        <a href="profile.php">
        <img src="images/profile_color.png" alt="Profile" class="nav-icon"></a>
    </header>

    <nav class="breadcrumb-nav">
        <span><a href="Bawhome.php" style="text-decoration: none; color: #7C1F1B;">Home</a> &gt; <a href="profile.php" style="text-decoration: none; color: #7C1F1B;">Profile</a> &gt; <a href="memory.php" style="text-decoration: none; color: #7C1F1B;">Memory</a></span>
        <div class="divider"></div>
    </nav>

    <div class="content">
    <main class="main-content">
        <div class="upload-section-container">
            <h2 class="upload-title">Memories</h2>
            <label for="imageUpload" class="upload-section">
                <img src="images/upload_icon.png" alt="Upload" style="width: 50%; height: 50%; object-fit: contain;">
            </label>
            <input type="file" id="imageUpload" accept="image/*" style="display: none;">
        </div>

        <div class="memory-container" id="memoryContainer">
            <?php foreach ($memories as $memory): ?>
                <div class="memory-card" data-id="<?= $memory['memoryID'] ?>">
                    <img src="<?= htmlspecialchars($memory['imagePath']) ?>" alt="Memory" class="memory-img">
                    <p class="caption"><?= htmlspecialchars($memory['caption']) ?></p>
                    <button class="edit-btn">Edit</button>
                    <button class="delete-btn">Delete</button>
                    <input type="file" class="replace-image-input" accept="image/*" style="display: none;">
                </div>
            <?php endforeach; ?>
        </div>
    </main>
    </div>

    <footer class="footer">
        <div class="footer-links">
            <a href="about.html">About Us</a>
            <a href="contact.html">Contact</a>
            <a href="privacy.html">Privacy Policy</a>
            <a href="terms.html">Terms of Service</a>
        </div>
        <p>&copy; 2025 Bawsalah All rights reserved.</p>
    </footer>

    <script>
        document.getElementById('imageUpload').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
    // ✅ Check file size (max 8MB)
    if (file.size > 8 * 1024 * 1024) {
        alert("⚠️ Image is too large. Maximum allowed size is 8MB.");
        event.target.value = ''; // reset input
        return;
    }

    const caption = prompt("Do you want to add a caption? (Optional)", "");

    const formData = new FormData();
    formData.append("image", file);
    formData.append("caption", caption);

    fetch("upload_memory.php", {
        method: "POST",
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            location.reload();
        } else {
            alert(data.message); // ✅ Show server-side error
        }
    })
    .catch(err => {
        alert("⚠️ Something went wrong!");
        console.error(err);
    });
}

        });

        document.getElementById('memoryContainer').addEventListener('click', function(event) {
            const card = event.target.closest('.memory-card');
            const memoryID = card.dataset.id;

            if (event.target.classList.contains('delete-btn')) {
                if (confirm("Are you sure?")) {
                    fetch("delete_memory.php", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ memoryID })
                    }).then(() => card.remove());
                }
            } else if (event.target.classList.contains('edit-btn')) {
                const option = prompt("Choose an option:\n1. Edit Caption\n2. Replace Photo", "1");

                if (option === "1") {
                    const newCaption = prompt("New caption:", card.querySelector(".caption").textContent);
                    if (newCaption !== null) {
                        fetch("edit_memory.php", {
                            method: "POST",
                            headers: { "Content-Type": "application/json" },
                            body: JSON.stringify({ memoryID, caption: newCaption })
                        }).then(() => location.reload());
                    }
                } else if (option === "2") {
                    const input = card.querySelector(".replace-image-input");
                    input.click();
                    input.addEventListener('change', function () {
    const file = input.files[0];

    // ✅ Check file size (max 8MB)
    if (file.size > 8 * 1024 * 1024) {
        alert("⚠️ Image is too large. Maximum allowed size is 8MB.");
        input.value = ''; // reset input
        return;
    }

    const formData = new FormData();
    formData.append("memoryID", memoryID);
    formData.append("image", file);

    fetch("edit_memory.php", {
        method: "POST",
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            location.reload();
        } else {
            alert(data.message || "❌ Failed to replace image.");
        }
    })
    .catch(err => {
        alert("⚠️ Something went wrong while replacing the image.");
        console.error(err);
    });
}, { once: true });

                }
            }
        });
    </script>
</body>
</html>
