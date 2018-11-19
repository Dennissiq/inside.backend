(function() {
	var calendar = new tui.Calendar(document.getElementById('calendar'), {
	    defaultView: 'month',
	    taskView: true,    // can be also ['milestone', 'task']
	    scheduleView: true,  // can be also ['allday', 'time']
	    template: {
	        milestone: function(schedule) {
	            return '<span style="color:red;"><i class="fa fa-flag"></i> ' + schedule.title + '</span>';
	        },
	        milestoneTitle: function() {
	            return 'Milestone';
	        },
	        task: function(schedule) {
	            return '&nbsp;&nbsp;#' + schedule.title;
	        },
	        taskTitle: function() {
	            return '<label><input type="checkbox" />Task</label>';
	        },
	        allday: function(schedule) {
	            return schedule.title + ' <i class="fa fa-refresh"></i>';
	        },
	        alldayTitle: function() {
	            return 'All Day';
	        },
	        time: function(schedule) {
	            return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start;
	        }
	    },
	    month: {
	        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
	        startDayOfWeek: 0,
	        narrowWeekend: true
	    },
	    week: {
	        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
	        startDayOfWeek: 0,
	        narrowWeekend: true
	    }
	});
	
	calendar.clear();
	calendar.createSchedules([
	    {
	        id: '1',
	        calendarId: '1',
	        title: 'my schedule',
	        category: 'time',
	        dueDateClass: '',
	        start: '2018-01-18T22:30:00+09:00',
	        end: '2018-01-19T02:30:00+09:00'
	    },
	    {
	        id: '2',
	        calendarId: '1',
	        title: 'second schedule',
	        category: 'time',
	        dueDateClass: '',
	        start: '2018-01-18T17:30:00+09:00',
	        end: '2018-01-19T17:31:00+09:00'
	    }
	]);
	//calendar.createSchedules(schedules, true);
	calendar.render();
})();