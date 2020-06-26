<?php
function conexion(){
	$con= mysql_connect("locahost", "root", "") or die(mysql_error());
	mysql_select_db("prueba",$con);
	return ($con);
}