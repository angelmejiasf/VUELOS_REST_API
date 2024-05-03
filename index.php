<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
  
        

// Actualizar PUT
     /*   if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
            $post = json_decode(file_get_contents('php://input'), true);
            $res = $pasajeModel->actualizarPasaje($post);
            echo json_encode($res);
            exit();
        }*/

// Borrar DELETE
       /* if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
            if (isset($_GET['idpasaje'])) {
                $id = $_GET['idpasaje'];
                $res = $pasajeModel->borrarPasaje($id);
                echo json_encode($res);
                exit();
            } else {
                // Si no se proporciona el idpasaje, devolver un error
                header("HTTP/1.1 400 Bad Request");
                exit();
            }
        }*/


        ?>
    </body>
</html>
