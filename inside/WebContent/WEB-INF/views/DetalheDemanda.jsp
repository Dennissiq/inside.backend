<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<c:import url="Header.jsp"/>
<body>

<div class="invisible-xs invisible-xxs">
  <div id="wrapper" class="toggled">

      <!-- Sidebar-->
       <c:choose>
			<c:when test="${usuario.perfil.nome == 'Administrador'}">
				<c:import url="importViews/SidebarAdmin.jsp"></c:import>
			</c:when>
			<c:when test="${usuario.perfil.nome == 'Analista'}">
				<c:import url="importViews/SidebarAnalista.jsp"></c:import>
			</c:when>
		</c:choose>
	
    <div class="pdd-15-lg-t pdd-15-md-t">
      <div class="container-fluid">
        <div class="col-lg-11 col-md-11 ">
          <h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
        </div>
      </div>

      <div class="col-md-10 col-lg-10 col-lg-offset-1 col-md-offset-1">

        <div class="container-fluid pdd-30-lg-b pdd-30-md-b">

          <h1 class="text-primary text-bold">Detalhes</h1>
          <div class="mat-card-kit ">
            <div class="row">
              <div class="col-md-12 col-lg-12">
                <div class="container">  
                <c:choose>
					<c:when test="${usuario.perfil.nome == 'Administrador'}">
						<a href="projetos" class='col-md-2 col-lg-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
					</c:when>
					<c:when test="${usuario.perfil.nome == 'Analista'}">
						<a href="demandas" class='col-md-2 col-lg-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
					</c:when>
				</c:choose>                                  
                  <h2 class="col-md-10 col-lg-10 text-gray text-bold">Tarefa: ${demanda.descricao}</h2>
                </div>
              </div>
            </div>
            <div class="line-gray"></div>
            <div class="row row-card">              
              <div class=" col-md-12 col-lg-12">
                <div class=" row row-card mat-card-kit">  
                  	<c:choose>
						<c:when test="${demanda.status == 'aberto'}">
							<h4 class="mat-card-kit-title text-gray text-bold demanda-status-class">Status: <span class='text-danger'>
							<i class="fas fa-exclamation-circle fa-1x"></i> ${demanda.status}</span></h4>						
						</c:when>
						<c:when test="${demanda.status == 'finalizado'}">
							<h4 class="mat-card-kit-title text-gray text-bold demanda-status-class">Status: <span class='text-success'>
							<i class="fas fa-check fa-1x"></i> ${demanda.status}</span></h4>
						</c:when>
						<c:when test="${demanda.status == 'em andamento'}">
							<h4 class="mat-card-kit-title text-gray text-bold demanda-status-class">Status: <span class='text-warning'>
							<i class="fas fa-clock fa-1x"></i> ${demanda.status}</span></h4>						
						</c:when>
						<c:when test="${demanda.status == 'pausado'}">
							<h4 class="mat-card-kit-title text-gray text-bold demanda-status-class">Status: <span class='text-warning'>
							<i class="fas fa-pause fa-1x"></i> ${demanda.status}</span></h4>						
						</c:when>
					</c:choose>
				
					<c:if test="${usuario.perfil.nome == 'Administrador'}">
						<a href="editarDemanda?idDemanda=${demanda.id}"><i class="fas fa-edit text-gray detalhe-demanda-link" aria-hidden="true"></i></a>
					</c:if>
                  <div class="line-gray demanda-break"></div>
                  <div class="col-md-12 col-lg-12">
                    <label  class='text-gray time-pend-task'>Tempo gasto na tarefa: <span>
          				<c:if test="${demanda.duracao == null}">
          					00:00:00
          				</c:if>
          				<c:if test="${demanda.duracao != null}">
          					<fmt:formatDate value="${demanda.duracao}" pattern="HH:mm:ss"/>
          				</c:if>                    	
                    </span></label> 
                 <%--    <c:if test="${usuario.perfil.nome == 'Analista'}">
                    	<a href="#" class='text-gray'>[editar tempo]</a>
                    </c:if> --%>
                  </div>	
                   <div class="col-md-12 col-lg-12">
                    <label  class='text-gray time-pend-task'>Período para desenvolvimento: 
                    	de <span class='projeto-inicio'>${demanda.dtInicio.toString().split(" ")[0]}</span> 
                    	até <span class='projeto-fim'>${demanda.dtFim.toString().split(" ")[0]}</span>
                    </label>       
                  </div>
                  <div class="col-md-12 col-lg-12">
                    <c:if test="${usuario.perfil.nome == 'Administrador'}">
                  	 	<label  class='text-gray time-pend-task'>Responsável: <span>${demanda.funcionario.nome}</span></label>                   	                   	 
                  	</c:if>
                  </div>	
                   <c:if test="${usuario.perfil.nome == 'Analista'}">
	                 <c:if test="${demanda.status == 'aberto'}">
	                   	 <div class="play-task col-md-12 col-lg-12">
		                  	 <a href="iniciarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><i class="fa fa-play-circle fa-1x"></i> Iniciar tarefa</a>
	                  	 </div>                  	 
                  	</c:if>
                  	<c:if test="${demanda.status == 'pausado'}">
                   	 <div class="play-task col-md-12 col-lg-12">
	                  	 <a href="iniciarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><i class="fa fa-play-circle fa-1x"></i> Iniciar tarefa</a>                  	 
	                  	 <a href="finalizarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'> <p><i class="fa fa-check-circle fa-1x"></i> Finalizar tarefa</p></a>  
                  	 </div>                  	 
                  	</c:if>
                  	<c:if test="${demanda.status == 'em andamento'}">
                   	 <div class="play-task col-md-12 col-lg-12">
                  	 	<a href="pausarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><p><i class="fa fa-stop-circle fa-1x"></i> Pausar tarefa</p></a>
                  	 	<a href="finalizarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'> <p><i class="fa fa-check-circle fa-1x"></i> Finalizar tarefa</p></a>                  	 
                  	 </div>
                  	</c:if>
                  </c:if>
                 
                </div>
              </div>
            </div>
            <div class="row row-card">
             <div class="col-md-12 col-lg-12">
                <div class="row row-card mat-card-kit">
                  <h4 class="mat-card-kit-title text-gray text-bold">Descrição</h4>
                  <div class="line-gray"></div>
                  <div class="col-md-12 col-lg-12">
                   <p class='text-gray description-task'>
                     ${demanda.detalhes}
                   </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="row row-card">

              <div class=" col-md-12 col-lg-12">
                <div class="row row-card mat-card-kit">
                  <h4 class="mat-card-kit-title text-gray text-bold">Comentários</h4>
                  <div class="line-gray"></div>
                   <div class="col-md-12 col-lg-12">
                  <c:if test="${not empty demanda.comentarios}">						
						<c:forEach var="comentario" items="${demanda.comentarios}">
	                   		<div class="col-md-12 col-lg-12 comment-box">
		                     <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> ${comentario.usuario.login.split("@")[0]}</span></p>
		                      <div class="line-gray"></div>
		                     <p class='text-comment text-gray'>${comentario.comentario}</p>
		                     <p class='time-comment'>${comentario.dtComentario }</p>
		                   </div>
	                   </c:forEach>
              		</c:if> 
