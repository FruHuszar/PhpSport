<?php
require_once "csapat.php";

class DB {
    private $host = "localhost";
    private $fNev = "root";
    private $jelszo = "";
    private $abNev = "sport";
    public $kapcsolat;

    public function __construct() {
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        $this->kapcsolat = new mysqli($this->host, $this->fNev, $this->jelszo, $this->abNev);
        $this->kapcsolat->set_charset("utf8");
    }

    public function kapcsolatLezar() {
        $this->kapcsolat->close();
    }

    // 1. Feladat: Módosítás
    public function csapatModositas($regiNev, $ujNev) {
        $sql = "UPDATE csapat SET nev='$ujNev' WHERE nev='$regiNev'";
        $this->kapcsolat->query($sql);
    }

    // 2. Feladat: Törlés (Tagok, majd Csapat)
    public function tagTorlesCsapat($csapatNev) {
        // Tagok törlése allekérdezéssel (így nem kell külön stmt)
        $sql1 = "DELETE FROM tag WHERE csapatAzon = (SELECT csapatAzon FROM csapat WHERE nev = '$csapatNev' LIMIT 1)";
        $this->kapcsolat->query($sql1);

        // Csapat törlése
        $sql2 = "DELETE FROM csapat WHERE nev = '$csapatNev'";
        $this->kapcsolat->query($sql2);
    }

    // 3. Feladat: Megjelenítés fetch_assoc-al
    public function csapatokMegjelenit() {
        $sql = "SELECT nev, kep FROM csapat";
        $eredmeny = $this->kapcsolat->query($sql);

        while ($sor = $eredmeny->fetch_assoc()) {
            echo "<div style='margin-bottom: 10px;'>";
            echo "<img src='forras/" . $sor['kep'] . "' alt='csapatkep' style='width:50px;'> ";
            echo "<span>" . $sor['nev'] . "</span>";
            echo "</div>";
        }
    }

    // 4. Feladat: Beszúrás
    public function csapatHozzaad($nev, $orszagAzon, $kep) {
        $sql = "INSERT INTO csapat (nev, orszagAzon, kep) VALUES ('$nev', $orszagAzon, '$kep')";
        $this->kapcsolat->query($sql);
    }
}
?>