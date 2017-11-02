<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>김조교 :: 메인화면</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> 
<script src="/resources/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="/resources/bower_components/fullcalendar/dist/locale-all.js"></script>
<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
</head>
<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				환영합니다. <small>컴퓨터공학부 학사관리시스템</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i></li>
				<li class="active">Home</li>
			</ol>
		</section>

		<!--  학부 일정 -->

		<section class="content">
		
			<div class="row">
				<div class="col-md-12">
		          <div class="box box-primary">
		          	<div class="box-header with-border">
		              <h3 class="box-title">학부일정</h3>
		            </div>
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
	        </div>
		
		</section>
		
		<!-- 설문 목록 -->
		
		<section class="content"> 
			<div class="row">
				<!-- /.col -->
		        <div class="col-md-12">
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">설문목록</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <div id="carousel-example-generic" class="carousel" data-ride="carousel">
		                <ol class="carousel-indicators">
		                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
		                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
		                </ol>
		                <div class="carousel-inner">

		                  <div class="item active" id="carousel01">
		                    <img src="/resources/dist/img/kongjuUniv01.jpg" alt="First slide">
		                    <!-- <div class="carousel-caption">
		                      First Slide
		                    </div> -->
		                  </div>
		                  <div class="item" id="carousel02">
		                    <img src="/resources/dist/img/kongjuUniv01.jpg" alt="Second slide">
		
		                   <!--  <div class="carousel-caption">
		                      Second Slide
		                    </div> -->
		                  </div>
		                  <div class="item" id="carousel03">
		                    <img src="/resources/dist/img/kongjuUniv01.jpg" alt="Third slide">
		
		                    <<!-- div class="carousel-caption">
		                      Third Slide
		                    </div> -->
		                  </div>
		                </div>
		                
		                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		                  <span class="fa fa-angle-left"></span>
		                </a>
		                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
		                  <span class="fa fa-angle-right"></span>
		                </a>
		                
		              </div>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
	        <!-- /.col -->
			</div>
		</section>
		
		
		<section class="content"> 
			<div class="row">
			
				<!-- 공지 목록 -->
		        <div class="col-md-6">
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">공지사항</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		            		<table id="noticeList" class="table table-bordered">
			                <tr>
			                  <th style="width: 50px">번호</th>
			                  <th>제목</th>
			                  <th style="width: 150px">날짜</th>
			                </tr>
			              </table>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        
				<!-- 학사 일정 목록 -->
		        <div class="col-md-6">
		          <div class="box box-solid">
		            <div class="box-header with-border">
		              <h3 class="box-title">학사일정</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		            		<table id="studentScheduleList" class="table table-bordered">
							<tr>
							    <th style="width: 50px">번호</th>
							    <th style="width: 150px">제목</th>
							    <th>날짜</th>
							</tr>
			             </table>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
	        <!-- /.col -->
			</div>
		</section>

	</div>
	<!-- /.content-wrapper -->


<!-- Page specific script -->

<script>

  $(function () {
	  
	  	// 설문목록
	  	initQuest();
	  	// 공지사항
	  	selectNotice();
	  	// 학사일
	  	selectStudentSchedule();
	  
	  /* moment locale 설정 */
	  moment.updateLocale('ko', lang);

	  initializeCalendar();
	  loadScheduleList(0, 0);
	  
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
    	 height: 500,
     //Random default events
     'events'    : [],
     'eventClick' : function(event) {
    		clickEvent(event);
    	 	$("#clickModal").modal('show');
     	}
     })
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
 
 	/* 설문 목록 조회 */
 	
 	function initQuest() {
 		$.ajax({
			type : 'POST',
			url: '/quest/selectQuestListStudentProc.do',
			data : {
				"questTo" : "${sessionScope.memberLoginBean.memberId}"
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				
				if (data.result == 'success') {
					
					$.each(data.qList, function(i, obj) {
			            
			            var str = '';
				        
				        switch(i){
					        case 0:
						        str += '<div class="carousel-caption" onclick="detailQuest('+obj.questNo+')">'+ obj.questTitle+'</div>';
								$("#carousel01").append(str);
					        	break;
					        case 1:
					        		str += '<div class="carousel-caption" onclick="detailQuest('+obj.questNo+')">'+ obj.questTitle+'</div>';
								$("#carousel02").append(str);
					        	break;
					        case 2:
					        		str += '<div class="carousel-caption" onclick="detailQuest('+obj.questNo+')">'+ obj.questTitle+'</div>';
								$("#carousel03").append(str);
					        	break;
					        default:
					        	return;
				        }
						
			        });
					
					return;
				} else {
					// 안드로이드 토스트 호출
					// alert(data.resultMsg);
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
			}
		});
 	}
 	
 	function detailQuest(questNo){
		
		$.ajax({
			type : 'POST',
			url: '/quest/isResponseProc.do',
			data : {
				"questNo" : questNo,
				"questTo" : "${sessionScope.memberLoginBean.memberId}"
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				
				if (data.result == 'success') {
					
					if(data.isResponse) {
						// 이미 응답한 경우
						location.href = "/quest/selectQuestResultForm.do?questNo="+questNo;
					}else {
						// 미응답한 경우
						location.href = "/questres/insertQuestResForm.do?questNo="+questNo;
					}
					
					return;
				} else {
					alert(data.resultMsg);
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
			}
		});
		
	}
 	
 	function selectNotice() {
 		var notice = $("#notice");
 		$.ajax({
 			type : 'POST',
 			url : '/notice/selectNoticeIndexListProc.do',
	  		dataType : 'json',
	  		success : function(data) {
	  			
				if (data.result == 'success') {
					
					$.each(data.nList, function(i, obj) {
			            
			            var str = '';
				        
				        str += '<tr>';
				        str += '<td>'+obj.noticeNo+'</td>';
				        str += '<td>'+obj.noticeTitle+'</td>';
				        str += '<td>'+obj.noticeDate+'</td>';
				        str += '</tr>';
		                
		                $("#noticeList").append(str);
						
			        });
					
					return;
				} else {
					// 안드로이드 토스트 호출
					// alert(data.resultMsg);
				}
	  		},	
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
			}
		});
	}
 	
 	function selectStudentSchedule() {
 		var notice = $("#notice");
 		$.ajax({
 			type : 'POST',
 			url : '/index/selectStudentScheculeProc.do',
	  		dataType : 'json',
	  		success : function(data) {
				if (data.result == 'success') {
					
					$.each(data.ssList, function(i, obj) {
			            
			            var str = '';
				        
				        str += '<tr>';
				        str += '<td>'+obj.sNo+'</td>';
				        str += '<td>'+obj.sDate+'</td>';
				        str += '<td>'+obj.sContent+'</td>';
				        str += '</tr>';
		                
		                $("#studentScheduleList").append(str);
						
			        });
					
					return;
				} else {
					console.log(data.resultMsg);
					// 안드로이드 토스트 호출
				}
	  		},	
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
			}
		});
	}

</script>

</body>

</html>