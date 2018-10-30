<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>
	<!-- MODAL -->
		<div class="modal fade" id="editar" tabindex="-1" role="dialog" aria-labelledby="editarTitle" aria-hidden="true" style="overflow-x: hidden;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title text-gray text-bold" id="editarTitle">Detalhes do Cliente</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="line-gray"></div>
					<div class="row">
						<div id="detalhe" class="col-md-7 col-lg-7 pdd-15-lg-b pdd-30-lg-t pdd-30-md-t pdd-15-md-b pdd-15-xxs-b pdd-30-xxs-t pdd-30-xs-t pdd-15-xs-b">
							<div class="col-md-12 col-lg-12 ">
								<h4 class="text-gray ">Cliente: ${cliente.nome} </h4>								
							</div>
							<div class="col-md-12 col-lg-12">
								<h5>CNPJ: ${cliente.cnpj}</h5>
								<h5>Representante: ${cliente.representante}</h5>
								<h5>E-mail: ${cliente.email} </h5>
								<h5>Telefone: ${cliente.telefone} </h5>
								<h5>Endereço: ${cliente.endereco} </h5>			
							</div>
						</div>
					</div>
		
					<div class="modal-body ">
						<div class="container-fluid table-card">
							
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- DESKTOP -->
		<!-- Sidebar-->

  <div class="invisible-xs invisible-xxs">
	<div id="wrapper" class="toggled">
		
		<c:import url="importViews/SidebarAdmin.jsp"/>

			<div class="container-fluid">	
				<div class="col-lg-11 col-md-11 ">
					<h6 class="text-gray pull-right text-bold"> <a href="index.html"> <i class="fa fa-sign-out"></i> sair</a></h6>
				</div>
			</div>
	
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
	
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">

					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h1 class="text-primary text-bold text-bold">Clientes</h1>
						
						<div class="mat-card-kit">
							<div class="row">
								<div class="col-md-6 col-lg-6 col-lg-offset-3 col-md-offset-3" >
									<h2 class=" text-center text-gray text-bold  pdd-15-md-b">Lista de Clientes</h2>
									
							</div>
							<div class="col-md-2 col-lg-2 col-lg-offset-1 pdd-15-lg-t pdd-15-lg-b col-md-offset-1 pdd-15-md-t pdd-15-md-b" >
							 	<a href="novo_cliente" class='text-primary pdd-15-md-b '>
									<i class="fas fa-user-plus fa-2x text-primary text-center" ></i>
								</a>
							</div>
							</div>					
							<div class="line-gray"></div>	
							
							<div class="container-fluid table-card pdd-30-md-t pdd-30-lg-t pdd-30-xlg-t">
								<div id="list">
									<table class="table table-hover table-card">
										<thead>
											<tr>
												<th class="legenda text-gray">Cliente</th>
												<th class="legenda text-gray">Representante</th>
												<th class="legenda text-gray">E-mail</th>
												<th class="legenda text-gray">Telefone</th>
												<th class="legenda text-gray"></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty lista}">
												<c:forEach var="cliente" items="${lista}">
												<tr>
													<td class="text-bold">${cliente.nome}</td>
													<td class="text-bold">${cliente.representante}</td>
													<td class="text-bold">${cliente.email}</td>
													<td class="text-bold">${cliente.telefone}</td>
													<td><a href="detalheCliente?id=${cliente.id}" class="text-primary pdd-15-md-b"> <!--data-toggle="modal" data-target="#editar"-->
													<i class="fas fa-edit text-gray" aria-hidden="true"></i></a> </td>
												</tr>
												</c:forEach>
											</c:if>			
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- MOBILE -->
<div class="invisible-md invisible-lg invisible-xlg">
	<div class="row">
		<div class="col-xs-offset-1 col-xxs-offset-1 col-xs-11 col-xxs-offset-11 container-fluid">
			<h3 id="menu-toggle">Menu</h3>
			<ul id="mainMenu">
				<li><a href="projetos.html" style="color: #848484 !important;"><h4>Projetos</h4> </a>
				</li>
				<li><a href="cadastroProjeto.html" style="color: #848484 !important;"> <h4>Cadastrar novo projeto</h4></a></li>
				<li><a href="analistas.html" style="color: #848484 !important;"> <h4>Analistas</h4></a></li>
				<li><a href="clientes.html" style="color: #848484 !important;"> <h4>Clientes</h4></a></li>
				<li><a href="desempenhoAdmin.html" style="color: #848484 !important;"> <h4>Desempenho</h4></a></li>
				<li><a href="index.html" style="color: #848484 !important;"> <h4>Sair</h4></a></li>
			</ul>
		</div>
	</div>
	<div class="row">
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
			
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">
			
					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h2 class="text-primary text-bold text-bold">Clientes</h2>
			
						<div class="mat-card-kit">
							<div class="row">
								<div class="col-xs-9 col-xxs-9">
									<h3 class=" text-center text-gray text-bold  pdd-15-md-b pdd-10-xxs-t pdd-10-xs-t">Lista de CLientes</h3>
			
								</div>
								<div class="col-xs-2 col-xxs-2  pdd-15-xxs-t pdd-15-xxs-b  pdd-30-xs-t pdd-15-xs-b">
									<a href="cadastroCliente.html" class='text-primary pdd-15-xs-b '>
										<i class="fas fa-user-plus fa-2x text-primary text-center"></i>
									</a>
								</div>
							</div>
							<div class="line-gray"></div>
			
							<div class="container-fluid table-card pdd-30-md-t pdd-30-xxs-t pdd-30-xlg-t">
								<div class="">
									<table class="table table-hover table-card">
										<thead>
											<tr>
												<th class="legenda text-gray">Cliente</th>
												<th class="legenda text-gray">Representante</th>
												<th class="legenda text-gray">Telefone</th>
												<th class="legenda text-gray"></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty lista}">
												<c:forEach var="cliente" items="${lista}">
												<tr>
													<td class="text-bold">${cliente.nome}</td>
													<td class="text-bold">${cliente.representante}</td>
													<td class="text-bold">${cliente.telefone}</td>
													<td><a href="#" class='text-primary pdd-15-md-b' data-toggle="modal" data-target="#editar"><i class="fa fa-search text-gray"
															 aria-hidden="true"></i></a> </td>
												</tr>
												</c:forEach>
											</c:if>	
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</div>
	


  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <!-- <script src="js/jquery.min.js"></script> -->
	<script src="javascripts/bootstrap.min.js"></script>

	<script src="js/menu-mobile.js"></script>
	<script>
		$(function () {
			$('input[name="daterange"]').daterangepicker({
				
				opens: 'left'
			}, function (start, end, label) {
				console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
			});
		});
	</script>
  <!-- Menu Toggle Script -->
</body>
</html>
