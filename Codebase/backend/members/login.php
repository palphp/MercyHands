<?php

$email=$vars['email'];
$password=$vars['password'];

$check_login=$conn->query("select `id`,`email`,first_name,`last_name` from `members` where `email`='$email' and `password` = MD5('$password') and `status` = 1 limit 1");

if($check_login)
{

$obj=$check_login->fetch_object();

if(!is_null($obj))
{
	$_SESSION['id']=$obj->id;
	msg(true,$obj);
}
else
{
msg(false,"Please enter your email and password correctly! ");
}

mysqli_free_result($check_login);


}
else
{

}


   

    ?>