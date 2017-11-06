<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> 일정 </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <link rel="stylesheet" href="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
 <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap-select.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<!-- fullCalendar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/fullcalendar.min.js"></script>
<script src="/resources/bower_components/fullcalendar/dist/locale-all.js"></script>
<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>



</head>

<body>

<!-- Click Event Modal -->
<div class="modal fade" id="clickModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">일정 상세보기</h4>
      </div>
      <div id="modalBody" class="modal-body">
        	
      </div>
      <div class="modal-footer">
        <button id="btn-close-md" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" data-dismiss="modal" id="delete" class="btn btn-danger">일정 지우기 </button>
      </div>
    </div>
  </div>
</div>



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
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">일정 등록</h3>
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
              							<!-- Validation Alert  -->
                <div class="alert alert-warning" role="alert" style="display : none">
									<strong>경고!</strong> 제목과 내용은 빈칸일 수 없습니다!
								</div>
               	<!-- End Validation  -->
                <li><a>		
                	<select class="selectpicker" id="createSelect" data-none-selected-text="옵션을 선택하세요" multiple>
									  <optgroup label="일정 유형(한가지 선택)" name="type" data-max-options="1">
									   	<option data-icon="fa fa-envelope" value="1">일반 공지 </option> 
                			<option data-icon="fa fa-mortar-board" value="2">학사 공지 </option> 
                			<option data-icon="fa fa-warning" value="3"> 긴급 공지 </option> 
										</optgroup>
										<optgroup label="알정 대상(한가지 선택)" name="target" data-max-options="1">
											<option value="0">전체</option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</optgroup>
									</select>
								</a></li>
                						
                <li><a>
									 <div class="input-group">
			              	<div class="input-group-addon">
			                	<i class="fa fa-clock-o"></i>
			              	</div>
			              	
			              	<input type="text" id="datepicker" class="form-control"/>
			              </div>
								</a></li>
								
                <li><a><input id="new-event" type="text" class="form-control" placeholder="일정 이름"></a></li>
                <li><a><textarea id="event-desc" class="form-control" placeholder="일정 설명"></textarea></a></li>
                <li><a><button id="add-new-event" type="button" class="btn btn-primary">등록</button></a></li>
              </ul>
            </div>
          </div>
          
          <!-- Filtering  -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">선택한 일정 보기</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
              		
                <li><a>
                	<select class="selectpicker" id="filterSelect" data-none-selected-text="옵션을 선택하세요" multiple>
									  <optgroup label="일정 유형(한가지 선택)" name="type" data-max-options="1">
									  	<option data-icon="fa fa-envelope" value="0">전체 </option> 
									   	<option data-icon="fa fa-envelope" value="1">일반 공지 </option> 
                			<option data-icon="fa fa-mortar-board" value="2">학사 공지 </option> 
                			<option data-icon="fa fa-warning" value="3"> 긴급 공지 </option> 
										</optgroup>
										<optgroup label="일정 대상(한가지 선택)" name="target" data-max-options="1">
											<option value="0">전체</option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</optgroup>
									</select>
								</a></li>
                						
                <li><a><button id="filterEvent" type="button" class="btn btn-primary">선택한 일정만 보기</button></a></li>
              </ul>
            </div>
          </div>
        </div>


        <!-- Calendar -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding" style="min-height: 100px">
            	  <div class="overlay">
                <i class="fa fa-refresh fa-spin"></i>
              </div>
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


