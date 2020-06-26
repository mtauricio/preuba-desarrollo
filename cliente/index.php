<?php 

require_once "lib/nusoap.php";

$url = "http://localhost/prueba/WebService/index.php";
$client = new nusoap_client($url."?wsdl");
$employees = $client->call('mostrarEmpleados');
$employees = json_decode($employees);

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Prueba</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

	<div class="container">
            <div class="row">
                <div class="col-sm-10 mx-auto">
                  
                  <table class="table border-1 shadow" >
                      <thead>
                          <tr>
                              
                              <th>Apellido</th>
                              <th>Nivel Educativo</th>
                              
                          </tr>
                      </thead>
                      <tbody>
                      	<?php
   
  
 				  
 				  foreach ($employees as $employee) {
				
 				     ?>
                         
                          <tr>
                              <td><?php echo $employee->lastname;?></td>
                              <td><?php echo $employee->description;?></td>
                              

                          </tr>
                          <?php } ?>
                       
                      </tbody>
                  </table>  
                </div>
            </div>
        </div>
</body>
</html>