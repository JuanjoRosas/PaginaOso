<?php
session_start();
include ("../Modelo/Conexion/conexion.php");
if(isset($_POST["curso"])){
            $codigo=$_POST["codigo"];
            $usuario=$_SESSION['nombreEstudent'];
            $comprobante=$_FILES['comprobante']['name'];
            $comprobante_tmp=$_FILES['comprobante']['tmp_name'];
            $route_comprobante="../img/Documentos/".$comprobante;
            $curso=11500901;
            move_uploaded_file($comprobante_tmp,$route_comprobante);

            $consulta = "INSERT INTO estudiante(codigo,comprobante,idusuario,idcurso)
            VALUES('$codigo',' $comprobante','$usuario','$curso')";
            $resultado=mysqli_query($conexion,$consulta);
            $filaU=mysqli_fetch_array($resultado);
            if($filaU['idcurso']==$curso){//cisco
                  $_SESSION['active']= true;
                  $_SESSION['Cisco']=$codigo;
                  $_SESSION['UserType']="Estudent-curso";
                  $_SESSION['CursoID']=$filaU['idcurso'];
                  echo "<script>alert('Se ha registro');window.location='../index.php'</script>";
                  
              }else{
                  echo "<script>alert('Registro a curso erroneo');window.location='../Paginas/Confirmado-por-Admin/Registro-Curso-Cisco.php'</script>";
              }
            }
            else{
                echo "Error al subir archivo";
            }
            mysqli_close($conexion);
?>