<%--                    <div class="col-md-12 col-lg-12 comment-box">
                     <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> ${comentario.recurso.usuario.login}</span></p>
                      <div class="line-gray"></div>
                     <p class='text-comment text-gray'>${comentario.comentario}</p>
                     <p class='time-comment'>${comentario.dtComentario }</p>
                   </div> --%>
                    <%--<div class="col-md-12 col-lg-12 comment-box">
                     <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> Clarice Lispector</span></p>
                      <div class="line-gray"></div> 
                     <p class='text-comment text-gray'>Lorem ipsum dolor sit amet, consectetur
                     quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                     consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                     cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non.</p>
                     <p class='time-comment'>08:50am  - 24/08</p>
                   </div>--%>
                  </div> 
                  <div class="col-md-12 col-lg-12">
                    <div class="line-gray"></div>
                  </div>
                  <div class="col-md-12 col-lg-12">
                   <div class="col-md-12 col-lg-12 comment-box">
                     <p>Adicionar novo comentário</p>
                     <form action="addComentario" method="post">
                      <input type="hidden" name='demanda.id' value="${demanda.id}" class="form-control text-primary">
                      <div class="col-md-10 col-lg-10">
                        <textarea name="comentario" class='form-control'>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</textarea>
                      </div>
                      <div class="col-md-2 col-lg-2">
                      	<button type="submit" class='btn btn-lg btn-primary text-white btn-block'>Enviar</button>
                      </div>                      
                      <!-- <a href="addComentario?idDemanda=${demanda.id}" class='send-comment col-md-1 col-lg-1'><i class='fa fa-paper-plane fa-2x'></i></a> como eh q comenta mesmo aq?ctrl  -->
                     </form>
                   </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row row-card">

              <div class=" col-md-12 col-lg-12">
                <div class="row row-card mat-card-kit">
                  <h4 class="mat-card-kit-title text-gray text-bold">Anexos</h4>
                  <div class="line-gray"></div>
                   <div class="col-md-12 col-lg-12 pdd-10-lg-t">
                  	<c:if test="${not empty demanda.arquivos}">						
						<c:forEach var="arquivo" items="${demanda.arquivos}">
	                   		
		                   
		                   <div class="util pdd-15-lg-t pdd-10-lg-b col-md-12 col-lg-12">
		                    <p class='text-gray col-md-7 col-lg-8'>
		                      <i class='fa fa-file fa-1x'></i> ${arquivo.nome}.${arquivo.type}
		                    </p>
		                    <a href="./uploads/${arquivo.nome}.${arquivo.type}" download class='util-link col-md-2 col-lg-2'>
		                     <i class='fa fa-download fa-1x'></i>  Download
		                    </a>
		                   </div>
	                   </c:forEach>
              		</c:if> 
              		</div>
                  <!-- <div class="col-md-12 col-lg-12 pdd-10-lg-t">
                   <div class="util pdd-15-lg-t pdd-10-lg-b col-md-12 col-lg-12">
                    <p class='text-gray col-md-7 col-lg-8'>
                      <i class='fa fa-file fa-1x'></i> print-bug-sm.jpg
                    </p>
                    <a href="#" class='util-link col-md-2 col-lg-2'>
                     <i class='fa fa-download fa-1x'></i>  Download
                    </a>
                    <a href="#" class='util-link col-md-2 col-lg-2'>
                     <i class='fa fa-eye fa-1x'></i>  Visualizar
                    </a>
                   </div>
                   <div class="util pdd-10-lg-t pdd-10-lg-b col-md-12 col-lg-12">
                    <p class='text-gray col-md-7 col-lg-8'>
                      <i class='fa fa-file fa-1x'></i> print-bug-sm.jpg
                    </p>
                    <a href="#" class='util-link col-md-2 col-lg-2'>
                     <i class='fa fa-download fa-1x'></i>  Download
                    </a>
                    <a href="#" class='util-link col-md-2 col-lg-2'>
                     <i class='fa fa-eye fa-1x'></i>  Visualizar
                    </a>
                   </div>
                   
                   <div class="util pdd-10-lg-t pdd-10-lg-b col-md-12 col-lg-12">
                    <p class='text-gray col-md-7 col-lg-8'>
                      <i class='fa fa-file fa-1x'></i> print-bug-sm.jpg
                    </p>
                    <a href="#" class='util-link col-md-2 col-lg-2'>
                     <i class='fa fa-download fa-1x'></i>  Download
                    </a>
                    <a href="#" class='util-link col-md-2 col-lg-2'>
                     <i class='fa fa-eye fa-1x'></i>  Visualizar
                    </a>
                   </div>
                  </div> -->
                  
                  
                <form action="upload" method="post" enctype="multipart/form-data">
                	<input type="hidden" name='idDemanda' value="${String.valueOf(demanda.id)}" class="form-control text-primary"> 	
				 	
				 	<div class="col-md-10 col-lg-10">
						<label for="file" class='text-gray time-pend-task'>Escolha um arquivo</label> 
                	</div>
                	
				 	<div class="col-md-10 col-lg-10">
						<input type="file" name="file" />
					</div>
					
					<div class="col-md-10 col-lg-10">
						<label for="nome" class='text-gray time-pend-task'>Nome para o arquivo</label> 
                	</div>
                	
					<div class="col-md-12 col-lg-12 pdd-15-lg-b">
						<div class="col-md-10 col-lg-10">						
							<input type="text" name="nome" value="upload" class="form-control" />
						</div>
						<div class="col-md-2 col-lg-2">
							<input type="submit" name="submit" class="btn btn-primary text-white" value="upload" />
						</div>
					</div>
				</form>
                  <!-- <div class="col-md-12 col-lg-12 upload-file-link">
                      <a href="#" class='util-link'>
                       <i class='fa fa-upload fa-1x'></i> Carregar novo arquivo
                      </a>
                  </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


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
      
            <h3 class="text-primary text-bold">Detalhes</h3>
            <div class="mat-card-kit ">
              <div class="row">
                <div class="col-md-12 col-lg-12">
                  <div class="container pdd-20-xs-t pdd-20-xxs-t pdd-15-xs-b pdd-15-xxs-b">
	                 <c:choose>
						<c:when test="${usuario.perfil.nome == 'Administrador'}">
							<a href="projetos" class='col-xs-2 col-xxs-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
						</c:when>
						<c:when test="${usuario.perfil.nome == 'Analista'}">
							<a href="demandas" class='col-xs-2 col-xxs-2'><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
						</c:when>
					</c:choose> 
                    <h4 class="col-xs-9 col-xxs-9 col-xs-offset-1 col-xxs-offset-1 text-gray text-bold">Tarefa: ${demanda.descricao}</h4>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row ">
                <div class=" col-xs-12 col-xxs-12">
                  <div class=" row row-card mat-card-kit">
                                      <c:choose>
					<c:when test="${demanda.status == 'aberto'}">
						<h5 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-danger'>
						<i class="fas fa-exclamation-circle fa-1x"></i> ${demanda.status}</span></h5>						
					</c:when>
					<c:when test="${demanda.status == 'finalizado'}">
						<h5 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-success'>
						<i class="fas fa-check fa-1x"></i> ${demanda.status}</span></h5>
					</c:when>
					<c:when test="${demanda.status == 'em andamento'}">
						<h5 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-warning'>
						<i class="fas fa-clock fa-1x"></i> ${demanda.status}</span></h5>						
					</c:when>
					<c:when test="${demanda.status == 'pausado'}">
						<h5 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-warning'>
						<i class="fas fa-pause fa-1x"></i> ${demanda.status}</span></h5>						
					</c:when>
				</c:choose>
                    <div class="line-gray"></div>
                    <div class="col-xs-12 col-xxs-12">
                      <label class='text-gray time-pend-task'>Tempo gasto na tarefa: <span>
                      	<fmt:formatDate value="${demanda.duracao}" pattern="HH:mm:ss"/>
                      </span></label>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                    <label  class='text-gray time-pend-task'>Período para desenvolvimento: 
                    	de <span class='projeto-inicio-mob'>${demanda.dtInicio.toString().split(" ")[0]}</span> 
                    	até <span class='projeto-fim-mob'>${demanda.dtFim.toString().split(" ")[0]}</span>
                    </label>       
                  </div>
                    <div class="col-xs-12 col-xxs-12 pdd-10-xs-t pdd-10-xxs-t pdd-15-xs-b pdd-15-xxs-b">
                <%--      <c:if test="${usuario.perfil.nome == 'Analista'}">
                    	<a href="#" class='text-gray'>[editar tempo]</a>
                    </c:if> --%>
                    </div>
                   <div class="col-md-12 col-lg-12">
                    <c:if test="${usuario.perfil.nome == 'Administrador'}">
                  	 	<label  class='text-gray time-pend-task'>Responsável: <span>${demanda.funcionario.nome}</span></label>                   	                   	 
                  	</c:if>
                  </div>	
                  <c:if test="${usuario.perfil.nome == 'Analista'}">
                  	 <c:if test="${demanda.status == 'aberto'}">
	                   	 <div class="play-task col-xs-12 col-xxs-12">
		                  	 <a href="iniciarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><i class="fa fa-play-circle fa-1x"></i> Iniciar tarefa</a>
	                  	 </div>                  	 
                  	</c:if>
                  	<c:if test="${demanda.status == 'pausado'}">
                   	 <div class="play-task col-xs-12 col-xxs-12">
	                  	 <a href="iniciarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><i class="fa fa-play-circle fa-1x"></i> Iniciar tarefa</a>                  	 
	                  	 <a href="finalizarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'> <p><i class="fa fa-check-circle fa-1x"></i> Finalizar tarefa</p></a>  
                  	 </div>                  	 
                  	</c:if>
                  	<c:if test="${demanda.status == 'em andamento'}">
                   	 <div class="play-task col-xs-12 col-xxs-12">
                  	 	<a href="pausarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><p><i class="fa fa-stop-circle fa-1x"></i> Pausar tarefa</p></a>
                  	 	<a href="finalizarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'> <p><i class="fa fa-check-circle fa-1x"></i> Finalizar tarefa</p></a>                  	 
                  	 </div>
                  	</c:if>
                  </c:if>
                  </div>
                </div>
              </div>
              <div class="row ">
      
                <div class="col-xs-12 col-xxs-12">
                  <div class="row row-card mat-card-kit">
                    <h5 class="mat-card-kit-title text-gray text-bold">Descrição</h5>
                    <div class="line-gray"></div>
                    <div class="col-xs-12 col-xxs-12">
                      <p class='text-gray description-task'>
                        ${demanda.detalhes}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
      
                <div class=" col-xs-12 col-xxs-12">
                  <div class="row row-card mat-card-kit">
                    <h5 class="mat-card-kit-title text-gray text-bold">Comentários</h5>
                    <div class="line-gray"></div>
                    <div class="col-xs-12 col-xxs-12">
                    <c:if test="${not empty demanda.comentarios}">						
						<c:forEach var="comentario" items="${demanda.comentarios}">
	                   		<div class="col-xs-12 col-xxs-12 comment-box">
		                     <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> ${comentario.usuario.login.split("@")[0]}</span></p>
		                      <div class="line-gray"></div>
		                     <p class='text-comment text-gray'>${comentario.comentario}</p>
		                     <p class='time-comment'>${comentario.dtComentario }</p>
		                   </div>
	                   </c:forEach>
              		</c:if> 
