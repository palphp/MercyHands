<?php

$array_of_sent_values=array(
"alert_actions"=>(int)$vars['alert_actions'],
"alert_add_funds"=>(int)$vars['alert_add_funds'],
"alert_project"=>(int)$vars['alert_project'],
"alert_comments"=>(int)$vars['alert_comments']);

if($_SESSION['id']!=""){

$sql = "UPDATE `members` SET ";
foreach($array_of_sent_values as $id=>$val)
	$sql .= " `$id` = '$val', ";
$sql = substr($sql, 0,-2). " where id=" . $_SESSION['id'];
if($conn->query($sql))

			{
			msg(true,"Success");

			}
			else
			{
			msg(false,"fail");
	
			}	

}
else
{
	msg(false,"You need to log in first!");
}
///////////////////////////////////////////////

?>