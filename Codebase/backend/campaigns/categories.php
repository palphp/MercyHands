<?php


$check_categories=$conn->query("select  id , name from categories");
if($check_categories)
{
	$arrayofcategories= array();
while($obj=$check_categories->fetch_object())
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

mysqli_free_result($check_categories);


}
else
{
msg(false,"No Data Found");
}


   

    ?>