<!--                       <div class="col-xs-12 col-xxs-12 comment-box">
                        <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> Fernando Pessoa</span></p>
                        <div class="line-gray"></div>
                        <p class='text-comment text-gray'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
                        <p class='time-comment'>08:50am - 24/08</p>
                      </div>
                      <div class="col-xs-12 col-xxs-12 comment-box">
                        <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> Clarice Lispector</span></p>
                        <div class="line-gray"></div>
                        <p class='text-comment text-gray'>Lorem ipsum dolor sit amet, consectetur quis nostrud exercitation ullamco
                          laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                          velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non.</p>
                        <p class='time-comment'>08:50am - 24/08</p>
                      </div> -->
                      
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="line-gray"></div>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-xs-12 col-xxs-12 comment-box">
                        <p>Adicionar novo comentário</p>
                        <form action="addComentario" method="post">
                      <input type="hidden" name='demanda.id' value="${demanda.id}" class="form-control text-primary">
                      <div class="col-xs-12 col-xxs-12 ">
                        <textarea name="comentario" class='form-control' placeholder="Lorem ipsum dolor sit amet, consectetur adipisicing elit."></textarea>
                      </div>
                      <div class="col-xxs-12 col-xs-12 pdd-30-xs-t pdd-30-xxs-t">
                      	<button type="submit" class='btn btn-lg btn-primary text-white btn-block'>Enviar</button>
                      </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
      
                <div class=" col-xs-12 col-xxs-12">
                  <div class="row row-card mat-card-kit">
                    <h5 class="mat-card-kit-title text-gray text-bold">Anexos</h5>
                    <div class="line-gray"></div>
                    <div class="col-xs-12 col-xxs-12 pdd-10-xs-t pdd-10-xxs-t">

                  	<c:if test="${not empty demanda.arquivos}">						
						<c:forEach var="arquivo" items="${demanda.arquivos}">
	                   		
		                   
		                   <div class="util pdd-15-lg-t pdd-10-lg-b col-md-12 col-lg-12">
		                    <p class='text-gray col-xs-12 col-xxs-12'>
		                      <i class='fa fa-file fa-1x'></i> ${arquivo.nome}.${arquivo.type}
		                    </p>
		                    <a href="./uploads/${arquivo.nome}.${arquivo.type}" target="_blank" class='util-link col-xs-12 col-xxs-12'>
		                     <i class='fa fa-download fa-1x'></i>  Download
		                    </a>
		                   </div>
	                   </c:forEach>
              		</c:if> 
                <form action="upload" method="post" enctype="multipart/form-data">
                	<input type="hidden" name='idDemanda' value="${String.valueOf(demanda.id)}" class="form-control text-primary"> 	
				 	
				 	<div class="col-md-10 col-lg-10">
						<label for="file" class='text-gray time-pend-task'>Escolha um arquivo</label> 
                	</div>
                	
				 	<div class="col-md-10 col-lg-10">
						<input type="file" name="file" />
					</div>
					
					<div class="col-md-10 col-lg-10">
						<label for="nome" class='text-gray time-pend-task'>Nome para o arquivo</label> 
                	</div>
                	
					<div class="col-md-12 col-lg-12 pdd-15-xs-b pdd-15-xxs-b ">
						<div class="col-md-10 col-lg-10">						
							<input type="text" name="nome" value="upload" class="form-control" />
						</div>
						<div class="col-md-2 col-lg-2 pdd-15-xs-t pdd-15-xxs-t">
							<input type="submit" name="submit" class="btn btn-primary text-white" value="upload" />
						</div>
					</div>
				</form>


                      <!-- <div class="col-xs-6 col xxs-6">
                        <p class="text-gray">print-bug-sm.jpg</p>
                      </div>
                      <div class="col-xs-6 col xxs-6">
                        <a href="#" class="util-link">
                          <i class='fa fa-download fa-1x'></i> Download
                        </a>
                      </div> -->

                    </div>
<!--                     <div class="col-xs-12 col-xxs-12 upload-file-link">
                      <a href="#" class='util-link'>
                        <i class='fa fa-upload fa-1x'></i> Carregar novo arquivo
                      </a>
                    </div> -->
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
  

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="javascripts/bootstrap.min.js"></script>
  <script src="js/menu-mobile.js"></script>
  <script>
	$(function () {
		var inicio = $(".projeto-inicio").text();
		var fim = $(".projeto-fim").text();
		
		var a = inicio.split('-').reverse().join("/");
		var b = fim.split('-').reverse().join("/");
		
		$(".projeto-inicio").text(a);
		$(".projeto-fim").text(b);
		
		$(".projeto-inicio-mob").text(a);
		$(".projeto-fim-mob").text(b);
	});
  </script>

  <!-- Menu Toggle Script -->
  
</body>
</html>