<?php
if(!function_exists(call_page))      
{
function call_page($folder,$page)
{
global $conn;
global $vars;
if(file_exists($folder."/".$page.".php"))
	require($folder."/".$page.".php");
else
 msg(false,"Missing Page");


}

}


if(!function_exists(msg))      
{
function msg($success,$info)
{

echo json_encode(["success"=>$success,"Info"=>$info]);


}

}

?>