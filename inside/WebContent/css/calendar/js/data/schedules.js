'use strict';

/*eslint-disable*/

var ScheduleList = [];

var SCHEDULE_CATEGORY = [
    'milestone',
    'task'
];

function ScheduleInfo() {
    this.id = null;
    this.calendarId = null;

    this.title = null;
    this.isAllday = false;
    this.start = null;
    this.end = null;
    this.category = '';
    this.dueDateClass = '';

    this.color = null;
    this.bgColor = null;
    this.dragBgColor = null;
    this.borderColor = null;
    this.customStyle = '';

    this.isFocused = false;
    this.isPending = false;
    this.isVisible = true;
    this.isReadOnly = false;

    this.raw = {
        memo: '',
        hasToOrCc: false,
        hasRecurrenceRule: false,
        location: null,
        class: 'public', // or 'private'
        creator: {
            name: '',
            avatar: '',
            company: '',
            email: '',
            phone: ''
        }
    };
}

function generateTime(schedule, renderStart, renderEnd) {
	
	console.log(renderStart);
	console.log(renderEnd);
	
    var baseDate = new Date(renderStart);
    var singleday = chance.bool({likelihood: 70});
    var startDate = moment(renderStart)
    var endDate = moment(renderEnd);
    var diffDate = endDate.diff(startDate, 'days');
    
    console.log("startDate", startDate);
	console.log("endDate", endDate);
	
    var baseDate = new Date(renderStart);
    
    schedule.isAllday = chance.bool({likelihood: 30});
    if (schedule.isAllday) {
        schedule.category = 'allday';
    } else if (chance.bool({likelihood: 30})) {
        schedule.category = SCHEDULE_CATEGORY[chance.integer({min: 0, max: 1})];
        if (schedule.category === SCHEDULE_CATEGORY[1]) {
            schedule.dueDateClass = 'morning';
        }
    } else {
        schedule.category = 'time';
    }

    startDate.add(chance.integer({min: 0, max: diffDate}), 'days');
    startDate.hours(chance.integer({min: 0, max: 23}))
    startDate.minutes(chance.bool() ? 0 : 30);
    schedule.start = startDate.toDate();

    endDate = moment(startDate);
    if (schedule.isAllday) {
        endDate.add(chance.integer({min: 0, max: 3}), 'days');
    }

    schedule.end = endDate
        .add(chance.integer({min: 1, max: 4}), 'hour')
        .toDate();
}

function generateRandomSchedule(calendar, renderStart, renderEnd) {
    var schedule = new ScheduleInfo();

    schedule.id = chance.guid();
    schedule.calendarId = calendar.id;

    schedule.title = chance.sentence({words: 3});
    schedule.isReadOnly = chance.bool({likelihood: 20});
        
    generateTime(schedule, renderStart, renderEnd); 

    schedule.isPrivate = chance.bool({likelihood: 10});
    schedule.location = chance.address();
    schedule.attendees = chance.bool({likelihood: 70}) ? ['anyone']: [];
    schedule.recurrenceRule = chance.bool({likelihood: 20});

    schedule.color = calendar.color;
    schedule.bgColor = calendar.bgColor;
    schedule.dragBgColor = calendar.dragBgColor;
    schedule.borderColor = calendar.borderColor;

    if (schedule.category === 'milestone') {
        schedule.color = schedule.bgColor;
        schedule.bgColor = 'transparent';
        schedule.dragBgColor = 'transparent';
        schedule.borderColor = 'transparent';
    }

    schedule.raw.memo = chance.sentence();
    schedule.raw.creator.name = chance.name();
    schedule.raw.creator.avatar = chance.avatar();
    schedule.raw.creator.company = chance.company();
    schedule.raw.creator.email = chance.email();
    schedule.raw.creator.phone = chance.phone();

    ScheduleList.push(schedule);
}


function publichSchedules(calendar, renderStart, renderEnd, demanda){	
	 var schedule = new ScheduleInfo();

	    schedule.id = demanda.id;
	    schedule.calendarId = demanda.funcionario.id;

	    schedule.title = demanda.descricao;
	    schedule.isReadOnly = false;
	    
	    var dtInicio = new Date(demanda.dtInicio);
	    var dtFim = new Date(demanda.dtFim);
	    
	    generateTime(schedule, dtInicio, dtFim);

	    schedule.isPrivate = false;
	    schedule.location = "";
	    schedule.attendees = chance.bool({likelihood: 70}) ? ['anyone']: [];
	    schedule.recurrenceRule = chance.bool({likelihood: 20});

	    schedule.color = calendar.color;
	    schedule.bgColor = calendar.bgColor;
	    schedule.dragBgColor = calendar.dragBgColor;
	    schedule.borderColor = calendar.borderColor;

	    /*if (schedule.category === 'milestone') {
	        schedule.color = schedule.bgColor;
	        schedule.bgColor = 'transparent';
	        schedule.dragBgColor = 'transparent';
	        schedule.borderColor = 'transparent';
	    }*/

	    schedule.raw.memo = chance.sentence();
	    schedule.raw.creator.name = demanda.funcionario.nome;
	    schedule.raw.creator.avatar = "";
	    schedule.raw.creator.company = "";
	    schedule.raw.creator.email = demanda.funcionario.user.login;
	    schedule.raw.creator.phone = demanda.funcionario.telefone;

	    ScheduleList.push(schedule);
}

//Buscar dados de demanda do analista aqui, montar os schedules
function generateSchedule(viewName, renderStart, renderEnd, list) {
    ScheduleList = [];    
    
    var i = 0, length = 10;
    
    if (viewName === 'month') {
        length = 3;
    } else if (viewName === 'day') {
        length = 4;
    }
    for (; i < list.length; i += 1) {
    	publichSchedules(CalendarList[0], renderStart, renderEnd, list[i]);
    }    	           
}

function getScheduleOfAnalist(){
	var idFuncionario = $("#idFuncionario").val();
	console.log("idFuncionario", idFuncionario);
	$.ajax({
         type: "GET",
         dataType:"json",
         url:  "rest/demandas",
         data: { id: idFuncionario },
         success : function(response) {
        	 console.log(response);
         },
         error: function(){                      
        	 console.log('Error while request..');
         }
     });
}