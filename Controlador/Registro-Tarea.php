<?php
session_start();
include ("../Modelo/Conexion/conexion.php");
if(isset($_POST["subir"])){
            $codigo=$_POST["codigo"];
            $titulo=$_POST["titulo"];
            $descripcion=$_POST['descripcion'];
            $tarea=$_FILES['tarea']['name'];

            $tarea_tmp=$_FILES['tarea']['tmp_name'];
            $route_tarea="../img/Tareas/".$tarea;
            move_uploaded_file($tarea_tmp,$route_tarea);

            $consulta = "INSERT INTO tarea(id,titulo,descripcion,archivo)
            VALUES('$codigo','$titulo','$descripcion','$tarea')";
            $resultado = mysqli_query($conexion,$consulta);
            if($resultado){
                echo "<script>alert('se ha enviado informe');window.location='../Paginas-Admin/Tareas.php'</script>";

            } else {
               printf("Errormessage: %s\n", mysqli_error($conexion));
            }
            }
            else{
                echo "Error al subir archivo";
            }
            mysqli_close($conexion);
?>