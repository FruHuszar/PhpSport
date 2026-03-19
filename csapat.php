<?php
class Csapat {
    private $csapatAzon;
    private $nev;
    private $orszagAzon;
    private $kep;

    // Getterek
    function getNev() { return $this->nev; }
    function getKep() { return $this->kep; }
    
    // Setterek (Javítva: most már fogadnak paramétert)
    function setCsapatAzon($id) { $this->csapatAzon = $id; }
    function setNev($nev) { $this->nev = $nev; }
    function setOrszagAzon($oId) { $this->orszagAzon = $oId; }
    function setKep($kep) { $this->kep = $kep; }

    function __toString() {
        return "Csapat: $this->nev (ID: $this->csapatAzon)";
    }
}
?>