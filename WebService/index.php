<?php 

require_once "lib/nusoap.php";

$server = new soap_server();
$server->configureWSDL("webservice","urn:mundopccmb");

if(!isset($HTTP_RAW_POST_DATA)){
	$HTTP_RAW_POST_DATA = file_get_contents("php://input");
}


function mostrarEmpleados(){
	$cn = mysqli_connect("localhost","root","","prueba");
	$employees = $cn->query("SELECT  appx_employee.lastname, appx_educationlevel.description FROM  appx_employee
					inner JOIN appx_educationlevel ON appx_employee.educationlevel_id = appx_educationlevel.id ") or die("Ha fallado la conexión");
	
	$ArrEmployees = [];
	while ($employee = mysqli_fetch_array($employees,MYSQLI_ASSOC)) {
		$ArrEmployees[] = $employee ;
		
	}
	
	return json_encode($ArrEmployees);
}
//echo mostrarEmpleados();
$server->register("mostrarEmpleados",array(),
				 				    array("return"=>"xsd:string"),
				 				    "urn:mundopccmb",
				 				    "urn:mundopccmb#mostrarEmpleados",
				 				    "rpc",
				 				    "encoded",
				 				    "Muestra empleados"
				  );

$server->service($HTTP_RAW_POST_DATA);