<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>

<!-- DESKTOP -->
<div class="invisible-xs invisible-xxs ">
    <div id="wrapper" class="toggled">
    <div id="sidebar-wrapper" class='invisible-xs invisible-xxs'>
      <ul class="sidebar-nav">
        <li class="sidebar-brand  pdd-15-md-t pdd-15-lg-t pdd-15-xlg-t pdd-30-md-b pdd-30-lg-b pdd-30-xlg-b">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-11 col-lg-11 col-lg-offset-1 col-md-offset-1 pdd-15-md-t pdd-15-lg-t">
                <div class="col-md-8 col-lg-8 col-lg-offset-2 col-md-offset-2 pdd-15-md-b pdd-15-lg-b">
                  <img src="./images/perfil.jpg" class="img-responsive img-circle" alt="">
                </div>
                <h4 class="text-white text-bold text-left">Fernando Pessoa</h4>
                <!-- <h5 class="text-white text-left ">Fullstack Developer</h5> -->
                <a href="#"><h6 class="text-white text-left"><i class='fa fa-edit'></i> Editar perfil</h6></a>
                <!-- <a href="#"><h6 class="text-white text-left"><i class='fa fa-sign-out-alt'></i> Sair</h6></a> -->
              </div>
            </div>
          </div>
        </li>
        <li class="pdd-10-md-t pdd-10-lg-t">
          <h6 class="text-primary">HOME</h6>
        </li>
        <div class="menu">
          <li class="pdd-30-md-t pdd-30-lg-t">
            <a href="projetos.html" class="text-white"><i class="fas fa-tasks text-white pdd-15-lg-r" aria-hidden="true" style="display:inline"></i> Projetos</a>
          </li>
          <li>
            <a href="novoProjeto" class="text-white"><i class="fas fa-clipboard-check text-white pdd-15-lg-r" aria-hidden="true"
                style="display:inline"></i> Cadastrar novo projeto</a>
          </li>
          <li>
            <a href="analistas" class="text-white"> <i class="fas fa-users text-white pdd-15-lg-r" aria-hidden="true"
                style="display:inline"></i> Analistas</a>
          </li>
          <li>
        </div>
      </ul>
      <div class="pdd-50-lg-t">
        <div class="pdd-500-lg-t">
          <div class="col-md-9 col-lg-9 col-lg-offset-1">
            <img class="img-responsive" src="./images/logo_2.png">
          </div>
        </div>
      </div>
    </div>

      <div class="pdd-15-lg-t pdd-15-md-t">
        <div class="container-fluid">
          <div class="col-lg-11 col-md-11 ">
            <h6 class="text-gray pull-right text-bold"> <a href="index.html"> <i class="fa fa-sign-out"></i> sair</a></h6>
          </div>
        </div>

        <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">

          <div class="container-fluid pdd-30-lg-b pdd-30-md-b">

            <h1 class="text-primary text-bold">Nova demanda</h1>
            <div class="mat-card-kit ">
              <form action="addDemanda" method="post">
              <input type="hidden" name='projeto.id' value="${idProjeto}" class="form-control text-primary">
              <div class="row">
                <div class="col-md-12 col-lg-12">
                  <div class="container">     
                    <a href="projetos" class='col-md-2 col-lg-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>             
                    <h2 class="col-md-10 col-lg-10 text-gray text-bold">Cadastrar nova demanda</h2>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Descrição</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <input type="text" name='descricao' required class="form-control text-primary">
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Detalhes</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <textarea type="text" name='detalhes' required class="form-control text-primary"></textarea>
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Duração</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <input type="text" name='duracao' required class="form-control text-primary">
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
               <!--  <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Anexos</h5>
                </div> -->
             <!--    <div class="col-md-7 col-lg-7 text-primary">
                  <a href="#" class='util-link'>
                    <i class='fa fa-upload fa-1x'></i> Carregar anexo
                  </a>
                </div> -->
              </div>
              <div class="row row-card pdd-100-md-t pdd-100-lg-t pdd-30-md-b pdd-30-lg-b">              
                <div class="col-lg-offset-4 col-md-offset-4 col-md-4 col-lg-4 text-primary">
                	<button type="submit" class=" btn btn-lg btn-primary text-white btn-block">Cadastrar demanda</button>
                </div>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
  </div>
</div>


<!-- MOBILE -->
<div class="invisible-md invisible-xlg invisible-lg" style="overflow-x: hidden;">
    <div class="row ">
      <div class="col-xs-offset-1 col-xxs-offset-1 col-xs-11 col-xxs-offset-11 container-fluid">
        <h3 id="menu-toggle">Menu</h3>
        <ul id="menu">
          <li><a href="projetos.html" style="color: #848484 !important;"><h4>Projetos</h4> </a>
          </li>
          <li><a href="cadastroProjeto.html" style="color: #848484 !important;"> <h4>Cadastrar novo projeto</h4></a></li>
          <li><a href="analistas.html" style="color: #848484 !important;"> <h4>Analistas</h4></a></li>
          <li><a href="desempenhoAdmin.html" style="color: #848484 !important;"> <h4>Desempenho</h4></a></li>
          <li><a href="index.html" style="color: #848484 !important;"> <h4>Sair</h4></a></li>
        </ul>
      </div>
    </div>

    <div class="container pdd-30-xs-b pdd-30-xxs-b">
    
      <div class="row">
        <div class=" ">
    
          <div class="col-xs-12 col-xxs-12  ">
    
            <div class="container pdd-30-xxs-b pdd-30-xs-b">
    
              <h3 class="text-primary text-bold">Nova demanda</h3>
              <div class="mat-card-kit ">
                <div class="row">
                  <div class="col-md-12 col-lg-12">
                    <div class="container pdd-20-xs-t pdd-20-xxs-t pdd-15-xs-b pdd-15-xxs-b">
                      <a href="projetos.html" class='col-xs-2 col-xxs-2 '><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
                      <h4 class="col-xs-9 col-xxs-9 col-xs-offset-1 col-xxs-offset-1 text-gray text-bold pdd-10-xs-t pdd-10-xxs-t">Cadastrar Nova Demanda</h4>
                    </div>
                  </div>
                </div>
                <div class="line-gray"></div>
                  <div class="row row-card pdd-30-md-t pdd-30-lg-t">
                    <div class="col-xs-12 col-xxs-12">
                      <h5 class="text-gray">Nome</h5>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <input type="integer" class="form-control text-primary">
                    </div>
                  </div>
                  <div class="row row-card pdd-30-xs-t pdd-30-xxs-t">
                    <div class="col-xs-12 col-xxs-12">
                      <h5 class="text-gray">Descrição</h5>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <textarea type="integer" class="form-control text-primary"></textarea>
                    </div>
                  </div>
                  <div class="row row-card pdd-30-xs-t pdd-30-xxs-t">
                    <div class="col-xs-4 col-xxs-4">
                      <h5 class="text-gray">Anexos</h5>
                    </div>
                    <div class="col-xs-8 col-xxs-8 text-primary pdd-10-xs-t pdd-10-xxs-t">
                      <a href="#" class='util-link'>
                        <i class='fa fa-upload fa-1x'></i> Carregar anexo
                      </a>
                    </div>
                  </div>
                  <div class="row row-card pdd-30-xs-t pdd-30-xxs-t pdd-30-xs-b pdd-30-xxs-b">
                  
                    <div class="col-xxs-12 col-xs-12 text-primary">
                      <button type="button" class=" btn btn-lg btn-primary text-white btn-block">Cadastrar demanda</button>
                    </div>
                  </div>
              </div>
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


  <!-- Menu Toggle Script -->
</body>
</html>