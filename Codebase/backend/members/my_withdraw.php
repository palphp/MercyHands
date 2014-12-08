<?php

if($_SESSION['id']!=""){
	$check_campaigns=$conn->query("SELECT member_withdraw.* FROM (`member_withdraw`)
		LEFT JOIN `payment_gateways` 
		ON `member_withdraw`.`gateway` = `payment_gateways`.`id`
		WHERE `member_withdraw`.`status` = '1' and `member_withdraw`.`member` = ".$_SESSION['id']);
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