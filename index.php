<?php
require_once "db.php";
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <title>Sport Adatbázis</title>
</head>
<body>
    <?php
        require_once "db.php";
        try {
            $db = new DB();

            // Módosítás
            $db->csapatModositas("Királyok", "Császárok");

            // Törlés
            $db->tagTorlesCsapat("Kutya");

            // Beszúrás (teszteléshez)
            // $db->csapatHozzaad("Új Csapat", 1, "default.png");

            // Megjelenítés
            echo "<h1>Csapatok</h1>";
            $db->csapatokMegjelenit();

            $db->kapcsolatLezar();

        } catch (Exception $e) {
            echo "Hiba: " . $e->getMessage();
        }
    ?>
</body>
</html>