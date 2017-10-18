<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Calendar</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="/resources/bower_components/fullcalendar/dist/fullcalendar.min.css">
  <link rel="stylesheet" href="/resources/bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
  <link rel="stylesheet" href="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Calendar
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Calendar</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          
          <!-- /. box -->
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title"> 일정 등록 </h3>
            </div>
            <div class="box-body">
              <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                <!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
                <h5> 일정 종류 선택 </h5>
                <input type="hidden" id="type-value" val="0">
                <ul class="fc-color-picker" id="color-chooser">
                  <li><a class="text-blue" href="#" value="1"><span class="fa fa-envelope bg-blue fa-fw"></span></a></li>
                  <li><a class="text-red" href="#" value="2"><span class="fa fa-warning bg-red fa-fw"></span></a></li>
                  <li><a class="text-black" href="#" value="3"><span class="fa fa-mortar-board bg-black fa-fw"></span></a></li>
                </ul>
               </div>
               <div class=input-group>
               <h5> 대상 학년 </h5>
               <label class="radio-inline">
                  <input type="radio" name="inlineRadioOptions" id="inlineRadio0" value="0"> 전체
                </label>
               <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1"> 1
                </label>
                <label class="radio-inline">
                  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="2"> 2
                </label>
                <label class="radio-inline">
                  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="3"> 3
                </label>
                <label class="radio-inline">
                  <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="4"> 4
                </label>
                </div>
   
              <!-- /btn-group -->
              
              <div class="input-group">
              <div class="input-group-addon">
                    <i class="fa fa-clock-o"></i>
                  </div>
              <input type="text" id="datepicker" class="form-control"/>
              </div>
              <div class="input-group">
                <input id="new-event" type="text" class="form-control" placeholder="Event Title">
                
                <div class="input-group-btn">
                  <button id="add-new-event" type="button" class="btn btn-primary btn-flat">Add</button>
                </div>
                <!-- /btn-group -->
              </div>
              <!-- /input-group -->
            </div>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<!-- fullCalendar -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> 
<script src="/resources/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="/resources/bower_components/fullcalendar/dist/locale-all.js"></script>
<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
	  
	  /* moment locale 설정 */
	  moment.updateLocale('ko', lang);

	  $("#add-new-event").click(createEvent);
	  
	  initializeCalendar();

	  loadScheduleList();
	  
	  $('#calendar').fullCalendar('rerenderEvents');
	  /* datepicker 로딩 */
	  $('#datepicker').daterangepicker({
		    "timePicker": true,
		    "timePickerIncrement": 30,
		    "startDate": "2017/10/15",
		    "endDate": "2017/10/20",
		    "opens": "center",
		    locale: {
	            "format": "YYYY/MM/DD h:mm",
	            "separator": " - ",
	            "applyLabel": "적용",
	            "cancelLabel": "취소",
	            "fromLabel": "From",
	            "toLabel": "To",
	            "customRangeLabel": "사용자 설정",
	            "weekLabel": "주",
	            "daysOfWeek": [
	                "일",
	                "월",
	                "화",
	                "수",
	                "목",
	                "금",
	                "토"
	            ],
	            "monthNames": [
	                "1월",
	                "2월",
	                "3월",
	                "4월",
	                "5월",
	                "6월",
	                "7월",
	                "8월",
	                "9월",
	                "10월",
	                "11월",
	                "12월"
	            ],
	            "firstDay": 1
	        }
		}, function(start, end, label) {
		  console.log("New date range selected: " + start.format('YYYY-MM-DD h:mm A') + ' to ' + end.format('YYYY-MM-DD h:mm A') + " (predefined range: " + label + ")");
		});
})
	  
initializeCalendar = function() {

	  
   /* initialize the calendar */
   $('#calendar').fullCalendar({
   	locale : "ko",
     header    : {
       left  : 'prev,next today',
       center: 'title',
       right : 'month,agendaWeek,agendaDay'
     },
     buttonText: {
       today: '오늘',
       month: '달 별',
       week : '주 별',
       day  : '일 별'
     },
     //Random default events
     'events'    : [],
    
     })
     
    

/* ADDING EVENTS */
   var currColor = '#3c8dbc' //Red by default
   //Color chooser button
   var colorChooser = $('#color-chooser-btn')
   $('#color-chooser > li > a').click(function (e) {
     e.preventDefault()
     //Save color
     currColor = $(this).css('color')
     //Add color effect to button
     $('#add-new-event').css({ 'background-color': currColor, 'border-color': currColor })
     $('#add-new-event').attr("value", $(this).attr("value"));
   })
   
   $('#add-new-event').click(function (e) {
     e.preventDefault()
     //Get value and make sure it is not null
     var val = $('#new-event').val()
     if (val.length == 0) {
       return
     }

     //Create events
     var event = $('<div />')
     event.css({
       'background-color': currColor,
       'border-color'    : currColor,
       'color'           : '#fff'
     }).addClass('external-event')
     event.html(val)
     $('#external-events').prepend(event)

     //Add draggable funtionality
     init_events(event)

     //Remove event from text input
     $('#new-event').val('')
   })
   
	
}
   
  
  
