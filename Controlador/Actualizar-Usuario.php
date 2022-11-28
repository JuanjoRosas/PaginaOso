<?php
session_start();
include ("../Modelo/Conexion/conexion.php");
if(isset($_POST["login"])){
$usuario=$_POST['usuario'];
    $estudiante=3;
    $consulta= "UPDATE usuario SET ustipo = '$estudiante' WHERE documento = $usuario";
    $resultado = mysqli_query($conexion,$consulta);
echo "<script> location='../Paginas-Admin/Aprovar-Estudiante.php'</script>";
}
mysqli_close($conexion);

?>