<?php  


function repetidosArray($arrayDePrueba){
$temp = $arrayDePrueba[0];
$repetidos = Array();
$x = 1;
 
for ($i = 1; $i < count($arrayDePrueba); $i++) {
 
    $actual = strcasecmp($temp, $arrayDePrueba[$i]);

    if ($actual == 0) {
 
        $repetidos[$arrayDePrueba[$i]] = ++$x;
 
    } else {
 
        $x = 1;
    }
 
    $temp = $arrayDePrueba[$i];
}           
 
arsort($repetidos);
$llave = array_keys($repetidos);
$valor = array_values($repetidos);
 
echo "Numero de repeticiones: ".$valor[0]."<br> Numero que se repite".ucwords($llave[0]);
}
$arrayDePrueba = Array(20,11,11,15,15,60,65,7,7,7);
repetidosArray($arrayDePrueba);
?>