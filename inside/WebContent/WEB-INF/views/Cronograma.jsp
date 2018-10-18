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
    	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
	
	<link rel="stylesheet" type="text/css" href="css/calendar/dist/tui-calendar.css"></link>
	<link rel="stylesheet" type="text/css" href="css/calendar/css/default.css"></link>
    <link rel="stylesheet" type="text/css" href="css/calendar/css/icons.css"></link>
    
    <link href="css/styles.css" rel="stylesheet">
	<link href="css/custom.css" rel="stylesheet">
		
    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    
</head>
<body>
  <!-- Sidebar-->
  <div class="invisible-xs invisible-xxs">
	<div id="wrapper" class="toggled">
	
		<c:import url="importViews/SidebarAnalista.jsp"></c:import>
		
		<div class="container-fluid">
			<div class="col-lg-11 col-md-11 ">				
				<h6 class="text-gray pull-right text-bold"> <a href="logout"> <i class="fa fa-sign-out"></i> sair</a></h6>
			</div>
		</div>
		<div class="" style="margin-left:20px;">
	    <div id="lnb">
	    	<h4 class="text-primary text-center text-bold text-bold">Demandas</h4>
	        <div class="lnb-new-schedule">
	            <button id="btn-new-schedule" type="button" class="btn btn-default btn-block lnb-new-schedule-btn" data-toggle="modal">
	                Nova Demanda</button>
	        </div>
	        <div id="lnb-calendars" class="lnb-calendars">
	            <div>
	                <div class="lnb-calendars-item">
	                    <label>
	                        <input class="tui-full-calendar-checkbox-square" type="checkbox" value="all" checked>
	                        <span></span>
	                        <strong>View all</strong>
	                    </label>
	                </div>
	            </div>
	            <div id="calendarList" class="lnb-calendars-d1">
	            </div>
	        </div>
	        <div class="lnb-footer">
	            © NHN Entertainment Corp.
	        </div>
	    </div>
	    <div id="right">
	        <div id="menu">
	            <span class="dropdown">
	                <button id="dropdownMenu-calendarType" class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
	                    aria-haspopup="true" aria-expanded="true">
	                    <i id="calendarTypeIcon" class="calendar-icon ic_view_month" style="margin-right: 4px;"></i>
	                    <span id="calendarTypeName">Dropdown</span>&nbsp;
	                    <i class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
	                </button>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-calendarType">
	                    <li role="presentation">
	                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-daily">
	                            <i class="calendar-icon ic_view_day"></i>Daily
	                        </a>
	                    </li>
	                    <li role="presentation">
	                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weekly">
	                            <i class="calendar-icon ic_view_week"></i>Weekly
	                        </a>
	                    </li>
	                    <li role="presentation">
	                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-monthly">
	                            <i class="calendar-icon ic_view_month"></i>Month
	                        </a>
	                    </li>
	                    <li role="presentation">
	                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks2">
	                            <i class="calendar-icon ic_view_week"></i>2 weeks
	                        </a>
	                    </li>
	                    <li role="presentation">
	                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks3">
	                            <i class="calendar-icon ic_view_week"></i>3 weeks
	                        </a>
	                    </li>
	                    <li role="presentation" class="dropdown-divider"></li>
	                    <li role="presentation">
	                        <a role="menuitem" data-action="toggle-workweek">
	                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-workweek" checked>
	                            <span class="checkbox-title"></span>Show weekends
	                        </a>
	                    </li>
	                    <li role="presentation">
	                        <a role="menuitem" data-action="toggle-start-day-1">
	                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-start-day-1">
	                            <span class="checkbox-title"></span>Start Week on Monday
	                        </a>
	                    </li>
	                    <li role="presentation">
	                        <a role="menuitem" data-action="toggle-narrow-weekend">
	                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-narrow-weekend">
	                            <span class="checkbox-title"></span>Narrower than weekdays
	                        </a>
	                    </li>
	                </ul>
	            </span>
	            <span id="menu-navi">
	                <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
	                <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
	                    <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
	                </button>
	                <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
	                    <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
	                </button>
	            </span>
	            <span id="renderRange" class="render-range"></span>
	        </div>
	        <div id="calendar"></div>
	    </div>   
		</div>
		
	</div>
  </div>

  <div class="invisible-md invisible-lg invisible-xlg" style="overflow-x: hidden;">
	<div class="row">
		<div class="col-xs-offset-1 col-xxs-offset-1 col-xs-11 col-xxs-offset-11 container-fluid">
				<h3 id="menu-toggle">Menu</h3>
				<ul id="mainMenu">
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


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
    <script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
    <script type="text/javascript" src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
    <script type="text/javascript" src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
    
    <script src="css/calendar/dist/tui-calendar.js"></script>
    <script src="css/calendar/js/data/calendars.js"></script>
    <script src="css/calendar/js/data/schedules.js"></script>
    <script src="css/calendar/js/theme/dooray.js"></script>
    <script src="css/calendar/js/default.js"></script>
    
  <!-- Menu Toggle Script -->
  
</body>
</html>