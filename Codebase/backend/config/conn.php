<?php
session_start();
$servername = "5.9.31.189";
$username = "feras_mercyu";
$password = "123258";
$database="feras_mercy";
include("functions.php");
$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


?>