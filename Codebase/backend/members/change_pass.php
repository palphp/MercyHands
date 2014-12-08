<?php

$current_Password=$vars['current_Password'];
$New_Password=$vars['New_Password'];
$confirm_Password=$vars['confirm_Password'];

if($_SESSION['id']!=""){
	if($New_Password==$confirm_Password){
		$check_pass=$conn->query("select password from `members` where
							 id=".$_SESSION['id']." and password=MD5('$current_Password') limit 1");
		
		if($check_pass)
		{

			$obj=$check_pass->fetch_object();

			if(!is_null($obj))
			{
				
				if($conn->query("UPDATE `members` SET `password`=MD5('$New_Password')  WHERE id=".$_SESSION['id']))
				{
					msg(true,"your password is changed Successfully");
				}
				else
				{
					msg(false,"fail");
				}
			}
			else
			{
			msg(false,"Please check your inputs!");	
			}
		}
		else
		{
		msg(false,"Please enter your  password correctly! ");
		}
	}
	else{
		msg(false,"The two passwords are not similar");

	}
}
else
{
	msg(false,"You need to log in first!");
}
///////////////////////////////////////////////

?>