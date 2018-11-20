<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>
	<!-- MODAL -->
 		<div class="modal fade" id="editar" style="overflow-x: hidden;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title text-gray text-bold" id="editarTitle">Detalhes do Analista</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="line-gray"></div>
					<div class="row modal-header-info">						
						<div class="col-md-12 col-lg-12 pdd-15-lg-b pdd-30-lg-t pdd-30-md-t pdd-15-md-b pdd-15-xxs-b pdd-30-xxs-t pdd-30-xs-t pdd-15-xs-b">
							<div class="col-md-12 col-lg-12">
								<h4 class="text-gray">
									<i class="fas fa-user-circle fa-1x"></i> <span id="modal-nome">Fernando Pessoa</span> 
								</h4>
							</div>
							<div class="col-md-12 col-lg-12">
								<h5 class="text-danger">
									<i class="fas fa-envelope fa-1x"></i> <span id="modal-email"> fernando.pessoa@gmail.com</span>
								</h5>
								<h5 class="text-gray">
									<i class="fas fa-briefcase fa-1x"></i> <span id="modal-especialidade">Analista Jr</span>
								</h5>
							</div>
						</div>
					</div>
		
					<div class="modal-body ">
						<div class="container-fluid table-card">
							<div class="pdd-15-md-t pdd-15-lg-t">
								<table class="table table-hover table-card">
									<thead>
										<tr>
											<!-- <th class="text-gray text-left">Projeto</th> -->
											<th class="text-gray">Demandas</th>
											<th class="text-gray"></th>
										</tr>
									</thead>
									<tbody id="modal-list-project">
									</tbody>
								</table>
							</div>
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
					<h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
				</div>
			</div>
	
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
	
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">

					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h1 class="text-primary text-bold text-bold">Funcionários</h1>
						
						<div class="mat-card-kit">
							<div class="row">
								<div class="col-md-6 col-lg-6 col-lg-offset-3 col-md-offset-3" >
									<h2 class=" text-center text-gray text-bold  pdd-15-md-b">Analistas</h2>
									
							</div>
							<div class="col-md-2 col-lg-2 col-lg-offset-1 pdd-15-lg-t pdd-15-lg-b col-md-offset-1 pdd-15-md-t pdd-15-md-b" >
							 	<a href="novo_analista" class='text-primary pdd-15-md-b '>
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
												<th class="legenda text-gray">Analista</th>
												<th class="legenda text-gray">Especialista</th>
												<th class="legenda text-gray">Local</th>
												<th class="legenda text-gray">Status</th>
											<!-- 	<th class="legenda text-gray"></th> -->
											</tr>
										</thead>
										<tbody>
										<c:forEach var="funcionario" items="${lista}">
											<tr>
												<td class="text-bold">${funcionario.nome }</td>
												<td class="text-bold">${funcionario.especialidade }</td>
												<td class="text-bold">${funcionario.localizacao}</td>
												<td class="text-success text-bold"><i class="fas fa-check-circle"></i> Disponível</td>
												<td><a href="#" class='text-primary pdd-15-md-b' data-nome="${funcionario.nome}" data-email="${funcionario.email}" data-especialidade="${funcionario.especialidade}"  data-id="${funcionario.idFuncionario}" data-toggle="modal" data-target="#editar"><i class="fa fa-search text-gray" aria-hidden="true"></i></a></td>
											</tr>
										</c:forEach>
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
	<c:import url="importViews/MenuAdminMobile.jsp"></c:import>
	<div class="row">
			<div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">
			
				<div class="container-fluid pdd-30-lg-b pdd-30-md-b">
			
					<div class="col-md-9 col-lg-12 pdd-30-md-b pdd-30-lg-b">
						<h2 class="text-primary text-bold text-bold">Analistas</h2>
			
						<div class="mat-card-kit">
							<div class="row">
								<div class="col-xs-9 col-xxs-9">
									<h3 class=" text-center text-gray text-bold  pdd-15-md-b pdd-10-xxs-t pdd-10-xs-t">Projeto vs Analista</h3>
			
								</div>
								<div class="col-xs-2 col-xxs-2  pdd-15-xxs-t pdd-15-xxs-b  pdd-30-xs-t pdd-15-xs-b">
									<a href="novo_analista" class='text-primary pdd-15-xs-b '>
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
												<th class="legenda text-gray">Analista</th>
												<th class="legenda text-gray">Especialista</th>
												<th class="legenda text-gray">Local</th>
												<th class="legenda text-gray">Status</th>
												<th class="legenda text-gray"></th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="funcionario" items="${lista}">
											<tr>
												<td class="text-bold">${funcionario.nome }</td>
												<td class="text-bold">${funcionario.especialidade }</td>
												<td class="text-bold">${funcionario.localizacao}</td>
												<td class="text-success text-bold text-center"> <i class="fas fa-check-circle"></i>  </td>
<!-- 												<td><a href="#" class='text-primary pdd-15-md-b' data-toggle="modal" data-target="#editar"><i class="fa fa-search text-gray"
														 aria-hidden="true"></i></a> </td> -->
											</tr>
											</c:forEach>
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
			
        $("#editar").on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); //botao que disparou a modal
            
            var id = button.data('id');
            var nome = button.data('nome');
            var email = button.data('email');
            var especialidade = button.data('especialidade');
            
            $("#modal-nome").text(nome);
            $("#modal-email").text(email);
            $("#modal-especialidade").text(especialidade);
            
            var url = "rest/demandas";
            var data = { id: id};
            
            $.ajax({
                type: "GET",
                dataType:"json",
                url: url,
                data: data,
                success : function(response) {
                	console.log(response);
                	                	
                	var body = $("#modal-list-project");
                	
                	if (body.children().length > 0) {
                	    body.empty();
                	}
                	
                	for ( var i in response) {
                		
                    	var tr = $("<tr />");
                    	
                    	var projeto = $("<td />", {
                    		text: "Projeto A"
                    	});
                    	
                    	var demanda = $("<td />", {
                    		text: response[i].descricao
                    	});
                    	
                    	var link = $("<td />")
                    	
                    	$("<a />", {
                    		href: 'detalheDemanda?idDemanda=' + response[i].id,
                    	    title: 'Detalhe da Demanda',
                    	    text: 'detalhes',
                    	    class: 'btn btn-primary modal-btn-detail'
                    	}).appendTo(link);
                    	
                    	//projeto.appendTo(tr);
                    	demanda.appendTo(tr);
                    	link.appendTo(tr);
                    	tr.appendTo(body);
					}

                	console.log(body);
                },
                error: function(){                      
               		console.log('Error while request..');
                }
            });
        });    
	</script>
  <!-- Menu Toggle Script -->
</body>
</html>
