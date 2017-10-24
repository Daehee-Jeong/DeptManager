<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
  content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
  name="viewport">
<title> </title>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap-select.min.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/bower_components/font-awesome/css/font-awesome.min.css">

<!-- Ionicons -->
<link rel="stylesheet" href="/resources/bower_components/Ionicons/css/ionicons.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">

<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">

<!-- Date Picker  -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="/resources/bower_components/select-picker-master/dist/picker.css">
<link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap-switch.css">
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

  

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
      
        <h1>
          				공지 작성
        </h1>
        
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#">UI</a></li>
          <li class="active">Timeline</li>
        </ol>
      </section>
      
      <!-- < Modal  
      <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-default">
                			공지 작성
      </button> -->
      		
     <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">

            <!-- Validation Alert  -->
                <div class="alert alert-warning" role="alert" style="display : none">
									<strong>경고!</strong> 제목과 내용은 빈칸일 수 없습니다!
								</div>
               	<!-- End Validation  -->
               
               <div class="form-inline">
                   <input type="text" id="title" style="width:30%" class="form-control col-md-3" placeholder="공지 이름입력" required>
                   	<input type="hidden" value="0">
												<div style="text-align: right">                   
	                   <input type="checkbox" name="my-checkbox" data-label-text="일정과 함께 등록하기"  data-label-width="140">
	                		<input type="text" id="datepicker" class="form-control" style="width:30%; display:none"/>
                		</div>
                </div>
        </div>
        <div class="box-body">
           <textarea name="contents" id="contents" style="width: 90%; height: 700px;"></textarea></p>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <select id="type" name="sel1" class="selectpicker1" data-style="btn-info">
                     <option selected data-content="<span class='glyphicon glyphicon-envelope'></span>" value="1">일반</option>
                      <option data-content="<span class='glyphicon glyphicon-warning-sign'></span>" value="2">학사</option>
                      <option data-content="<span class='glyphicon glyphicon-education'></span>" value="3">긴급</option>
                    </select>
                    
                    <select id="target" name="sel2" class="selectpicker1" data-style="btn-primary">
                      <option selected value="0">전체</option>
                      <option value="1">1학년</option>
                      <option value="2">2학년</option>
                      <option value="3">3학년</option>
                      <option value="4">4학년</option>
                      <option value="5">대학원</option>
                     </select>
                <button id="create-btn" type="button" data-dismiss="modal" class="btn btn-primary">공지 등록</button>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

      <!-- Main content -->
      <section class="content">

        <!-- row -->
        <div class="row">
          <div class="col-md-12" id="notice">
       
            
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->

       </section>
      <!-- /.content -->
              
              <!-- /.box-body -->
   </div>
            <!-- /.box -->
  </div>
          <!-- /.col -->
      

   
    <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->
  
  
  


<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="../resources/bower_components/ckeditor/ckeditor.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>

<script src="/resources/bower_components/moment/moment.js"></script>
<script src="/resources/bower_components/moment/locale/ko.js"></script> 
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<script type="text/javascript" src="/resources/bower_components/bootstrap/js/bootstrap-select.js"></script>
<script type="text/javascript" src="/resources/bower_components/select-picker-master/dist/picker.min.js"></script>
<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="/resources/bower_components/bootstrap/js/bootstrap-switch.js"></script>
  
<script>

$(document).ready(function() {
	$(".selectpicker1").picker();
	moment.updateLocale('ko', lang);
	
	$("[name='my-checkbox']").bootstrapSwitch();
	$('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function(event, state) {
		 $( "#datepicker" ).toggle(800);
   	});
	
	$("#create-btn").click(createButtonEvent); 
	
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
	
	
	CKEDITOR.replace(
			'contents',
			{
				uiColor: '#9AB8F3',
				filebrowserUploadUrl : '/notice/imageUpload.do',
				resize_enabled : false, // 에디터 크기를 조절하지 않음,
				removePlugins : "elementspath", // DOM 출력하지 않음
	});
});

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

createButtonEvent = function() {
	
	if($("#title").val().length < 1) {
		$( ".alert" ).toggle(800);
		
		setTimeout(function() {
			$( ".alert" ).toggle(800);
			},2000)
		
		return false;
	}
	
	if(CKEDITOR.instances.contents.getData().trim().length < 1) {
		$( ".alert" ).toggle(800);
		
		setTimeout(function() {
			$( ".alert" ).toggle(800);
			},2000)

		
		return false;
	}
	
	var state = $('input[name="my-checkbox"]').bootstrapSwitch('state');
	if(state) insertSchedule();
		
	insertNotice();
	
}
	
	
insertNotice = function() {
	$.ajax({
  	type : 'POST',
  	url : '/notice/insertNoticeProc.do',
  	data : {
  		"noticeTitle" : $("#title").val(),
  		"noticeContent" : CKEDITOR.instances.contents.getData(),
  		"noticeType" : $("#type").val(),
  		"noticeTarget" : $("#target").val()
  		},
  	dataType : 'json',
  	success : function(data) {
  		if (data.result == 'success') {
        alert("공지 등록에 성공했습니다.")
  			
				$(location).attr('href', "/notice/selectNoticeForm.do");
  			}	
		},
		error : function(xhr, status, error) {
			console.log(xhr);
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		}
	}); 
}

insertSchedule = function() {
	var title = $("#title").val();
	var startDate = $("#datepicker").val().split("-")[0].trim();
	var endDate = $("#datepicker").val().split("-")[1].trim();
	var target = $("#target").val();
	var type = $("#type").val();
	var desc = CKEDITOR.instances.contents.getData();

	if(target == undefined) target = 0;
	if(type == undefined) type = 1;
	
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
		  },
		  error : function(xhr, status, error) {
			  console.log(xhr);
			  console.log(status);
			  console.log(error);
		  }
	  }); 
}

</script> 
</body>
</html>

 