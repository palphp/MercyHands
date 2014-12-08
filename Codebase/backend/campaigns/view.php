<?php

$start=(int)$vars['start'];
$limit=$vars['limit']>100?100:$vars['limit'];

$check_login=$conn->query("select  members_campaigns.*, members.first_name as 'member', categories.name as 'category',
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
    
    group by members_campaigns.id

     limit $start, $limit");
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