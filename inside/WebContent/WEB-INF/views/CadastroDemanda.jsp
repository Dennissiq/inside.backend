<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>

<!-- DESKTOP -->
<div class="invisible-xs invisible-xxs ">
    <div id="wrapper" class="toggled">
	
	<c:import url="importViews/SidebarAdmin.jsp"></c:import>

      <div class="pdd-15-lg-t pdd-15-md-t">
        <div class="container-fluid">
          <div class="col-lg-11 col-md-11 ">
            <h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
          </div>
        </div>

        <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">

          <div class="container-fluid pdd-30-lg-b pdd-30-md-b">

            <h1 class="text-primary text-bold">Nova demanda</h1>
            <div class="mat-card-kit ">
              <form action="addDemanda" method="post">
              <input type="hidden" name='projeto.id' value="${idProjeto}" class="form-control text-primary">
              <div class="row">
                <div class="col-md-12 col-lg-12 col-xs-12 col-xxs-12">
                  <div class="container">     
                    <a href="projetos" class='col-md-2 col-lg-2 col-xs-2 col-xxs-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>             
                    <h2 class="col-md-10 col-lg-10 text-gray text-bold">Cadastrar nova demanda</h2>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-danger text-bold text-center">${error}</h5>
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Descrição</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <input type="text" name='descricao' required class="form-control text-dark">
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1 ">
                  <h5 class="text-gray">Detalhes</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <textarea type="text" name='detalhes' required class="form-control text-dark"></textarea>
                </div>
              </div>       
                          
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Inicio</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                	<input data-date-format="dd/mm/yyyy" name='dtInicio' id="datepicker1" class="form-control text-primary">                  
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Fim</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                	<input data-date-format="dd/mm/yyyy" name='dtFim' id="datepicker2" class="form-control text-primary">                  
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Status</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <select class="form-control text-dark" name='status'>
                  	<option value="aberto" selected>Aberto</option>
                  </select>
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Analista Responsável</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <select class="form-control text-dark" name='funcionario.idFuncionario'>
                  	<c:forEach var="analista" items="${analistas}">
                  		<option value="${analista.idFuncionario}">${analista.nome}</option>
                  	</c:forEach>                  	                  
                  </select>
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
    	<c:choose>
			<c:when test="${usuario.perfil.nome == 'Administrador'}">
				<c:import url="importViews/MenuAdminMobile.jsp"></c:import>
			</c:when>
			<c:when test="${usuario.perfil.nome == 'Analista'}">
				<c:import url="importViews/MenuAnalistaMobile.jsp"></c:import>
			</c:when>
		</c:choose>
    <div class="container pdd-30-xs-b pdd-30-xxs-b">
    
      <div class="row">
        <div class=" ">
    
          <div class="col-xs-12 col-xxs-12  ">
    
            <div class="container pdd-30-xxs-b pdd-30-xs-b">
    
              <h3 class="text-primary text-bold">Nova demanda</h3>
            <div class="mat-card-kit ">
              <form action="addDemanda" method="post">
              <input type="hidden" name='projeto.id' value="${idProjeto}" class="form-control text-primary">
              <div class="row">
                <div class="col-md-12 col-lg-12 col-xs-12 col-xxs-12 pdd-15-xs-t pdd-15-xxs-t pdd-15-xs-b pdd-15-xxs-b">
                  <div class="container">     
                    <a href="projetos" class='col-md-2 col-lg-2 col-xs-2 col-xxs-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>             
                    <h4 class="col-md-10 col-lg-10 col-xs-10 col-xxs-10 pdd-15-xs-t pdd-15-xxs-t text-gray text-bold">Cadastrar nova demanda</h4>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t ">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Descrição</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <input type="text" name='descricao' required class="form-control text-dark">
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1 ">
                  <h5 class="text-gray">Detalhes</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <textarea type="text" name='detalhes' required class="form-control text-dark"></textarea>
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Duração</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <input type="text" name='duracao' required class="form-control text-dark">
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Status</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <select class="form-control text-dark" name='status'>
                  	<option value="aberto" selected>Aberto</option>
                  	<option value="em andamento">Em andamento</option>
                  	<option value="finalizado">Finalizado</option>
                  </select>
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t pdd-30-xs-t pdd-30-xxs-t">              
                <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Analista Responsável</h5>
                </div>
                <div class="col-md-7 col-lg-7">
                  <select class="form-control text-dark" name='funcionario.idFuncionario'>
                  	<c:forEach var="analista" items="${analistas}">
                  		<option value="${analista.idFuncionario}">${analista.nome}</option>
                  	</c:forEach>                  	                  
                  </select>
                </div>
              </div>
              <div class="row row-card pdd-30-md-t pdd-30-lg-t pdd-30-xs-t pdd-30-xxs-t">              
               <!--  <div class="col-md-3 col-lg-3 col-lg-offset-1 col-md-offset-1">
                  <h5 class="text-gray">Anexos</h5>
                </div> -->
             <!--    <div class="col-md-7 col-lg-7 text-primary">
                  <a href="#" class='util-link'>
                    <i class='fa fa-upload fa-1x'></i> Carregar anexo
                  </a>
                </div> -->
              </div>
              <div class="row row-card pdd-100-md-t pdd-100-lg-t pdd-30-md-b pdd-30-lg-b pdd-15-xs-t pdd-15-xxs-t pdd-15-xs-b pdd-15-xxs-b">              
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
</div>
  

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>	
  <script src="js/daterangepicker.js"></script>
  <script>
  $(function() {
	  $('input[name="dtInicio"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true
	  });
	  
	  $('input[name="dtFim"]').daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true
	  });
	  
	 /* $('#datepicker1').datepicker({
	      weekStart: 1,
	      daysOfWeekHighlighted: "6,0",
	      autoclose: true,
	      todayHighlight: true,
	  });
	  $('#datepicker1').datepicker("setDate", new Date());
	  
	  $('#datepicker2').datepicker({
	      weekStart: 1,
	      daysOfWeekHighlighted: "6,0",
	      autoclose: true,
	      todayHighlight: true,
	  });
	  $('#datepicker2').datepicker("setDate", new Date());*/
    });
  </script>
  <script src="js/menu-mobile.js"></script>
  <!-- Menu Toggle Script -->
</body>
</html>