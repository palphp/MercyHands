<?php

$first_name=$vars['name'];
$email=$vars['email'];
$password=$vars['password'];
$check= (int)$vars['check'];

if($_SESSION['user']==""){
	if($check==1){
		if(strlen($first_name) >= 2 and strlen($password) >=2 and filter_var($email, FILTER_VALIDATE_EMAIL)){

			if($conn->query("INSERT INTO members(first_name, email ,password) VALUES ('$first_name','$email',MD5('$password'))"))
			{
				
				$_SESSION['user']=$email;
				$id=mysqli_insert_id($conn);
				$_SESSION['id']=$id;
				msg(true,$id);

			}
			else
			{

				msg(false,"This email is already Exist !");
			}
		}
		else
		{
			msg(false,"Please, Verify your data! ");
		}
	}
	else{
		msg(false,"You have to agree to our TOS");

	}
}
else
{
	msg(false,"You are already logged in!");
}
///////////////////////////////////////////////

?>