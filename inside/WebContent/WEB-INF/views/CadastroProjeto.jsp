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
              
              <h6 class="text-gray pull-right text-bold"><a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
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
                          <h5 class="text-gray">Cliente</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <select class="form-control text-dark" name='cliente.id'>
		                  	<c:forEach var="cliente" items="${clientes}">
		                  		<option value="${cliente.id}">${cliente.nome}</option>
		                  	</c:forEach>                  	                  
		                  </select>
                        </div>
                      </div>
                      <div class="col-xxs-6 col-xs-6 pdd-30-xxs-t">
                        <div class="col-xxs-3 col-xs-3">
                          <h5 class="text-gray">Ramo</h5>
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
                        	<select class="form-control text-dark" name='status'>			                  	
			                  	<option value="aberto">Aberto</option>			                  	           
		                	</select>
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
	<c:import url="importViews/MenuAdminMobile.jsp"></c:import>

        <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
        
          <div class="container-fluid pdd-30-lg-b pdd-30-md-b">
        
            <h2 class="text-primary text-bold">Novo Projeto</h2>
            <div class="mat-card-kit pdd-30-xs-b pdd-30-xxs-b">
        
              <div class="row">
                <div class="col-md-12 col-lg-12">
                  <div class="col-lg-9 col-md-9 col-xs-12 col-lg-offset-3">
                    <h3 class="text-gray text-bold text-center">Cadastrar Novo Projeto</h3>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row pdd-30-xs-b pdd-30-xxs-b">
                <div class="col-xs-12 col-xxs-12 pdd-30-xs-b pdd-30-xxs-b">
                  <form method="post" action="addProjeto" class="form-inline ">
                    <div class="row row-card">
                      <div class="col-xxs-12 col-xs-12">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Nome do projeto</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="descricao" class="form-control"  required>
                        </div>
                      </div>
                      <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Detalhes</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                          <input type="text" name="detalhe" class="form-control" required>
                        </div>
                      </div>
                     <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Cliente</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                          <select class="form-control text-dark" name='cliente.id'>
		                  	<c:forEach var="cliente" items="${clientes}">
		                  		<option value="${cliente.id}">${cliente.nome}</option>
		                  	</c:forEach>                  	                  
		                  </select>
                        </div>
                      </div>
                      <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Atividade</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                          <input type="text" name="atividade" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Data de início</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                          <input type="text" name="dataInicio" class="form-control" required>
                        </div>
                      </div>
                      </div>
                      <div class="row row-card">
                      <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t ">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Data final</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="dataFim" class="form-control" required>
                        </div>
                      </div>
                      <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Horas</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12">
                          <input type="text" name="horas" class="form-control" required>
                        </div>
                      </div>
                       <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                        <div class="col-xxs-12 col-xs-12">
                          <h5 class="text-gray">Status</h5>
                        </div>
                        <div class="col-xxs-12 col-xs-12 pdd-15-xxs-t pdd-15-xs-t">
                          <input type="text" name="status" class="form-control" required>
                        </div>
                      </div>
                    </div>
                    <div class="row ">
                      <div class="col-xs-10 col-xs-offset-1 col-xxs-10 col-xxs-offset-1 pdd-30-xs-t pdd-30-xxs-t">                      
                        <button type="submit" class=" btn btn-lg btn-primary btn-block text-white botao-cadastrar">Cadastrar</button>
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
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>	
  <script src="js/daterangepicker.js"></script>
  <script>
  $(function() {
	  $('input[name="dataInicio"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
	    locale: 'pt-br'
	  });
	  
	  $('input[name="dataFim"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
	    locale: 'pt-br'
	  });
    });
  </script>
  <script src="js/menu-mobile.js"></script>
</body>
</html>