<!-- Page specific script -->
<script>
  $(function () {
	  
	  /* moment locale 설정 */
	  moment.updateLocale('ko', lang);

	  $("#add-new-event").click(createEvent);
		$("#delete").click(deleteEvent);
		$("#filterEvent").click(filterEvent);
		
		$(".selectpicker").on("show.bs.select", function(event) {
			$(this).selectpicker("deselectAll");
		})
		
		$(".selectpicker").change(function(event) {
			if($(this).val().length == 2) $(this).selectpicker("toggle");
		})
		
	  initializeCalendar();
	  loadScheduleList("0", "0");
	  
	  $('#calendar').fullCalendar('rerenderEvents');
	  $('.overlay').remove();
	  
	  /* datepicker 로딩 */
	  $('#datepicker').daterangepicker({
		    "timePicker": true,
		    "timePickerIncrement": 30,
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

clickEvent = function(event) {
	console.log(event.id);
	
	$.ajax({
		url : '/schedule/selectScheduleProc.do',
		data : {
			scheduleNo : event.id
		},
		success : function(msg) {
			var modalType = "";
			
			switch(msg.schedule.scheduleType) {
			case "1":
				modalType = 'modal-header bg-blue';
				break;
			case "2":
				modalType = 'modal-header bg-black';
				break;
			case "3":
				modalType = 'modal-header bg-red';
				break;
			default:
				modalType = 'modal-header bg-blue';
				break;
			}
			
			$(".modal-header").attr("class", modalType);
			
			var body = "";
			body += 'title : ' + msg.schedule.scheduleTitle;
			body += '<br>startDate : ' + msg.schedule.scheduleStart;
			body += '<br>endDate : ' + msg.schedule.scheduleEnd;
			body += '<br>desc : ' + msg.schedule.scheduleDesc;
			
			$("#modalBody").html(body);
			$("#delete").attr("value", msg.schedule.scheduleNo);
		}
	})
}
  
deleteEvent = function(event) {
	console.log(event);
	
	var no = $(this).attr("value");
	
	$.ajax({
		url : '/schedule/deleteScheduleProc.do',
		data : {
			scheduleNo : no
		},
		success : function(msg) {
			console.log(msg);
			$('#calendar').fullCalendar('removeEvents', no);
			$("#clickModal").hide();
		},
		error : function(xhr, status, error) {
			  console.log(xhr);
			  console.log(status);
			  console.log(error);
		  }
	})
}
	  
initializeCalendar = function() {

   /* initialize the calendar */
   $('#calendar').fullCalendar({
   	locale : "ko",
     header    : {
       left  : 'prev,next today',
       center: 'title',
       right : 'month'
     },
     buttonText: {
       today: '오늘',
       month: '달 별',
       week : '주 별',
       day  : '일 별'
     },
     //Random default events
     'events'    : [],
     'eventClick' : function(event) {
    		clickEvent(event);
    	 	$("#clickModal").modal('show');
     	}
     })
}
  
createEvent = function(event) {

	var title = $("#new-event").val();
	var startDate = $("#datepicker").val().split("-")[0].trim();
	var endDate = $("#datepicker").val().split("-")[1].trim();
	var target = $("#createSelect").val()[1];
	var type = $("#createSelect").val()[0];
	var desc = $("#event-desc").val();
	
	if(title.trim() == "" || desc.trim() == "") {
		$( ".alert" ).toggle(800)
		
		setTimeout(function() {
			$( ".alert" ).toggle(800);
			},2000)
			
		return;
	}
	
	
	if(target == undefined) target = 0;
	if(type == undefined) type = 1;

	$("#new-event").val("");
	$("#event-desc").val("");

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
			  scheduleDesc : desc
		  },
		  
		  success : function(msg) {
				console.log(msg);
				
				var event = {
					'id' : msg.scheduleNo,
				  'title' : title,
				  'start' : startDate,
				  'end' : endDate,
				  'color' :  getColor(type)
				 }
				
				console.log(event);
				
			  $('#calendar').fullCalendar('addEventSource', [event])
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
 
loadScheduleList = function(type, target) {
	 var events = [];
	 
	 	$.ajax({
	 		url : "/schedule/selectScheduleListProc.do",
	 		dataType : 'json',
	 		data : {
	 			scheduleType : type,
	 			scheduleTarget : target
	 		},
	 		success : function(data) {
  				if (data.result == 'success') {
        				console.log(data);
        				
        				var list = data.schedules;
        				
        				for(var i in list) {
        					
        					var event = {
        						'id' : list[i].scheduleNo,
        						'title' : list[i].scheduleTitle,
        						'start' : list[i].scheduleStart,
        						'end' : list[i].scheduleEnd,
        						'color' : getColor(list[i].scheduleType)
        							};
        					
        					events.push(event)
        						}
        				
        				$('#calendar').fullCalendar('removeEvents');
        				$('#calendar').fullCalendar('addEventSource', events );
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
		 return "rgb(17, 17, 17)"	// Black
	 case "3":
		 return "rgb(221, 75, 57)" // Red
	default:
		return "rgb(0, 115, 183)" // Blue
	 }
 }
 
filterEvent = function(event) {
	var type = $("#filterSelect").val()[0];
	var target = $("#filterSelect").val()[1];
	
	loadScheduleList(type, target);
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