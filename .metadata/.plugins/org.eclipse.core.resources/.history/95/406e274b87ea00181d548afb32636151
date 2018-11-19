<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>

  <!-- Sidebar-->
  <!-- DESKTOP -->
  <div class="invisible-xs invisible-xxs">
	<div id="wrapper" class="toggled">
	
 	<!-- Sidebar-->
	<c:import url="importViews/SidebarAdmin.jsp"></c:import>
	
	
	
		<div class="pdd-15-lg-t pdd-15-md-t">
	
			<div class="container-fluid">
	
				<div class="col-lg-11 col-md-11 ">
					<h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
				</div>
	
			</div>
	
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
	
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">
					
					 
					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h1 class="text-primary text-bold text-bold">Projetos</h1>
						<c:if test="${not empty lista}">
							<c:forEach var="projeto" items="${lista}">
								<div class="mat-card-kit">
									<h2 class=" text-center text-gray text-bold pdd-15-lg-t pdd-15-md-b">${projeto.descricao}</h2>
									<div class="line-gray"></div>	
									<div class=" row row-card mat-card-kit">
										<h5 class="mat-card-kit-title text-gray text-bold">Status do Projeto:<span class="text-warning">${projeto.status}</span></h5>
										<div class="line-gray"></div>	
										<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
											<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de tarefas realizadas:<span class="text-gray"> 0 </span> </h5>
											<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de analistas no projeto:<span class="text-gray"> 0 </span> </h5> 
										</div>
										<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
											<h5 class="mat-card-kit-title text-gray text-bold">Tempo gasto no projeto: <span class="text-gray"> ${projeto.horas}h </span> </h5> 
											<a href="novaDemanda?idProjeto=${projeto.id}">
												<button type="button" class=" btn btn-sm btn-primary text-white btn-block">Adicionar nova demanda</button>
											</a>
										</div>
									</div>
									<div class="container-fluid table-card pdd-30-md-t pdd-30-lg-t pdd-30-xlg-t">
										<div class="">
											<table class="table table-hover table-card">
												<thead>
													<tr>
														<th class="legenda text-gray">Tarefa</th>
														<th class="legenda text-gray">Responsável</th>
														<th class="legenda text-gray text-center">Status</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${not empty projeto.demandas}">
														<c:forEach var="demanda" items="${projeto.demandas}">
														<tr>
															<td class="text-bold">${demanda.descricao}</td>
															<td class="text-bold">${demanda.funcionario.nome}</td>
															<c:choose>
																<c:when test="${demanda.status == 'aberto'}">											
																	<td class="text-danger text-bold text-center"> <i class="fas fa-exclamation-circle fa-1x"></i> ${demanda.status} </td>
																</c:when>
																<c:when test="${demanda.status == 'finalizado'}">
																	<td class="text-success text-bold text-center"> <i class="fas fa-check fa-1x"></i> ${demanda.status} </td>
																</c:when>
																<c:when test="${demanda.status == 'em andamento'}">																											
																	<td class="text-warning text-bold text-center"> <i class="fas fa-clock fa-1x"></i> ${demanda.status} </td>
																</c:when>
																<c:when test="${demanda.status == 'pausado'}">																											
																	<td class="text-warning text-bold text-center"> <i class="fas fa-pause fa-1x"></i> ${demanda.status} </td>
																</c:when>
															</c:choose>
															<td><a href="detalheDemanda?idDemanda=${demanda.id}"><i class="fa fa-search text-gray" aria-hidden="true"></i></a>  </td>
														</tr>
														</c:forEach>
													</c:if>	
												</tbody>
											</table>
										</div>
									</div>
								</div>
						</c:forEach>
					</c:if>	
					</div>	
										
				</div>
			</div>
		</div>
	</div>
  </div>


  <!-- MOBILE -->
   <div class="invisible-md invisible-lg invisible-xlg" style="overflow-x: hidden;">
		<c:import url="importViews/MenuAdminMobile.jsp"></c:import>
		<div class="container-fluid">

			
				<div class="pdd-12-xxs-t pdd-12-xs-t">
					<div class="col-xs-12 col-xxs-12">
					
						<div class="container-fluid pdd-30-xs-b pdd-30-xxs-b">
												
							<h2 class="text-primary text-bold text-bold">Projetos</h2>
						
							<c:if test="${not empty lista}">
							<c:forEach var="projeto" items="${lista}">
							<div class="mat-card-kit">
								<h3 class=" text-center text-gray text-bold pdd-15-xs-t pdd-15-xxs-t ">${projeto.descricao}</h3>
								<div class="line-gray"></div>	
								<div class=" row row-card mat-card-kit">
									<h5 class="mat-card-kit-title text-gray text-bold">Status do Projeto:<span class="text-success">completo</span></h5>
									<div class="line-gray"></div>	
									<div class="col-xs-12 col-xxs-12 pdd-10-xs-b pdd-10-xxs-b">
										<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de tarefas realizadas:<span class="text-gray"> 58 </span> </h5>
										<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de analistas no projeto:<span class="text-gray"> 4 </span> </h5> 
										<h5 class="mat-card-kit-title text-gray text-bold pdd-15-xs-b pdd-15-xxs-b">Tempo gasto no projeto: <span class="text-gray">
											${projeto.horas}h</span> </h5>
										
									</div>
									<div class="col-xs-12 col-xxs-12 pdd-30-xs-b pdd-30-xxs-b ">
										
										<a href="novaDemanda?idProjeto=${projeto.id}">
										<button type="button" class=" btn btn-lg btn-primary text-white btn-block ">Adicionar nova demanda</button>
									</a>
									</div>		
								</div>	
								<div class="container-fluid table-card pdd-15-xs-t pdd-15-xxs-t">
									<div class="">
										<table class="table table-hover table-card">
											<thead>
												<tr>
													<th class="legenda text-gray">Tarefa</th>
													<th class="legenda text-gray">Responsável</th>
													<th class="legenda text-gray text-center">Status</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty projeto.demandas}">
													<c:forEach var="demanda" items="${projeto.demandas}">
														<tr>
															<td class="text-bold">${demanda.descricao}</td>
															<td class="text-bold">${demanda.funcionario.nome}</td>
															<c:choose>
																<c:when test="${demanda.status == 'aberto'}">											
																	<td class="text-danger text-bold text-center"> <i class="fas fa-exclamation-circle fa-1x"></i></td>
																</c:when>
																<c:when test="${demanda.status == 'finalizado'}">
																	<td class="text-success text-bold text-center"> <i class="fas fa-check fa-1x"></i></td>
																</c:when>
																<c:when test="${demanda.status == 'em andamento'}">																											
																	<td class="text-warning text-bold text-center"> <i class="fas fa-clock fa-1x"></i></td>
																</c:when>
																<c:when test="${demanda.status == 'pausado'}">																											
																	<td class="text-warning text-bold text-center"> <i class="fas fa-pause fa-1x"></i></td>
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
							
							</c:forEach>
							</c:if>
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
