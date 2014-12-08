<?php

if($_SESSION['id']!=""){
	$check_campaigns=$conn->query("SELECT `id`, `title`, `date_time`, `status` FROM `members_campaigns` WHERE member =".$_SESSION['id']);
	if($check_campaigns)
	{
		$arrayofcategories= array();
	while($obj=$check_campaigns->fetch_object())
	{

	$arrayofcategories[] = (array)$obj;
	}


	if(sizeof($arrayofcategories)>0)
	{

		msg(true,$arrayofcategories);
	}
	else
	{
	msg(false,"No Data Found");
	}

	mysqli_free_result($check_campaigns);


	}
	else
	{
msg(false,"No Data Found");
	}
	}
	else{
		msg(false,"You need to log in first!");
	}

   

    ?>