<?php
session_start();
include ("../Modelo/Conexion/conexion.php");

$Nombre=$_POST['nombre'];
$Apellido=$_POST['apellido'];
$Telefono=$_POST['telefono'];
$Email=$_POST['email'];
$Direccion=$_POST['direccion'];

$code=$_SESSION['UserNIT'];
$campos="NombreCompleto='$Nombre',Apellido='$Apellido',Direccion='$Direccion',Telefono='$Telefono',Email='$Email'";


if(consultasSQL::UpdateSQL("cliente", $campos, "NIT='$code'")){
    $_SESSION['nombreUser'];
    echo '<script> location.href="../index.php"; </script>';
}else{
    echo '<script>swal("ERROR", "Ocurrio un error inesperado", "error");</script>';
}

?>