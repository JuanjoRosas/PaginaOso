<?php
session_start(); 
include ("../Modelo/Conexion/conexion.php");
if(isset($_POST["login"])){
$nit=$_POST["nit"];
$contraseña=$_POST["contraseña"];
$radio=$_POST['optionsRadios'];

if($nit!="" && $contraseña!=""){
    if($radio=="option2"){
      $verAdmin="SELECT * FROM usuario WHERE documento='$nit' AND contraseña='$contraseña' ";
      $resultado = mysqli_query($conexion,$verAdmin);
      $filaU=mysqli_fetch_array($resultado);
      if($filaU['ustipo']==1){//admin
             $_SESSION['active']= true;
            $_SESSION['nombreAdmin']=$nit;
            $_SESSION['claveAdmin']=$contraseña;
            $_SESSION['UserType']="Admin";
            $_SESSION['adminID']=$filaU['documento'];
            echo "<script>alert('Se ha logueado');window.location='../Paginas-Admin/index-Admin.php'</script>";
            
        }else{
            echo "<script>alert('Usuario o contraseña incorrectos');window.location='../Paginas/IniciarSesion.php'</script>";
        }
    }
    if($radio=="option1"){
        $verUser="SELECT * FROM usuario WHERE documento='$nit' AND contraseña='$contraseña' ";
        $resultado = mysqli_query($conexion,$verUser);
        
        $filaU=mysqli_fetch_array($resultado);
        if($filaU['ustipo']==2){//admin
            $_SESSION['active']= true;
            $_SESSION['nombreUser']=$nit;
            $_SESSION['claveUser']=$contraseña;
            $_SESSION['UserType']="User";
            $_SESSION['UserNIT']=$filaU['documento'];
            echo "<script>alert('Se ha logueado');window.location='../index.php'</script>";
        }else{
            echo "<script>alert('Usuario o contraseña incorrectos');window.location='../Paginas/IniciarSesion.php'</script>";
        }
    }

}else{
    echo 'Error campo vacío<br>Intente nuevamente';
}
}
?>