<?php
session_start();
include ("../Modelo/Conexion/conexion.php");

$tipo=$_GET['codigo'];

    $estudiante=0;

    $consulta= "UPDATE estudiante SET codigo = '$estudiante' WHERE codigo = '$tipo'";
    $resultado = mysqli_query($conexion,$consulta);

echo "<script> location='../Paginas-Admin/Certificado.php'</script>";

mysqli_close($conexion);

?>