<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

						<h6 class="text-gray pull-right text-bold">
							<a href="logout"> <i class="fa fa-sign-out"></i> sair
							</a>
						</h6>
					</div>
				</div>
				<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">

					<div class="container-fluid pdd-30-lg-b pdd-30-md-b">

						<h1 class="text-primary text-bold">Detalhe da Demanda</h1>
						<div class="mat-card-kit ">

							<div class="row">
								<div class="col-md-12 col-lg-12">
									<a href="projetos" class='col-md-2 col-lg-2 col-sm-2 col-xs-2'><i
										class="back fa fa-chevron-circle-left fa-3x"></i></a>
									<div
										class="col-lg-7 col-md-7 col-sm-7 col-xs-7 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
										<h2 class="text-gray text-bold">Editar Demanda</h2>
									</div>
								</div>
							</div>
							<div class="line-gray"></div>
							<div class="row row-card">
								<div class="col-lg-12 col-md-12">
									<form action="atualizar_demanda" method="POST" class="form-inline">
										<input type="hidden" name="id" id="descricao" class="form-control" value="${demanda.id}">
										<input type="hidden" name="projeto.id" id="descricao" class="form-control" value="${demanda.projeto.id}">
										<input type="hidden" name="duracao" class="form-control" value="${demanda.duracao}">
										<div class="row">
											<div
												class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
												<div class="col-lg-3 col-md-3">
													<h5 for="descricao" class="text-gray">Descrição</h5>
												</div>
												<div class="col-lg-9 col-md-9">
													<input type="text" name="descricao" id="descricao"
														class="form-control text-dark"
														value="${demanda.descricao}" required>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 pdd-30-lg-t">
												<div class="col-lg-3 col-md-3">
													<h5 for="dtInicio" class="text-gray">Data Inicio</h5>
												</div>
												<div class="col-lg-9 col-md-9">
														<input name='dtInicio' value="${demanda.dtInicio}" id="datepicker2" class="form-control text-primary" required>  
												</div>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
												<div class="col-lg-3 col-md-3">
													<h5 for="dtFim" class="text-gray">Data Final</h5>
												</div>
												<div class="col-lg-9 col-md-9">
													<input name='dtFim' id="datepicker1" value="${demanda.dtFim}" class="form-control text-primary" required>  
												</div>
											</div>
											<div
												class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
												<div class="col-lg-3 col-md-3">
													<h5 for="responsavel" class="text-gray">Responsável</h5>
												</div>
												<div class="col-md-7 col-lg-7">
													<select class="form-control text-dark"
														name='funcionario.idFuncionario'>
														<option value= "${demanda.funcionario.idFuncionario}">${demanda.funcionario.nome}</option>
														<c:forEach var="analista" items="${analistas}">
															<c:if test="${analista.idFuncionario !=  demanda.funcionario.idFuncionario}">
																<option value="${analista.idFuncionario}">${analista.nome}</option>
															</c:if>
														</c:forEach>
													</select>
												</div>
											</div>
											<div
												class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
												<div class="col-lg-3 col-md-3">
													<h5 for="detalhes" class="text-gray">Detalhes</h5>
												</div>
												<div class="col-lg-9 col-md-9">
													<textarea type="text" name="detalhes" id="detalhes"
														class="form-control" required>${demanda.detalhes}</textarea>
												</div>
											</div>
											<div
												class="col-lg-6 col-md-6 pdd-30-lg-t pdd-30-md-t pdd-15-lg-l">
												<div class="col-lg-3 col-md-3">
													<h5 for="endereco" class="text-gray">Status</h5>
												</div>
												<div class="col-md-7 col-lg-7">
													<select class="form-control text-dark"
														name='status'>
														<option value="${demanda.status}" selected>${demanda.status}</option>
														<option value="aberto" >Aberto</option>
														<option value="em andamento">Em andamento</option>
														<option value="finalizado">Finalizado</option>

													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div
												class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4 pdd-50-lg-t pdd-50-md-t pdd-30-lg-b pdd-30-md-b">
												<button id="success-create" type="submit" name="acao"
													class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Atualizar</button>
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
	<div class="invisible-md invisible-lg invisible-xlg"
		style="overflow-x: hidden;">
		<c:import url="importViews/MenuAdminMobile.jsp"></c:import>

		<div class="pdd-15-lg-t pdd-15-md-t">

			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">

				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">

					<h2 class="text-primary text-bold">Detalhe Cliente</h2>
					<div class="mat-card-kit ">

						<div class="row">
							<div class="col-xs-12 col-xxs-12">
								<div class="">

									<a href="clientes"
										class='col-md-2 col-lg-2 col-xxs-2 col-xs-2 pdd-15-xs-t pdd-15-xxs-t'><i
										class="back fa fa-chevron-circle-left fa-3x"></i></a>
								</div>
								<div
									class="col-xxs-7 col-xs-7 col-lg-offset-1 col-md-offset-1 col-xxs-offset-1 col-xs-offset-1">
									<h3 class="text-gray text-bold">Editar Cliente</h3>
								</div>
							</div>
						</div>
						<div class="line-gray"></div>
						<div class="row row-card">
							<div class="col-xs-12 col-xxs-12">
								<form action="atualizar_cliente" method="POST"
									class="form-inline">
									<input type="hidden" name="id" id="nome" class="form-control"
										value="${cliente.id}">
									<div class="row">
										<div
											class="col-xs-12 col-xxs-12 pdd-15-xs-t pdd-15-xxs-t pdd-15-xs-b pdd-15-xxs-b">
											<div class="col-xs-12 col-xxs-12">
												<h5 class="text-gray">Cliente</h5>
											</div>
											<div class="col-xs-12 col-xxs-12">
												<input type="text" name="nome" id="nome"
													class="form-control" value="${cliente.nome}" required>
											</div>
										</div>
										<div class="col-xs-12 col-xxs-12">
											<div class="col-lg-3 col-md-3">
												<h5 class="text-gray">CNPJ</h5>
											</div>
											<div class="col-xs-12 col-xxs-12">
												<input type="text" name="cnpj" class="form-control"
													value="${cliente.cnpj}" required>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-xxs-12">
											<div class="col-lg-3 col-md-3">
												<h5 class="text-gray">Representante</h5>
											</div>
											<div class="col-xs-12 col-xxs-12">
												<input type="text" name="representante" class="form-control"
													value="${cliente.representante}" required>
											</div>
										</div>
										<div class="col-xs-12 col-xxs-12">
											<div class="col-lg-3 col-md-3">
												<h5 class="text-gray">E-mail</h5>
											</div>
											<div class="col-xs-12 col-xxs-12">
												<input type="text" name="email" id="email"
													class="form-control" value="${cliente.email}" required>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-xxs-12">
											<div class="col-xs-12 col-xxs-12">
												<h5 class="text-gray">Telefone</h5>
											</div>
											<div class="col-xs-12 col-xxs-12">
												<input type="text" name="telefone" class="form-control"
													value="${cliente.telefone}" required>
											</div>
										</div>
										<div class="col-xs-12 col-xxs-12">
											<div class="col-xs-12 col-xxs-12">
												<h5 class="text-gray">Endereco</h5>
											</div>
											<div class="col-xs-12 col-xxs-12">
												<input type="text" name="endereco" class="form-control"
													value="${cliente.endereco}" required>
											</div>
										</div>
									</div>
									<div class="row row-card">
										<div
											class="col-xs-12 col-xxs-12  pdd-30-xs-t pdd-30-xxs-t pdd-30-xxs-b pdd-30-xs-b">
											<button id="success-create" type="submit" name="acao"
												class=" btn btn-lg btn-primary text-white btn-block botao-cadastrar">Atualizar</button>
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
	<script src="javascripts/bootstrap.min.js"></script>
	<script src="js/menu-mobile.js"></script>

	<script src="js/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>	
  <script src="js/daterangepicker.js"></script>
  
	<script>
  $(function() {
	  var dtInicio = $('input[name="dtInicio"]');
	  var dtFim = $('input[name="dtFim"]');
	  
	  var _inicio = dtInicio.val().split('-');
	  dtInicio.val(_inicio[1] + '/' + _inicio[2] + '/' + _inicio[0]);
	  
	  var _fim = dtFim.val().split('-');
	  dtFim.val(_fim[1] + '/' + _fim[2] + '/' + _fim[0]);
	  
	  console.log(dtInicio.val());
	  console.log(dtFim.val());
	  
	  dtInicio.daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
	    locale: 'pt-br'
	  });
	  
	  dtFim.daterangepicker({
	    singleDatePicker: true,
	    showDropdowns: true,
	    locale: 'pt-br'
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




	<!-- Menu Toggle Script -->

</body>
</html>
