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
          <h6 class="text-gray pull-right text-bold"> <a href="index.html"> <i class="fa fa-sign-out"></i> sair</a></h6>
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
						<h4 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-danger'>${demanda.status}</span></h4>						
					</c:when>
					<c:when test="${demanda.status == 'concluida'}">
						<h4 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-success'>${demanda.status}</span></h4>
					</c:when>
					<c:when test="${demanda.status == 'em andamento'}">
						<h4 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-warning'>${demanda.status}</span></h4>						
					</c:when>
				</c:choose>
                  <div class="line-gray"></div>
                  <div class="col-md-12 col-lg-12">
                    <label  class='text-gray time-pend-task'>Tempo gasto na tarefa: <span>00:00</span></label> 
                    <c:if test="${usuario.perfil.nome == 'Analista'}">
                    	<a href="#" class='text-gray'>[editar tempo]</a>
                    </c:if>
                  </div>
                  <c:if test="${usuario.perfil.nome == 'Analista'}">
                    	 <div class="play-task col-md-12 col-lg-12">
                    <a href="iniciarTarefa?idDemanda=${demanda.id}" class='play pdd-15-md-b'><i class="fa fa-play-circle fa-1x"></i> Iniciar tarefa</a>
                  </div>
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
                     ${demanda.detalhes }
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
                  <!-- <div class="col-md-12 col-lg-12">
                   <div class="col-md-12 col-lg-12 comment-box">
                     <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> Fernando Pessoa</span></p>
                      <div class="line-gray"></div>
                     <p class='text-comment text-gray'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
                     <p class='time-comment'>08:50am  - 24/08</p>
                   </div>
                    <div class="col-md-12 col-lg-12 comment-box">
                     <p class='user-comment'><i class='fa fa-user-circle fa-2x'></i> <span> Clarice Lispector</span></p>
                      <div class="line-gray"></div> 
                     <p class='text-comment text-gray'>Lorem ipsum dolor sit amet, consectetur
                     quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                     consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                     cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non.</p>
                     <p class='time-comment'>08:50am  - 24/08</p>
                   </div>
                  </div> -->
                  <div class="col-md-12 col-lg-12">
                    <div class="line-gray"></div>
                  </div>
                  <div class="col-md-12 col-lg-12">
                   <div class="col-md-12 col-lg-12 comment-box">
                     <p>Adicionar novo comentário</p>
                     <form>
                      <div class="col-md-11 col-lg-11">
                        <textarea class='form-control'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</textarea>
                      </div>
                      <a href="#" class='send-comment col-md-1 col-lg-1'><i class='fa fa-paper-plane fa-2x'></i></a>
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
                  <div class="col-md-12 col-lg-12 upload-file-link">
                      <a href="#" class='util-link'>
                       <i class='fa fa-upload fa-1x'></i>  Carregar novo arquivo
                      </a>
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


<div class="invisible-md invisible-xlg invisible-lg" style="overflow-x: hidden;">
  <div class="row ">
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
                    <a href="demandas.html" class='col-xs-2 col-xxs-2 '><i class="back fa fa-chevron-circle-left fa-3x"></i></a>
                    <h4 class="col-xs-9 col-xxs-9 col-xs-offset-1 col-xxs-offset-1 text-gray text-bold">Tarefa: Ajuste na integração</h4>
                  </div>
                </div>
              </div>
              <div class="line-gray"></div>
              <div class="row ">
                <div class=" col-xs-12 col-xxs-12">
                  <div class=" row row-card mat-card-kit">
                    <h5 class="mat-card-kit-title text-gray text-bold">Status: <span class='text-danger'>não iniciado</span></h5>
                    <div class="line-gray"></div>
                    <div class="col-xs-12 col-xxs-12">
                      <label class='text-gray time-pend-task'>Tempo gasto na tarefa: <span>00:00</span></label>
                    </div>
                    <div class="col-xs-12 col-xxs-12 pdd-10-xs-t pdd-10-xxs-t pdd-15-xs-b pdd-15-xxs-b">
                      <a href="#" class='text-gray'>[editar tempo]</a>
                    </div>
                    <div class="play-task col-xs-12 col-xxs-12">
                      <a href="#" class='play pdd-15-xs-b pdd-15-xxs-b'><i class="fa fa-play-circle fa-1x"></i> Iniciar tarefa</a>
                    </div>
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
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
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
                      <div class="col-xs-12 col-xxs-12 comment-box">
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
                      </div>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="line-gray"></div>
                    </div>
                    <div class="col-xs-12 col-xxs-12">
                      <div class="col-xs-12 col-xxs-12 comment-box">
                        <p>Adicionar novo comentário</p>
                        <form>
                          <div class="col-xs-11 col-xxs-11">
                            <textarea class='form-control'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</textarea>
                          </div>
                          <a href="#" class='send-comment col-xs-1 col-xxs-1'><i class='fa fa-paper-plane fa-2x'></i></a>
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
                      <div class="util pdd-15-xxs-t pdd-15-xxs-b pdd-15-xs-t pdd-15-xs-b col-xs-12 col-xxs-12">
                        <p class='text-gray col-xs-12 col-xxs-12 text-center'>
                          <i class='fa fa-file fa-1x'></i> print-bug-sm.jpg
                        </p>
                        <a href="#" class='util-link col-xs-6 col-xxs-6 text-center'>
                          <i class='fa fa-download fa-1x'></i> Download
                        </a>
                        <a href="#" class='util-link col-xs-6 col-xxs-6 text-center'>
                          <i class='fa fa-eye fa-1x'></i> Visualizar
                        </a>
                      </div>
                      <div class="util pdd-15-xxs-t pdd-15-xxs-b pdd-15-xs-t pdd-15-xs-b col-xs-12 col-xxs-12">
                        <p class='text-gray col-xs-12 col-xxs-12 text-center'>
                          <i class='fa fa-file fa-1x'></i> print-bug-sm.jpg
                        </p>
                        <a href="#" class='util-link col-xs-6 col-xxs-6 text-center'>
                          <i class='fa fa-download fa-1x'></i> Download
                        </a>
                        <a href="#" class='util-link col-xs-6 col-xxs-6 text-center'>
                          <i class='fa fa-eye fa-1x'></i> Visualizar
                        </a>
                      </div>


                      <!-- <div class="col-xs-6 col xxs-6">
                        <p class="text-gray">print-bug-sm.jpg</p>
                      </div>
                      <div class="col-xs-6 col xxs-6">
                        <a href="#" class="util-link">
                          <i class='fa fa-download fa-1x'></i> Download
                        </a>
                      </div> -->

                    </div>
                    <div class="col-xs-12 col-xxs-12 upload-file-link">
                      <a href="#" class='util-link'>
                        <i class='fa fa-upload fa-1x'></i> Carregar novo arquivo
                      </a>
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
</div>
  

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery.min.js"></script>
  <script src="javascripts/bootstrap.min.js"></script>
  <script src="js/menu-mobile.js"></script>


  <!-- Menu Toggle Script -->
  
</body>
</html>