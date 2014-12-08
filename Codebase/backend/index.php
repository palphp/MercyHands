<?php
header('Content-Type: application/json');
require("config/conn.php");


// Get POST DATA
$vars = (array)(json_decode(json_encode(($_POST))));
foreach ($vars as $id=>$val)
	$vars[$id]=mysqli_real_escape_string($conn,$val);

$params = (array)json_decode(file_get_contents('php://input')); 

foreach ($params as $id=>$value)
	$params[$id]=mysqli_real_escape_string($conn,$value);
	



$vars=array_merge($vars, $params);


// Here we go get any file within system


$folder=$vars['folder'];
$page=$vars['page'];


call_page($folder,$page);




mysqli_close($conn);
?>