/**
 * 
 */

$(document).ready(function() {

	function ajax(type, url, data, callback){
		$.ajax({
            type: type,
            dataType:"json",
            url: url,
            data: data,
            success : function(response) {
            	callback(response);
            },
            error: function(){                      
           	 console.log('Error while request..');
            }
        });
	}
	
	function background(status){
		switch (status) {
		case 'aberto':
			return "#F84B7A";
			break;
		case 'em andamento':
			return "#FFC051";
			break;
		case 'finalizado':
			return "#00DF43";
			break;
		case 'pausado':
			return "#FFC051";
			break;
		default:
			break;
		}
	}
	
    function parseEvents(demandas){
    	var list = [];
    	
    	for ( var d in demandas) {
    		var demanda = {
				title: demandas[d].descricao,
	            start: demandas[d].dtInicio,
	            end: demandas[d].dtFim,
	            url: 'detalheDemanda?idDemanda=' + demandas[d].id,
	            backgroundColor: background(demandas[d].status)
    		}
    		
    		list.push(demanda);
		}
    	
    	return list;
    }
    
    function initializeData(){
    	var perfil = $("#perfil").val();    	
    	var idFuncionario = $("#idFuncionario").val();
    	
    	console.log(perfil);
    	
    	if(perfil == "Analista"){
    		var url = "rest/demandas";
            var data = { id: idFuncionario };
    	}else{
    		if($("#idProjeto") != undefined){
        		idProjeto = $("#idProjeto").val();
            	url = "rest/allDemandas/" + idProjeto;
            	data = null;
        	}
    	}
        
        ajax("GET", url, data, function(demandas){
        	$('#calendar').fullCalendar({
            	 //themeSystem: themeSystem,
        		 header: {
        			 left: 'prev,next today',
        			 center: 'title',
        			 right: 'month,agendaWeek,agendaDay,listMonth'
        		 },
        		 height: 580,
        		 buttonIcons: false, // show the prev/next text
        		 weekNumbers: true,
        		 navLinks: true, // can click day/week names to navigate views
        		 editable: true,
        		 eventLimit: true, // allow "more" link when too many events
        		 events: parseEvents(demandas),
        		 eventClick: function(event) {
        			window.location.replace(event.url);             	
        	      },
        	     eventDrop: function(event, delta, revertFunc) {
        	        if (!confirm("Are you sure about this change?")) {
        	          revertFunc();
        	        }
        	        
        	        var id = event.url.split("=")[1];
        	        var url = "rest/demanda";
    	            var data = { id: parseInt(id), dtInicio: event.start._d, dtFim: event.end._d };
    	            
    	            console.log(data);
    	            
        	        ajax("PUT", url, data, function(demanda){
        	        	console.log("sucess");
        	        });
        	      },
        	      selectable: true,
        	      selectHelper: true,
        	      select: function(start, end) {
        	    	  
        	    	  if($("#idProjeto") != undefined){
        	    		  window.location.replace("novaDemanda?idProjeto="+idProjeto);
        	      	  }
        	        
        	    	/*var title = prompt('Event Title:');
        	        var eventData;
        	        if (title) {
        	          eventData = {
        	            title: title,
        	            start: start,
        	            end: end
        	          };
        	          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
        	        }
        	        $('#calendar').fullCalendar('unselect');*/
        	      },
        	      businessHours: {
	    	    	  // days of week. an array of zero-based day of week integers (0=Sunday)
	    	    	  dow: [ 1, 2, 3, 4, 5 ], // Monday - Thursday
	
	    	    	  start: '9:00', // a start time (10am in this example)
	    	    	  end: '18:00', // an end time (6pm in this example)
    	    	 },
    	    	 buttonText: {
    	    		month: 'Mes',
    	    		list: 'Lista'
	    		},
	    		buttonIcons: {
	    			prev: 'left-single-arrow',
	    			next: 'right-single-arrow',
	    		},
	    		hiddenDays: [ 0, 6 ]
            });
        });
    }
    
    initializeData();
    
  });