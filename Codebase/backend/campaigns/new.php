<?php

$member=$_SESSION['id'];
$title=$vars['title'];
$shortcut=$vars['shortcut'];
$summary=$vars['summary'];
$goal=(float)$vars['goal'];
$category=(int)$vars['category'];  // Must provide
$total_days=$vars['total_days'];
$city=$vars['city'];
$contact_mobile=$vars['contact_mobile'];
$description=$vars['description'];
$video=$vars['video'];
$status=0;  // by default the status is 0
//$last_save=$vars['last_save'];   // we need this date on modify
$photo=$vars['photo'];
$country=$vars['country'];
$img1=$vars['img1'];
$img2=$vars['img2'];
$img3=$vars['img3'];
$img4=$vars['img4'];
$img5=$vars['img5'];

$images = array($img1, $img2, $img3, $img4,$img5); 


///////////////////////////////////////
if($_SESSION['id']=="")
{
	msg(false,"You must  log in!");
	
}
else
{

	if(strlen($title) >= 2)
	{
		if($conn->query("INSERT INTO members_campaigns
			(id,member,title,shortcut,summary,goal,
				category,total_days,city,contact_mobile,description,video,image,status,country)
			VALUES (NULL,$member,'$title','$shortcut','$summary','$goal','$category','$total_days',
				'$city','$contact_mobile','$description','$video','3.jpeg','$status','$country')"))
		{
				$id=mysqli_insert_id($conn);

			if ($photo!='') {
				$entry = base64_decode($photo);
				$image = imagecreatefromstring($entry);
				$directory = dirname(__FILE__).DIRECTORY_SEPARATOR."../../files/campaigns".DIRECTORY_SEPARATOR.$id.".jpeg";
				imagejpeg($image, $directory);
				imagedestroy ( $image );

				$image_name=$id.".jpeg";
				
			}

			$conn->query("update members_campaigns set image='$image_name' where id=$id");

				$i=1;
			foreach ($images as $img_value) {
				if ($img_value!='') {
				$entry = base64_decode($img_value);
				$image = imagecreatefromstring($entry);
				$directory = dirname(__FILE__).DIRECTORY_SEPARATOR."../../files/campaigns".DIRECTORY_SEPARATOR.$id."-$i.jpeg";
				imagejpeg($image, $directory);
				imagedestroy ( $image );

				$image_name=$id."-$i.jpeg";
				$conn->query("update members_campaigns set img".$i."='$image_name' where id=$id");
				$i++;
			}
    
			}
			
			msg(true,"new campaign is saved!");

		}
		else
		{
			msg(false,"Something went wrong while saving campaign !");
		}
		
		
	}
	else
	{
		msg(false,"Please, Validate your inputs! ");
	}
}
///////////////////////////////////////////////

?> 