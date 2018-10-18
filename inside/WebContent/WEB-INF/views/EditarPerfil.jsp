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
              
              <h6 class="text-gray pull-right text-bold"><a href="index.html"> <i class="fa fa-sign-out"></i> sair</a></h6>
            </div>
          </div>
          <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
            
            <div class="container-fluid pdd-30-lg-b pdd-30-md-b">
     
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="col-lg-4 col-md-4 col-lg-offset-4 col-md-offset-4">
                    <img src="images/perfil.jpg" class="img-responsive img-circle" alt="">
                    <div class="pdd-50-lg-b pdd-50-md-b"></div>
                    <button type="button" class=" btn btn-sm btn-primary text-white btn-block">Alterar Foto</button>
                    <div class="pdd-50-lg-b pdd-50-md-b"></div>
                  </div>                  
                </div>
              </div> 
              <div class="mat-card-kit ">
  
                <div class="row">
                  <div class="col-md-12 col-lg-12">
                  <a href="listar_analistas" class='col-md-2 col-lg-2 col-sm-2 col-xs-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a> 
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                      <h2 class="text-gray text-bold">Editar Perfil</h2>
                    </div>
                  </div>
                </div>
                <div class="line-gray"></div>
                <div class="row row-card">
                  <div class="col-lg-12 col-md-12">                    
                      <form action="cadastrar_analista" method="POST" class="form-inline">
                        <div class="row">
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="nome" class="text-gray">Nome</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="nome" id="nome" class="form-control"  readonly="readonly" value="${funcionario.nome }">
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="localizacao" class="text-gray">Local</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="localizacao" id="localizacao" class="form-control"  readonly="readonly " value="${funcionario.localizacao }">
                            </div>
                          </div>                                               
                        </div>
                        <div class="row">
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="cpf" class="text-gray">CPF</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="cpf" id="cpf" class="form-control"  readonly="readonly" value="${funcionario.cpf }">
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="email" class="text-gray">E-mail</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="email" id="email" class="form-control"  value="${funcionario.email }">
                            </div>
                          </div>                                               
                        </div>
                        <div class="row">
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
                            <div class="col-lg-3 col-md-3">
                              <h5 for="especialidade" class="text-gray">Especialidade</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="especialidade" id="especialidade" class="form-control"  readonly="readonly" value="${funcionario.especialidade }">
                            </div>
                          </div>  
                          <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-b">
                            <div class="col-lg-3 col-md-3">
                              <h5 class="text-gray">Senha</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="senha"  id="senha" class="form-control">
                            </div>
                          </div>                                             
                        </div>
                        <div class="row" >
                          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4 pdd-50-lg-t pdd-50-md-t pdd-30-lg-b pdd-30-md-b">
                            <button id="success-criar" type="submit" name="acao" class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Alterar Dados</button>
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
    <div class="row">
      <div class="col-xs-offset-1 col-xxs-offset-1 col-xs-11 col-xxs-offset-11 container-fluid">
        <h3 id="menu-toggle">Menu</h3>
        <ul id="mainMenu">
          <li><a href="projetos.html" style="color: #848484 !important;"><h4>Projetos</h4> </a>
          </li>
          <li><a href="cadastroProjeto.html" style="color: #848484 !important;"> <h4>Cadastrar novo projeto</h4></a></li>
          <li><a href="analistas.html" style="color: #848484 !important;"> <h4>Analistas</h4></a></li>
          <li><a href="desempenhoAdmin.html" style="color: #848484 !important;"> <h4>Desempenho</h4></a></li>
          <li><a href="index.html" style="color: #848484 !important;"> <h4>Sair</h4></a></li>
        </ul>
      </div>
    </div>

    <div class="pdd-15-lg-t pdd-15-md-t">

      <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
    
        <div class="container-fluid pdd-30-lg-b pdd-30-md-b">
    
          <div class="row">
                <div class="col-xs-12 col-xxs-12">
                  <div class="col-xs-6 col-xxs-6 col-xs-offset-3 col-xxs-offset-3">
                    <img src="images/perfil.jpg" class="img-responsive img-circle" alt="">
                    <div class="pdd-50-xs-b pdd-50-xxs-b"></div>
                    <button type="button" class=" btn btn-sm btn-primary text-white btn-block">Alterar Foto</button>
                    <div class="pdd-50-xs-b pdd-50-xxs-b"></div>
                  </div>                  
                </div>
            </div>
          <div class="mat-card-kit ">
    
            <div class="row">
              <div class="col-xs-12 col-xxs-12">
                <div class="">

                  <a href="analistas.html" class='col-md-2 col-lg-2 col-xxs-2 col-xs-2 pdd-15-xs-t pdd-15-xxs-t'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
                </div>
                <div class="col-xxs-7 col-xs-7 col-lg-offset-1 col-md-offset-1 col-xxs-offset-1 col-xs-offset-1">
                  <h3 class="text-gray text-bold">Cadastrar Novo Analista</h3>
                </div>
              </div>
            </div>
            <div class="line-gray"></div>
            <div class="row row-card">
              <div class="col-xs-12 col-xxs-12">
                <form action="#" class="form-inline">
                  <div class="row">
                    <div class="col-xs-12 col-xxs-12 pdd-15-xs-t pdd-15-xxs-t pdd-15-xs-b pdd-15-xxs-b">
                      <div class="col-xs-12 col-xxs-12">
                        <h5 class="text-gray">Nome</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="Nome_Analista" class="form-control"  readonly="readonly" value="${funcionario.nome }">
                      </div>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-lg-3 col-md-3">
                        <h5 class="text-gray">Local</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="Endereco" class="form-control"  readonly="readonly" value="${funcionario.localizacao }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-lg-3 col-md-3">
                        <h5 class="text-gray">CPF</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="CPF" class="form-control"  readonly="readonly" value="${funcionario.cpf }">
                      </div> 
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-lg-3 col-md-3">
                        <h5 class="text-gray">E-mail</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="E-mail" class="form-control"  readonly="readonly" value="${funcionario.email }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-xs-12 col-xxs-12">
                        <h5 class="text-gray">Especialidade</h5>
                      </div>
                      <div class="col-xs-12 col-xxs-12">
                        <input type="text" name="Especialidade" class="form-control"  readonly="readonly" value="${funcionario.especialidade }">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-b">
                            <div class="col-lg-3 col-md-3">
                              <h5 class="text-gray">Senha</h5>
                            </div>
                            <div class="col-lg-9 col-md-9">
                              <input type="text" name="senha" class="form-control" value="${funcionario.especialidade }">
                            </div>
                     </div> 
                  </div>
                  
                  <div class="row row-card">
                    <div class="col-xs-12 col-xxs-12  pdd-30-xs-t pdd-30-xxs-t pdd-30-xxs-b pdd-30-xs-b">
                      <button type="button" class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Alterar Dados</button>
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

  <script>
    function swalSucess() {
        swal({
          title: "Dados alterados com sucesso!",
          icon: "success",
          button: "OK",
        });
        document.getElementById("success-criar")[0].setAttribute("value", "criar");
      }
    
     /* value="criar" */
  </script>


  

  <!-- Menu Toggle Script -->

</body>
</html>
