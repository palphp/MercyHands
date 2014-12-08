<?php

if($_SESSION['id']!=""){
	$check_campaigns=$conn->query("SELECT members_wallet.id,members_wallet.amount,members_wallet.transaction_key as 'transaction_ID',members_wallet.status,members_wallet.details, members_campaigns.title as 'campaign'
FROM (`members_wallet`)
LEFT JOIN `members_campaigns` 
ON `members_wallet`.`campaign` = `members_campaigns`.`id`
WHERE `members_wallet`.`status` = '1' and `members_wallet`.`member` = ".$_SESSION['id']);
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

	}
	}
	else{
		msg(false,"You need to log in first!");
	}

   

    ?>