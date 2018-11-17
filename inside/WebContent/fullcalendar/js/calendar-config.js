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
	
    function parseEvents(demandas){
    	var list = [];
    	
    	for ( var d in demandas) {
    		var demanda = {
				title: demandas[d].descricao,
	            start: demandas[d].dtInicio,
	            end: demandas[d].dtFim,
	            url: 'detalheDemanda?idDemanda=' + demandas[d].id
    		}
    		
    		list.push(demanda);
		}
    	
    	return list;
    }
    
    function initializeData(){
    	var idFuncionario = $("#idFuncionario").val();
        var url = "rest/demandas";
        var data = { id: idFuncionario };
        
        var idProjeto = 0;
        
        if(idFuncionario == ""){
        	idProjeto = $("#idProjeto").val();
        	url = "rest/allDemandas/" + idProjeto;
        	data = null;
        }        
        
        console.log(url);        
        
        ajax("GET", url, data, function(demandas){
        	$('#calendar').fullCalendar({
            	 //themeSystem: themeSystem,
        		 header: {
        			 left: 'prev,next today',
        			 center: 'title',
        			 right: 'month,agendaWeek,agendaDay,listMonth'
        		 },
        		 locale: 'pt-br',
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
        	      },
        	      selectable: true,
        	      selectHelper: true,
        	      select: function(start, end) {
        	    	if(idFuncionario == ""){
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
            });
        });
    }
    
    initializeData();
    
  });