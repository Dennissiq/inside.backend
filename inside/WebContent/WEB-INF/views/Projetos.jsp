<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>

  <!-- Sidebar-->
  <!-- DESKTOP -->
  <div class="invisible-xs invisible-xxs">
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
						<a href="projetos" class="text-white"><i class="fas fa-tasks text-white pdd-15-lg-r" aria-hidden="true" style="display:inline"></i>
							Projetos</a>
					</li>
					<li>
						<a href="novoProjeto" class="text-white"><i class="fas fa-clipboard-check text-white pdd-15-lg-r" aria-hidden="true"
							 style="display:inline"></i> Cadastrar novo projeto</a>
					</li>
					<li>
						<a href="analistas" class="text-white"> <i class="fas fa-users text-white pdd-15-lg-r" aria-hidden="true" style="display:inline"></i>
							Analistas</a>
					</li>
					<li>
						<a href="desempenhoAdmin" class="text-white"> <i class="fas fa-chart-line text-white pdd-15-lg-r" aria-hidden="true"
							 style="display:inline"></i> Desempenho</a>
					</li>
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
					<h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
				</div>
	
			</div>
	
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
	
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">

					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h1 class="text-primary text-bold text-bold">Projetos</h1>
						
						<div class="mat-card-kit">
							<h2 class=" text-center text-gray text-bold pdd-15-lg-t pdd-15-md-b">Projeto Lisboa</h2>
							<div class="line-gray"></div>	
							<div class=" row row-card mat-card-kit">
								<h5 class="mat-card-kit-title text-gray text-bold">Status do Projeto:<span class="text-success">completo</span></h5>
								<div class="line-gray"></div>	
								<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
									<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de tarefas realizadas:<span class="text-gray"> 58 </span> </h5>
									<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de analistas no projeto:<span class="text-gray"> 4 </span> </h5> 
								</div>
								<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
									<h5 class="mat-card-kit-title text-gray text-bold">Tempo gasto no projeto: <span class="text-gray"> 175h </span> </h5> 
									<a href="cadastroDemanda.html">
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
												<th class="legenda text-gray">Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Fernando pessoa</td>
												<td class="text-success text-bold"> <i class="fas fa-check-circle"></i> completado </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Fernando Sermano</td>
												<td class="text-danger text-bold"> <i class="fas fa-times-circle"></i> cancelado </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
					
						<div class="mat-card-kit">
							<h2 class=" text-center text-gray text-bold pdd-15-lg-t pdd-15-md-b">Projeto Londres</h2>
							<div class="line-gray"></div>	
							<div class=" row row-card mat-card-kit">
								<h5 class="mat-card-kit-title text-gray text-bold">Status do Projeto:<span class="text-danger">cancelado</span></h5>
								<div class="line-gray"></div>	
								<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
									<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de tarefas realizadas:<span class="text-gray"> 20 </span> </h5>
									<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de analistas no projeto:<span class="text-gray"> 2 </span> </h5> 
								</div>
								<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
									<h5 class="mat-card-kit-title text-gray text-bold">Tempo gasto no projeto: <span class="text-gray"> 90h </span> </h5> 
									<a href="cadastroDemanda.html">
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
												<th class="legenda text-gray">Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Fernando pessoa</td>
												<td class="text-success text-bold"> <i class="fas fa-check-circle"></i> completado </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Jorge Amado</td>
												<td class="text-warning text-bold"> <i class="fas fa-exclamation-circle"></i> pendente </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
	
					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
					<div class="mat-card-kit">
							<h2 class=" text-center text-gray text-bold pdd-15-lg-t pdd-15-md-b">Projeto Madrid</h2>
							<div class="line-gray"></div>	
							<div class=" row row-card mat-card-kit">
								<h5 class="mat-card-kit-title text-gray text-bold">Status do Projeto:<span class="text-warning">pendente</span></h5>
								<div class="line-gray"></div>	
								<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
									<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de tarefas realizadas:<span class="text-gray"> 64 </span> </h5>
									<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de analistas no projeto:<span class="text-gray"> 8 </span> </h5> 
								</div>
								<div class="col-md-6 col-lg-6 pdd-30-md-b pdd-30-lg-b">
									<h5 class="mat-card-kit-title text-gray text-bold">Tempo gasto no projeto: <span class="text-gray"> 247h </span> </h5> 
									<a href="cadastroDemanda.html">
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
												<th class="legenda text-gray">Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Fernando Pessoa</td>
												<td class="text-warning text-bold"> <i class="fas fa-exclamation-circle"></i> pendente </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Machado de Assis</td>
												<td class="text-success text-bold"> <i class="fas fa-check-circle"></i> completado </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Machado de Assis</td>
												<td class="text-primary text-bold"> <i class="fas fa-pause-circle"></i> pausado </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
											</tr>
											<tr>
												<td class="text-bold">Ajustes na integração</td>
												<td class="text-bold">Jorge Amado</td>
												<td class="text-danger text-bold"> <i class="fas fa-times-circle"></i> cancelado </td>
												<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
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


  <!-- MOBILE -->
   <div class="invisible-md invisible-lg invisible-xlg" style="overflow-x: hidden;">
		<div class="row">
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
		<div class="container-fluid">

			
				<div class="pdd-12-xxs-t pdd-12-xs-t">
					<div class="col-xs-12 col-xxs-12">
					
						<div class="container-fluid pdd-30-xs-b pdd-30-xxs-b">
												
							<h2 class="text-primary text-bold text-bold">Projetos</h2>
							
							<div class="mat-card-kit">
								<h3 class=" text-center text-gray text-bold pdd-15-xs-t pdd-15-xxs-t ">Projeto Lisboa</h3>
								<div class="line-gray"></div>	
								<div class=" row row-card mat-card-kit">
									<h5 class="mat-card-kit-title text-gray text-bold">Status do Projeto:<span class="text-success">completo</span></h5>
									<div class="line-gray"></div>	
									<div class="col-xs-12 col-xxs-12 pdd-10-xs-b pdd-10-xxs-b">
										<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de tarefas realizadas:<span class="text-gray"> 58 </span> </h5>
										<h5 class="mat-card-kit-title text-gray text-bold">Quantidade de analistas no projeto:<span class="text-gray"> 4 </span> </h5> 
										<h5 class="mat-card-kit-title text-gray text-bold pdd-15-xs-b pdd-15-xxs-b">Tempo gasto no projeto: <span class="text-gray">
											175h </span> </h5>
									</div>
									<div class="col-xs-12 col-xxs-12 pdd-30-xs-b pdd-30-xxs-b ">
										
										<a href="cadastroDemanda.html">
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
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando pessoa</td>
													<td class="text-success text-bold text-center"> <i class="fas fa-check-circle"></i></td>
													<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
												</tr>
												<tr>
													<td class="text-bold">Ajustes na integração</td>
													<td class="text-bold">Fernando Sermano</td>
													<td class="text-danger text-bold text-center"> <i class="fas fa-times-circle text-center"></i></td>
													<td><a href="detalheDemandaAdmin.html"><i class="fa fa-search text-gray" aria-hidden="true"></i></a> </td>
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

	


  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="javascripts/bootstrap.min.js"></script>
  <script src="js/menu-mobile.js"></script>

  

  <!-- Menu Toggle Script -->

</body>
</html>
