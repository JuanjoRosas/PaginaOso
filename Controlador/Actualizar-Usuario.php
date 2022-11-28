<?php
session_start();
include ("../Modelo/Conexion/conexion.php");
if(isset($_POST["subir"])){
$radio=$_POST['optionsRadios'];
if($radio=="option2"){
    $estudiante=3;
    mysqli_query($conexion, "UPDATE usuario SET ustipo = '$estudiante' WHERE id =")
}

if(consultasSQL::UpdateSQL("cliente", $campos, "NIT='$code'")){
    $_SESSION['nombreUser'];
    echo '<script> location.href="../index.php"; </script>';
}else{
    echo '<script>swal("ERROR", "Ocurrio un error inesperado", "error");</script>';
}
}

?>