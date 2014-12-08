<?php

$id=(int)$vars['id'];
//members_campaigns.*,

$check_login=$conn->query("select   members_campaigns.*,
	members.first_name,
	members.last_name,
	members.city,
	members.website,
	members.facebook,
	members.twitter,
	members.linkedin,
	members.google_plus,
	members.youtube,
	DATEDIFF( DATE_ADD(members_campaigns.date_time,INTERVAL members_campaigns.total_days DAY),NOW()) as 'days_left',
	sum(members_wallet.amount * 1) as  'collected',
	count(members_wallet.amount) as  'helpers'

	from members_campaigns
	LEFT JOIN members_wallet
	ON members_campaigns.id=members_wallet.campaign
    
    LEFT JOIN categories
	ON members_campaigns.category=categories.id
    
    LEFT JOIN members
	ON members_campaigns.member=members.id
  	
  	where   members_campaigns.id=$id
    group by members_campaigns.id

    ");
if($check_login)
{
	$arrayofinfections= array();
	while($obj=$check_login->fetch_object())
	{

		$arrayofinfections[] = (array)$obj;
	}


	if(sizeof($arrayofinfections)>0)
	{

		msg(true,$arrayofinfections);
	}
	else
	{
		msg(false,"No Data Found");
	}

	mysqli_free_result($check_login);


}
else
{

}




?>