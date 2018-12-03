<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inside Co.</title>

    <!-- Bootstrap core CSS -->
	
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/v4-shims.css">

	<link href='fullcalendar/css/fullcalendar.min.css' rel='stylesheet' />
	<link href='fullcalendar/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />

	<link href='fullcalendar/css/calendar-config.css' rel='stylesheet' />
	
    <link href="css/styles.css" rel="stylesheet">
	<link href="css/custom.css" rel="stylesheet">
		
    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    
</head>
<body>
  <!-- Sidebar-->
  <div class="">
	<div id="wrapper" class="toggled">
		
		<c:choose>
			<c:when test="${usuario.perfil.nome == 'Analista'}">											
				<c:import url="importViews/SidebarAnalista.jsp"></c:import>
			</c:when>
			<c:when test="${usuario.perfil.nome == 'Administrador'}">
				<c:import url="importViews/SidebarAdmin.jsp"></c:import>
			</c:when>
		</c:choose>
		
		<div class="container-fluid">
			<div class="col-lg-11 col-md-11 ">				
				<h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
			</div>
		</div>
		<div class="calendario-container">            
	        <div class="container-fluid">
	        	<input type="hidden" name="perfil" id="perfil" value="${usuario.perfil.nome}">
				<c:if test="${projeto != null}">
					<input type="hidden" name="idProjeto" id="idProjeto" value="${projeto.id}">
				</c:if>
				<c:if test="${funcionario != ''}">
					<input type="hidden" name="idFuncionario" id="idFuncionario" value="${funcionario.idFuncionario}">
				</c:if>
				 <h2 class="text-primary text-bold" style="margin-top:-10px">Cronograma</h2>
				 <div class="mat-card-kit ">
				 	<div class="row">
               			<div id="calendar" class="col-md-12 col-lg-12"></div>
               		</div>					
				</div>
	        </div>
        </div>
	</div>
  </div>
	
	<script src='fullcalendar/lib/jquery.min.js'></script>	
	<script src='fullcalendar/lib/moment.min.js'></script>
	<script src='fullcalendar/js/theme-chooser.js'></script>
	<script src='fullcalendar/js/fullcalendar.min.js'></script>
	<script src='fullcalendar/js/pt-br.js'></script>
	
	<!-- <script src='fullcalendar/js/locale-all.js'></script> -->

 	<script src='fullcalendar/js/calendar-config.js'></script>	  
</body>
</html>