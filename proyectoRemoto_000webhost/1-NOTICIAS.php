<?php include("db.php"); ?>
<?php include('includes/header.php'); ?>
<script src = 'validacion/formNoticias.js'></script>


<br>
<h1 class="text-center">LISTA DE NOTICIAS</h1>
<br>



<main class="container p-4">
  <div class="row">
    <div class="col-md-4">

  


      <!-- MENSAJE DE GUARDADO-->
      <?php if (isset($_SESSION['message'])) { ?>
      <div class="alert alert-<?= $_SESSION['message_type']?> alert-dismissible fade show" role="alert">
        <?= $_SESSION['message']?>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <?php session_unset(); } ?>




      <!-- INSERSION DE NUEVO NOTICIA -->
      <div class="card card-body">

      
      <h5 class="text-center">Formulario de administracion</h5>
      <h6 class="text-center">----------------------------------------------------</h6><br>

        <form name="form1" action="insertar_noticia.php" method="POST" onsubmit="return validar()">


          <div class="form-group">
            <input type="text" name="titulo_noticia" class="form-control" placeholder="Titulo: " autofocus>
            <label id="error" style="color:red"></label>
          </div>

          <div class="form-group">
            <textarea name="contenido_noticia" rows="2" class="form-control" placeholder="Contenido: " hein="150"></textarea>
            <label id="error2" style="color:red"></label>
          </div>

          <input type="submit" name="grabar_tb_noticias" onclick="borrar_titulo(); borrar_descripcion();"  class="btn btn-success btn-block" value="REGISTRAR NOTICIA">

        </form>
      </div>
    </div>












    <div class="col-md-8">
    <table class="table table-hover table-bordered">
        <thead thead class="thead-dark text-center ">
          <tr>
              <th>ID</th>
							<th>TITULO</th>
						  <th>CONTENIDO</th>
              <th>ACCIÓN</th>

          </tr>
        </thead>


        <tbody>

          <?php
          $query = "SELECT * FROM tb_noticias";
          $resultado_insert = mysqli_query($conexion, $query);    
          while($row = mysqli_fetch_assoc($resultado_insert)) { ?>

          <tr>
            <td><?php echo $row['idnoticia']; ?></td>
            <td><?php echo $row['titulo_noticia']; ?></td>
            <td><?php echo $row['contenido_noticia']; ?></td>


            <td>

              <a href="editar_noticia.php?idnoticia=<?php echo $row['idnoticia']?>" class="btn btn-secondary">
                <i class="fas fa-marker"></i>
              </a>

              <a href="eliminar_noticia.php?idnoticia=<?php echo $row['idnoticia']?>"  class="btn btn-danger">
                <i class="far fa-trash-alt"></i>
              </a>


            </td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</main>

<?php include('includes/footer.php'); ?>
