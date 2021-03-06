<!-- <div id="sidebar-wrapper" class='invisible-xs invisible-xxs'> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="sidebar-wrapper" class='invisible-xs invisible-xxs' style="background: #264c54 !important">
	<ul class="sidebar-nav">
		<li class="sidebar pdd-15-md-t pdd-15-lg-t pdd-15-xlg-t pdd-30-md-b pdd-30-lg-b pdd-30-xlg-b">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-11 col-lg-10 col-lg-offset-1 col-md-offset-1 pdd-15-md-t pdd-15-lg-t pdd-15-md-b pdd-15-lg-b">
						<div class="col-md-9 col-lg-9 col-lg-offset-1 col-md-offset-1 pdd-15-md-b pdd-15-lg-b">
							<!-- <img src="./images/analyst_user.png" class="img-responsive img-circle" alt=""> -->
							<i class='text-white fas fa-users-cog fa-4x icon-admin-sidebar'></i>
						</div>
						
						<c:if test="${funcionario != null}">
							<div class="row">
								<div class="col-md-11 col-lg-11">
									<h4 class="text-white text-center">Ol�, ${funcionario.nome}</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-md-11 col-lg-11">
									<h5 class="text-white text-center">${funcionario.cargo.descricao}</h5>
								</div>
							</div>
						</c:if>
						<c:if test="${funcionario == null}">
							<div class="col-md-11 col-lg-11">
								<h4 class="text-white text-bold text-center">Administrador</h4>
							</div>
						</c:if>
						
						<!-- <a href="#"><h6 class="text-white text-left"><i class='fa fa-edit'></i> Editar perfil</h6></a> -->
						<div class="row">
	<!-- 						<div class="col-md-10 col-lg-10">
								<a href="#">
									<h5 class="text-white text-center"><i class='fa fa-edit text-primary'></i> Editar perfil</h5>
								</a>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</li>
		<div class="line-white "></div>
		<div class="menu pdd-30-md-t pdd-30-lg-t">			
			<c:if test="${funcionario != null}">
				<li class="pdd-30-md-t pdd-30-lg-t"><a href="perfil" class="text-white"> 
					<i class="fas fa-edit text-white pdd-15-lg-r" aria-hidden="true" style="display: inline"></i> Editar Perfil					
				</a></li>
			</c:if>			
			<li class="pdd-30-md-t pdd-30-lg-t"><a href="projetos"
				class="text-white"><i
					class="fas fa-tasks text-white pdd-15-lg-r" aria-hidden="true"
					style="display: inline"></i> Projetos</a></li>
			<li><a href="novoProjeto" class="text-white"><i
					class="fas fa-clipboard-check text-white pdd-15-lg-r"
					aria-hidden="true" style="display: inline"></i> Cadastrar novo
					projeto</a></li>
			<li><a href="clientes" class="text-white"><i
					class="far fa-address-card  text-white pdd-15-lg-r"
					aria-hidden="true" style="display: inline"></i> Clientes</a></li>				
			<li><a href="listar_analistas" class="text-white"> <i
					class="fas fa-users text-white pdd-15-lg-r" aria-hidden="true"
					style="display: inline"></i> Analistas
			</a></li>
			<li><a href="listar_gestores" class="text-white"> <i
					class="fas fa-user-tie text-white pdd-15-lg-r" aria-hidden="true"
					style="display: inline"></i> Gestores
			</a></li>
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