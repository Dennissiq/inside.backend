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
		<div id="right">
			<input type="hidden" value="${funcionario.id}">
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
    
    <!-- <script src="js/calendar.js"></script> -->
  <!-- Menu Toggle Script -->
  
</body>
</html>