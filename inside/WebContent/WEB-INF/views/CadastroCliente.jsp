<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"></c:import>

<body>

  
  <!-- DESKTOP -->
<div class="invisible-xs invisible-xxs">
  <div id="wrapper" class="toggled">
 	<!-- Sidebar-->
	<c:import url="importViews/SidebarAdmin.jsp"></c:import>


        <div class="pdd-15-lg-t pdd-15-md-t">
          <div class="container-fluid">

            <div class="col-lg-11 col-md-11 ">
              
              <h6 class="text-gray pull-right text-bold"><a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
            </div>
          </div>
          <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
            
            <div class="container-fluid pdd-30-lg-b pdd-30-md-b">
     
              <h1 class="text-primary text-bold">Novo Cliente</h1>
              <div class="mat-card-kit ">
  
                <div class="row">
                  <div class="col-md-12 col-lg-12">
                  <a href="clientes" class='col-md-2 col-lg-2 col-sm-2 col-xs-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a> 
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                      <h2 class="text-gray text-bold">Cadastrar Novo Cliente</h2>
                    </div>
                  </div>
                </div>
                <div class="line-gray"></div>
                <div class="row row-card">
                  <div class="col-lg-12 col-md-12">                    
                      <form action="cadastrar_cliente" method="POST" class="form-inline">
                        <div class="row">
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="nome" class="text-gray">Cliente</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="nome" id="nome" class="form-control" required>
                              
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="cnpj" class="text-gray">CNPJ</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="cnpj" id="cnpj" class="form-control" required>
                            </div>
                          </div>                                               
                        </div>
                        <div class="row">
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="representante" class="text-gray">Representante</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="representante" id="representante" class="form-control" required>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="email" class="text-gray">E-mail</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="email" id="email" class="form-control" required>
                            </div>
                          </div>                                               
                        </div>
                        <div class="row">
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="telefone" class="text-gray">Telefone</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="telefone" id="telefone" class="form-control" required>
                            </div>
                          </div>  
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="endereco" class="text-gray">Endere�o</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="endereco" id="endereco" class="form-control" required>
                            </div>
                          </div>                                              
                        </div>
                        <div class="row" >
                          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4 pdd-50-lg-t pdd-50-md-t pdd-30-lg-b pdd-30-md-b">
                            <button id="success-create" type="submit" name="acao" class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Cadastrar</button>
                          </div>                     
                        </div>                         
                      </form>
                  </div>
                </div>
              </div>
          </div>
        </div>

        </div>
  </div>
</div>

<!-- MOBILE -->
<div class="invisible-md invisible-lg invisible-xlg" style="overflow-x: hidden;">
    	<c:choose>
			<c:when test="${usuario.perfil.nome == 'Administrador'}">
				<c:import url="importViews/MenuAdminMobile.jsp"></c:import>
			</c:when>
			<c:when test="${usuario.perfil.nome == 'Analista'}">
				<c:import url="importViews/MenuAnalistaMobile.jsp"></c:import>
			</c:when>
		</c:choose>

    <div class="pdd-15-lg-t pdd-15-md-t">

      <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
    
        <div class="container-fluid pdd-30-lg-b pdd-30-md-b">
    
          <h2 class="text-primary text-bold">Novo Cliente</h2>
          <div class="mat-card-kit ">
    
            <div class="row">
              <div class="col-xs-12 col-xxs-12">
                <div class="">

                  <a href="clientes" class='col-md-2 col-lg-2 col-xxs-2 col-xs-2 pdd-15-xs-t pdd-15-xxs-t'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
                </div>
                <div class="col-xxs-7 col-xs-7 col-lg-offset-1 col-md-offset-1 col-xxs-offset-1 col-xs-offset-1">
                  <h3 class="text-gray text-bold">Cadastrar Novo Cliente</h3>
                </div>
              </div>
            </div>
            <div class="line-gray"></div>
            <div class="row row-card">
              <div class="col-xs-12 col-xxs-12">
                <form action="cadastrar_cliente" method="POST" class="form-inline">
                  <div class="row">
                    <div class="col-xs-12 col-xxs-12 pdd-15-xs-t pdd-15-xxs-t pdd-15-xs-b pdd-15-xxs-b">
                      <div class="col-xs-12 col-xxs-12">
                        <h5 class="text-gray">Cliente</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="cliente" class="form-control" required>
                      </div>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-lg-3 col-md-3">
                        <h5 class="text-gray">CNPJ</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="cnpj" class="form-control" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-lg-3 col-md-3">
                        <h5 class="text-gray">Representante</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="representante" class="form-control" required>
                      </div> 
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-lg-3 col-md-3">
                        <h5 class="text-gray">E-mail</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="email" name="E-mail" class="form-control" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-xs-12 col-xxs-12">
                        <h5 class="text-gray">Telefone</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="telefone" class="form-control" required>
                      </div>
                    </div>
                     <div class="col-xs-12 col-xxs-12">
                      <div class="col-xs-12 col-xxs-12">
                        <h5 class="text-gray">Endere�o</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="endereco" class="form-control" required>
                      </div>
                    </div>
                  </div>
                  <div class="row row-card">
                    <div class="col-xs-12 col-xxs-12  pdd-30-xs-t pdd-30-xxs-t pdd-30-xxs-b pdd-30-xs-b">
                      <button id="success-create" type="submit" name="acao" class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Cadastrar</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

</div>





  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="javascripts/bootstrap.min.js"></script>
  <script src="js/menu-mobile.js"></script>
  <script src="js/jquery-1.2.6.pack.js" type="text/javascript"></script>
  <script src="js/jquery.maskedinput-1.1.4.pack.js" type="text/javascript" /></script>
  <script>
    
    $(document).ready(function(){	
		$("#cnpj").mask("99.999.999/9999-99");
		$("#telefone").mask("(99) 99999-9999");
	});
    
     /* value="criar" */
  </script>


  

  <!-- Menu Toggle Script -->

</body>
</html>
