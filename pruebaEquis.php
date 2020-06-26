<?php 

function equis($n){
$init = 1;
$end = $n;

if ($n == 0) {
	echo "ERROR";
} else{

for ($i = 1; $i <= $n; $i++) {
     $str = "";
     for ($j = 1; $j <= $n; $j++) {
         $str .= ($init == $j || $end == $j) ? "x" : "_";
     }
     $init++;
     $end--;
     echo "<br>";
     echo $str;
}
}
}

equis(0);

	
 ?>