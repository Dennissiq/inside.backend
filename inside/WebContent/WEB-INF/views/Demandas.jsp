<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>
	<!-- Sidebar-->

  <div class="invisible-xs invisible-xxs">
	<div id="wrapper" class="toggled">
	
		<c:import url="importViews/SidebarAnalista.jsp"></c:import>
	
		<div class="pdd-15-lg-t pdd-15-md-t">
	
			<div class="container-fluid">
	
				<div class="col-lg-11 col-md-11 ">
					<h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
				</div>
	
			</div>
	
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
	
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">
	
	
	
					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h1 class="text-primary text-bold text-bold">Demandas</h1>
						<div class="mat-card-kit">
							<div class="line-gray"></div>
							<div class="container-fluid table-card pdd-30-md-t pdd-30-lg-t pdd-30-xlg-t">
								<div class="">
									<table class="table table-hover table-card">
										<thead>
											<tr>
												<th class="legenda text-gray">Tarefa</th>
												<th class="legenda text-gray">Projeto</th>
												<th class="legenda text-gray">Status</th>
												<th class="legenda text-gray">Detalhes</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty lista}">
											<c:forEach var="demanda" items="${lista}">
											<tr>
												<td class="text-bold">${demanda.descricao}</td>
												<td class="text-bold">${demanda.projeto.descricao}</td>
												<c:choose>
													<c:when test="${demanda.status == 'aberto'}">											
														<td class="text-danger text-bold"> <i class="fas fa-exclamation-circle fa-1x"></i> ${demanda.status} </td>
													</c:when>
													<c:when test="${demanda.status == 'concluida'}">
														<td class="text-success text-bold"> <i class="fas fas-check-circle fa-1x"></i> ${demanda.status} </td>
													</c:when>
													<c:when test="${demanda.status == 'em andamento'}">																											
														<td class="text-warning text-bold"> <i class="fas fa-clock fa-1x"></i> ${demanda.status} </td>
													</c:when>
												</c:choose>
												<td><a href="detalheDemanda?idDemanda=${demanda.id}"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
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
  </div>

  <div class="invisible-md invisible-lg invisible-xlg" style="overflow-x: hidden;">
	<div class="row">
		<div class="col-xs-offset-1 col-xxs-offset-1 col-xs-11 col-xxs-offset-11 container-fluid">
				<h3 id="menu-toggle">Menu</h3>
				<ul id="menu">
					<li><a href="demandas.html" style="color: #848484 !important;"><h4>Demandas</h4> </a>
					</li>
					<li><a href="desempenho.html" style="color: #848484 !important;"> <h4>Desempenho</h4></a></li>
					<li><a href="index.html" style="color: #848484 !important;"> <h4>Sair</h4></a></li>
				</ul>
		</div>
	</div>
	<div class="container-fluid">

		<div class="row ">
			<div class="pdd-12-xxs-t pdd-12-xs-t">
				<div class="col-xs-12 col-xxs-12">
				
					<div class="container-fluid pdd-30-xs-b pdd-30-xxs-b">
				
						<div class="col-xs-12 col-xxs-12 pdd-30-xxs-b pdd-30-lg-b">
							<h3 class="text-primary text-bold text-bold">Demandas</h3>
							<div class="mat-card-kit">
								<h4 class=" text-center text-gray text-bold pdd-15-xs-t  pdd-15-xxs-t ">Projeto Lisboa</h4>
								<div class="line-gray"></div>
								<div class="container-fluid table-card pdd-30-md-t pdd-30-lg-t pdd-30-xlg-t">
									<div class="">
										<table class="table table-hover table-card">
											<thead>
												<tr>
													<th class="legenda text-gray">Tarefa</th>
													<th class="legenda text-gray">Projeto</th>
													<th class="legenda text-gray">Status</th>
													<th class="legenda text-gray"></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando pessoa</td>
													<td class="text-success text-center text-bold"> <i class="fas fa-check-circle"></i></td>
													<td><a href="detalheDemanda.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando Sermano</td>
													<td class="text-danger text-center text-bold"> <i class="fas fa-times-circle"></i></td>
													<td><a href="detalheDemanda.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="mat-card-kit">
								<h4 class=" text-center text-gray text-bold pdd-15-xs-t  pdd-15-xxs-t ">Projeto Lisboa</h4>
								<div class="line-gray"></div>
								<div class="container-fluid table-card pdd-30-md-t pdd-30-lg-t pdd-30-xlg-t">
									<div class="">
										<table class="table table-hover table-card">
											<thead>
												<tr>
													<th class="legenda text-gray">Tarefa</th>
													<th class="legenda text-gray">Responsável</th>
													<th class="legenda text-gray">Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando pessoa</td>
													<td class="text-success text-center text-bold"> <i class="fas fa-check-circle"></i></td>
													<td><a href="detalheDemanda.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando Sermano</td>
													<td class="text-danger text-center text-bold"> <i class="fas fa-times-circle"></i></td>
													<td><a href="detalheDemanda.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="mat-card-kit">
								<h4 class=" text-center text-gray text-bold pdd-15-xs-t  pdd-15-xxs-t ">Projeto Lisboa</h4>
								<div class="line-gray"></div>
								<div class="container-fluid table-card pdd-30-md-t pdd-30-lg-t pdd-30-xlg-t">
									<div class="">
										<table class="table table-hover table-card">
											<thead>
												<tr>
													<th class="legenda text-gray">Tarefa</th>
													<th class="legenda text-gray">Responsável</th>
													<th class="legenda text-gray">Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando pessoa</td>
													<td class="text-success text-center text-bold"> <i class="fas fa-check-circle"></i></td>
													<td><a href="detalheDemanda.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando Sermano</td>
													<td class="text-danger text-center text-bold"> <i class="fas fa-times-circle"></i></td>
													<td><a href="detalheDemanda.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
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
	</div>
  </div>

  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="javascripts/bootstrap.min.js"></script>
  <script src="js/menu-mobile.js"></script>

  <!-- Menu Toggle Script -->
</body>
</html>