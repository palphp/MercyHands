<?php
$member=$_SESSION['id']==""?0:$_SESSION['id'];
$amount=(float)$vars['amount'];
$campaign=(int)$vars['campaign'];
$details=$vars['details'];
$custom=time().mt_rand(10,99);
$doner_name=$vars['doner_name'];
$hide=(int)$vars['hide'];

if($conn->query("INSERT INTO `members_wallet` (`id`, `member`, `amount`,
	 `status`, `details`,
	`campaign`, `date_time`, `transaction_key`, `custom`,`doner_name`, `hide`) 
	VALUES (NULL, '$member', '$amount', '0', '$details',
		'$campaign', CURRENT_TIMESTAMP, '', '$custom','$doner_name', '$hide')"))
{
	msg(true,["message"=>"Get Paypal Button","custom"=>$custom]);
}
else
{

	msg(false,"somthing went wrong , please try again!");


}
