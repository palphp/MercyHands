<?php
$name=$vars['name'];
$email=$vars['email'];
$detail=$vars['detail'];

if(isset($_SERVER['HTTP_CLIENT_IP']) && ! empty($_SERVER['HTTP_CLIENT_IP'])){
    $ip = $_SERVER['HTTP_CLIENT_IP'];
}elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && ! empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
}else{
    $ip = (isset($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : '0.0.0.0';
}
if(strlen($name) >= 2 and strlen($detail) >=2 and filter_var($email, FILTER_VALIDATE_EMAIL)){
	$ip = filter_var($ip, FILTER_VALIDATE_IP);
	$ip = ($ip === false) ? '0.0.0.0' : $ip;
	$today = date("D F j, Y, g:i a"); 
	$id = uniqid();
	$msg_content = '<style>
#mailBody{font-family:san-serif,tahoma, arial;font-size:14px;width:85%;margin:20px auto;padding:20px;background:#f3f3f3;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;-moz-box-shadow:0px 1px 1px rgba(0,0,0, 0.2);-webkit-box-shadow:0px 1px 1px rgba(0,0,0, 0.2);box-shadow:0px 1px 1px rgba(0,0,0, 0.2);text-align:center;}
#mailBody h1{display:block;font-family:san-serif,arial,tahoma;font-size:28px;text-align:center;color:#128db6;}
#mailContent {width:90%;background:#ffffff;margin:20px auto;padding:20px 10px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;-moz-box-shadow:0px 1px 1px rgba(0,0,0, 0.1);-webkit-box-shadow:0px 1px 1px rgba(0,0,0, 0.1);box-shadow:0px 1px 1px rgba(0,0,0, 0.1);color:#666666;}
#mailContent a{color:#fa6b6b;text-decoration:none;}
b{color:#6ba1fa;}
a.button{display:block;padding:20px;background:#a0eef7;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;margin:15px auto;width:150px;text-align:center;color:#999999;}
#date {float:left;color:#999999;}
</style>
<body>
	<div id="mailBody">
		<h1>Contact questinnaire [' . $id . ']</h1>
		<div id="mailContent">
			'.$detail.'
		</div>
		<span id="date">'.$today.', From IP address : '.$ip.'</span>
	</div>
</body>';
	$to = "php.hamdan@gmail.com,hamdan.taima@gmail.com,me@feras.ps";
	$subject = "Contact questinnaire [" . $id . "]";
	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
	$headers .="from: $name <$email>";
	$sendEmail = @mail($to, $subject, $msg_content, $headers);
	if($sendEmail){
		msg(true,'We have received your message, and one of our team will be in touch with you ASAP, Thank you');
	}else{
		msg(false,'Something went wrong, please try again later');
	}
}else{
	msg(false,'Please double check the form below!');
}
?>