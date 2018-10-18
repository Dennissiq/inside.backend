<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>

  <!-- DESKTOP -->
  <!-- Sidebar-->
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
     
              <h1 class="text-primary text-bold">Novo Projeto</h1>
              <div class="mat-card-kit ">
  
                <div class="row">
                  <div class="col-md-12 col-lg-12">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 col-lg-offset-3 col-md-offset-3 col-sm-offset-2 col-xs-offset-1">
                      <h2 class="text-gray text-bold">Cadastrar novo projeto</h2>
                    </div>
                  </div>
                </div>
                <div class="line-gray"></div>
                <div class="row">
                  <div class="col-lg-12 col-md-12">                    
                  <form method="post" action="addProjeto" class="form-inline">
                    <div class="row row-card">
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t pdd-30-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Nome do projeto</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="descricao" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t pdd-30-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Detalhes</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="detalhe" class="form-control" required>
                        </div>
                      </div>
                      </div>
                      <div class="row row-card">
                     <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">CNPJ do Cliente</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="cliente.nome" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t">
                        <div class="col-xxs-3 col-xs-3">
                          <h5 class="text-gray">Atividade</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="atividade" class="form-control" required>
                        </div>
                      </div>
                      </div>
                      <div class="row row-card">
                      <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Data de início</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="dataInicio" class="form-control" required>
                        </div>
                      </div>
                     
                      
                      <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Data final</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="dataFim" class="form-control" required>
                        </div>
                      </div>
                      </div>
                      <div class="row row-card">
                      <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Horas</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="horas" class="form-control" required>
                        </div>
                      </div>
                       <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Status</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="status" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4 pdd-50-lg-t pdd-50-md-t pdd-30-lg-b pdd-30-md-b">                      
                        <button type="submit" class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Cadastrar</button>
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

        <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
        
          <div class="container-fluid pdd-30-lg-b pdd-30-md-b">
        
            <h2 class="text-primary text-bold">Novo Projeto</h2>
            <div class="mat-card-kit ">
        
              <div class="row">
                <div class="col-md-12 col-lg-12">
                  <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 col-lg-offset-3">
                    <h3 class="text-gray text-bold text-center">Cadastrar Novo Projeto</h3>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row">
                <div class="col-xs-12 col-xxs-12">
                  <form method="post" action="addProjeto" class="form-inline">
                    <div class="row row-card">
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t pdd-30-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Nome do projeto</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="descricao" class="form-control">
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t pdd-30-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Detalhes</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="detalhe" class="form-control">
                        </div>
                      </div>
                     <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">CNPJ do Cliente</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="cliente.nome" class="form-control">
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t">
                        <div class="col-xxs-3 col-xs-3">
                          <h5 class="text-gray">Atividade</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="atividade" class="form-control">
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Data de início</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="dataInicio" class="form-control">
                        </div>
                      </div>
                      </div>
                      <div class="row row-card">
                      <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Data final</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="dataFim" class="form-control">
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Horas</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="horas" class="form-control">
                        </div>
                      </div>
                       <div class="col-xxs-12 col-xs-12 ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Status</h5>
                        </div>
                        <div class="col-xxs-6 col-xs-6">
                          <input type="text" name="status" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4 pdd-50-lg-t pdd-50-md-t pdd-30-lg-b pdd-30-md-b">                      
                        <button type="submit" class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Cadastrar</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="javascripts/bootstrap.min.js"></script>
  <script src="js/menu-mobile.js"></script>
</body>
</html>