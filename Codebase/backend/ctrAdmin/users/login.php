<?php
$username=$vars['username']==""?"hamdan":"";
$password=$vars['password']==""?"hamdan123":"";;

$check_login=$conn->query("select userid,email,username,level from users where username='$username' and password = MD5('$password') limit 1");
$obj=$check_login->fetch_object();

echo json_encode($obj);

mysqli_free_result($check_login);
   

    ?>