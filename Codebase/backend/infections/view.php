<?php

$start=(int)$vars['start'];
$limit=$vars['limit']>100?100:$vars['limit'];

$check_login=$conn->query("select infections.*, infections_categories.name as 'category' from infections, infections_categories where infections.category = infections_categories.id limit $start, $limit");
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