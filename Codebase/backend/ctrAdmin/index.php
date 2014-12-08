<?php
header('Content-Type: application/json');
require("../config/conn.php");


// Get POST DATA
$vars = (array)(json_decode(json_encode(($_POST))));
foreach ($vars as $id=>$val)
	$vars[$id]=mysql_real_escape_string($val);
// Here we go get any file within system


$folder=$vars['folder'];
$page=$vars['page'];



call_page($folder,$page);




mysqli_close($conn);
?>