createEvent = function(event) {
	var title = decodeURIComponent($("#new-event").val());
	/* var startDate = parseDate($("#datepicker").val().split("-")[0].trim());
	var endDate = parseDate($("#datepicker").val().split("-")[1].trim()); */
	
	var startDate = $("#datepicker").val().split("-")[0].trim();
	var endDate = $("#datepicker").val().split("-")[1].trim();
	var target = $('input[type="radio"]:checked').val();
	var type = $('#add-new-event').attr("value");
	
	 var event = {
		  'title' : title,
		  'start' : startDate,
		  'end' : endDate,
		  'color' :  $('#add-new-event').css('background-color')
	  }

	  $.ajax({
		  url : '/schedule/insertScheduleProc.do',
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  type : "POST",
		  data : {
			  scheduleTitle : title,
			  scheduleStart : startDate,
			  scheduleEnd : endDate,
			  scheduleType : type,
			  scheduleTarget : target,
			  
		  },
		  success : function(msg) {
			 console.log(msg); 
			  $('#calendar').fullCalendar('renderEvent', event )
		  },
		  error : function(xhr, status, error) {
			  console.log(xhr);
			  console.log(status);
			  console.log(error);
		  }
	  }); 
	  
  }
  
  
 var lang = {
        months: "1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),
        monthsShort: "1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),
        weekdays: "일요일_월요일_화요일_수요일_목요일_금요일_토요일".split("_"),
        weekdaysShort: "일_월_화_수_목_금_토".split("_"),
        longDateFormat: {
            L: "YYYY.MM.DD",
            LL: "YYYY년 MMMM D일",
            LLL: "YYYY년 MMMM D일 A h시 mm분",
            LLLL: "YYYY년 MMMM D일 dddd A h시 mm분"
        },
        meridiem: {
            AM: '오전',
            am: '오전',
            PM: '오후',
            pm: '오후'
        },
        relativeTime: {
            future: "%s 후",
            past: "%s 전",
            s: "몇초",
            ss: "%d초",
            m: "일분",
            mm: "%d분",
            h: "한시간",
            hh: "%d시간",
            d: "하루",
            dd: "%d일",
            M: "한달",
            MM: "%d달",
            y: "일년",
            yy: "%d년"	        },
	        ordinal: function(number) {
	           return '일';
	       }
}
 
loadScheduleList = function() {
	 var events = [];
	 
	 	$.ajax({
	 		url : "/schedule/selectScheduleListProc.do",
	 		dataType : 'json',
	 		success : function(data) {
  				if (data.result == 'success') {
        				console.log(data);
        				
        				var list = data.schedules;
        				
        				for(var i in list) {
        					
        					var event = {
        						'title' : list[i].scheduleTitle,
        						'start' : list[i].scheduleStart,
        						'end' : list[i].scheduleEnd,
        						'color' : getColor(list[i].scheduleType)
        					};
        					
        					events.push(event)
        				}
        				
        				 $('#calendar').fullCalendar('renderEvents', events );
						
  				}
  				else {
  					console.log(data);
  				}
	 		},
	 		 error : function(xhr, status, error) {
				  console.log(xhr);
				  console.log(status);
				  console.log(error);
			  }
	 	})
}
 
 getColor = function(type) {
	 switch(type) {
	 case "1":
		 return "rgb(0, 115, 183)" // Blue
	 case "2":
		 return "rgb(221, 75, 57)" // Red
	 case "3":
		 return "rgb(17, 17, 17)"	// Black
	default:
		return "rgb(0, 115, 183)" // Blue
	 }
 }
 
 /* initialize the external events
 -----------------------------------------------------------------*/
/* function init_events(ele) {
  ele.each(function () {

    // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
    // it doesn't need to have a start or end
    var eventObject = {
      title: $.trim($(this).text()) // use the element's text as the event title
    }

    // store the Event Object in the DOM element so we can get to it later
    $(this).data('eventObject', eventObject)

    // make the event draggable using jQuery UI
    $(this).draggable({
      zIndex        : 1070,
      revert        : true, // will cause the event to go back to its
      revertDuration: 0  //  original position after the drag
    })
  
  })
}

init_events($('#external-events div.external-event'));

editable  : true,
droppable : true, // this allows things to be dropped onto the calendar !!!
drop      : function (date, allDay) { // this function is called when something is dropped

  // retrieve the dropped element's stored Event Object
  var originalEventObject = $(this).data('eventObject')

  // we need to copy it, so that multiple events don't have a reference to the same object
  var copiedEventObject = $.extend({}, originalEventObject)

  // assign it the date that was reported
  copiedEventObject.start           = date
  copiedEventObject.allDay          = allDay
  copiedEventObject.backgroundColor = $(this).css('background-color')
  copiedEventObject.borderColor     = $(this).css('border-color')

  // render the event on the calendar
  // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
  $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

  // is the "remove after drop" checkbox checked?
  if ($('#drop-remove').is(':checked')) {
    // if so, remove the element from the "Draggable Events" list
    $(this).remove()
  }

} */

</script>
</body>
</html>