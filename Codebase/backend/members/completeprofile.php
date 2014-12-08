<?php

$photo=$vars['photo'];
$array_of_sent_values=array(
"first_name"=>$vars['first_name'],
"newsletter"=>1,
"status"=>1,
"last_name"=>$vars['last_name'],
"address"=>$vars['address'],
"city"=>$vars['city'],
"Country"=>$vars['Country'],
"about"=>$vars['about'],
"occupation"=>$vars['occupation'],
"interest"=>$vars['interest'],
"skills"=>$vars['skills'],
"website"=>$vars['website'],
"facebook"=>$vars['facebook'],
"twitter"=>$vars['twitter'],
"linkedin"=>$vars['linkedin'],
"google_plus"=>$vars['google_plus'],
"youtube"=>$vars['youtube']);

if($_SESSION['id']!=""){

$sql = "UPDATE `members` SET ";
foreach($array_of_sent_values as $id=>$val)
	$sql .= " `$id` = '$val', ";
$sql = substr($sql, 0,-2). " where id=" . $_SESSION['id'];

if($conn->query($sql))

			{
			if ($photo!='') {
				$entry = base64_decode($photo);
				$image = imagecreatefromstring($entry);
				$directory = dirname(__FILE__).DIRECTORY_SEPARATOR."../../files/members".DIRECTORY_SEPARATOR.$_SESSION['id'].".jpeg";
				imagejpeg($image, $directory);
				imagedestroy ( $image );

				$image_name=$_SESSION['id'].".jpeg";
				
			}

			msg(true,"Success");

			}
			else
			{
			msg(false,"Somthing went wrong while saving your infomation.");
	
			}



}
else
{
msg(false,"You need to log in first!");
}



   

    ?>