<?php
include 'functions.php';
// данные доступа к базе данных 
	$db_host="localhost"; // обычно не нужно изменять 
	$db_user="785258"; // имя пользователя БД 
	$db_password="lasttonightfy"; // пароль БД 
	$db_name = "785258"; // имя БД 
	$table_name = "785258"; 

	$p = $_POST;

	mysql_connect($db_host, $db_user, $db_password) or die (mysql_error()); 
	mysql_select_db($db_name) or die (mysql_error()); 
	mysql_query("SET NAMES 'utf8'"); 
	
	// $query = 'INSERT INTO `users`(`id`) VALUES (5646464)';
	// $sql1 = mysql_query($query);
	


	$prof = $p['profile'];
	$prof = json_decode($prof);
	
	$props = array();
	
	foreach($prof as $key => $prop)
	{
	echo '[ '.$key.' = '.$prop->value.' ]';
		echo $prop->type.', ';
		if($prop->type == 'string') array_push($props, '`'.$key.'` = "'.$prop->value.'"');
		if($prop->type == 'number') array_push($props, '`'.$key.'` = '.$prop->value.'');
		if($prop->type == 'bool') array_push($props, '`'.$key.'` = '.$prop->value.'');
		if($prop->type == 'list')
		{
			$list = $prop->value;
			echo '-'.$list[0].'--'.count($list).'--';
			if(count($list) >0)
			{
				array_push($props, "`".$key."` = ' \"".implode('","',$list)."\"'");
			}
			else
			{
				array_push($props, "`".$key."` = ''");
			}
		}
	}
	$props = implode(',',$props);
	
	$query = 'UPDATE `users` SET '.$props.' WHERE `id` ='.$prof->id->value; 
	$sql = mysql_query($query);
	echo $query;
	
?>