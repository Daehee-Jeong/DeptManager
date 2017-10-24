<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title> 공지 </title>
<!-- Tell the browser to be responsive to screen width -->
<meta
  content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
  name="viewport">
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
  
  
  
<script type="text/javascript" src="../resources/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="../resources/bower_components/ckeditor/ckeditor.js"></script>


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

<style>

textarea{
  width: 80%;
  height: 100%;
  border: none;
  resize: none;
  overflow: hidden;
}

</style>



<body class="hold-transition skin-blue sidebar-mini">


<!-- Read More Modal -->
<div class="modal fade" id="readMoreModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-blue">
        <h4 class="modal-title">공지 자세히 보기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">

      </div>
      <div class="modal-footer">
      	<span class="time" style="float: left;"><i class="fa fa-clock-o"></i> </span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


  <div class="wrapper">
<!-- Button trigger modal -->

  

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
      
        <h1>
          				공지
        </h1>
        
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#">UI</a></li>
          <li class="active">Timeline</li>
        </ol>
      </section>
      

      

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
  <!-- Bootstrap 3.3.7 -->
  <script
    src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
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
  var scrollCount = 1; 
	var preDate = '';
	var ul;

	$(document).ready(function() {
		moment.updateLocale('ko', lang);
		
		
		$(document).on('click', 'button[name="delete"]', deleteEvent);
		$(document).on("click", ".btn-xs", readMoreEvent);
		
		loadPage();
		
		$(document).scroll(function() {
			maxHeight = $(document).height();
			currentScroll = $(window).scrollTop() + $(window).height();
			
			if (maxHeight <= currentScroll) {	
				scrollCount++;
				loadPage();
			}
		});
		

	});
	
	loadPage = function() {
  	var notice = $("#notice");
  		
  	$.ajax({
 			type : 'POST',
 			url : '/notice/selectNoticeListProc.do',
  		data : {
  				"page" : String(scrollCount),
  			},
  		dataType : 'json',
  		success : function(data) {
  			if (data.result == 'success') {
       				console.log(data);
        			
       				var list = data.mList;
        			
       				for(var i in list) {
   
       					var noticeDate = list[i].noticeDate.split(' ');
       					var date = noticeDate[0];
       					var time = noticeDate[1];
       							
        				if(date != preDate) {
        					notice.append(createTimeLine(date));
        					preDate = date;
        							
        					if(ul != undefined) ul = ul.next();
       						else ul=$("#notice").children().first();
        						}
        				
	       		  var noticeObj = {
								no : list[i].noticeNo,
								time : list[i].noticeDate,
								title : list[i].noticeTitle,
								content : list[i].noticeContent,
								target : list[i].noticeTarget,
								type : list[i].noticeType
	        		  		}
	        		  				
        			ul.append(createLabelByObj(noticeObj));
  					 
	       		  $('button[type="button"]').on("click", function(event) {
        				 event.preventDefault();
        					})
        				}
  				}
  					
  			else {
  				alert("endPage")
  				} 
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
				}
		});
	}
	

	readMoreEvent = function(event) {
		var modalDom = $(this).parent().siblings();
		var rmModal = $("#readMoreModal");
		
		var title = modalDom.filter("h3").text().trim();
		var desc = modalDom.filter("div").text().trim();
		var time = modalDom.filter("span").text().trim();
		console.log(modalDom.parent().parent().find("i").attr("class"));
		var color = modalDom.parent().parent().find("i").attr("class").split(" ")[2];
		
		var bodyString = "";
		
		bodyString += "<h3> " + title + "</h3>" + "<hr>" + desc
		rmModal.find(".modal-header").attr("class", "modal-header " + color);
		rmModal.find(".modal-body").html(bodyString);
		rmModal.find("i").html(time);
		
		rmModal.modal("show");
	}

	
	/* 
		notice Object를 이용하여 crateLabel 호출
	*/
	createLabelByObj = function(notice) {
		return createLabel(notice.no, notice.time, notice.title, notice.content, notice.type, notice.target);
	}
	
	
	/* TimeLine 소속되는 Label을 만드는 메소드
	 * Label -> 하나의 공지
	 * time -> 게시된 시:분:초
	 * type -> 공지의 분류
	 * target -> 공지대상                                 */
	createLabel = function(no, time, title, content, type, target) {
		var typeIcon;
		var targetIcon;
		 
		
		/* 1 -> 일반 메세지 모양 
		 * 2 -> 학사모 모양
		 * 3 -> 
		*/
		switch(type) {
		case '1':
			typeIcon = "fa fa-envelope bg-blue";
			break;
		case '2':
			typeIcon = "fa fa-mortar-board bg-black";
			break;
		case '3':
			typeIcon = "fa fa-warning bg-red";
			break;
		default:
			typeIcon = "fa fa-envelope bg-blue";
			break;
		} 
		
		
		 
		var str = 
		"            <!-- timeline item -->\r\n" + 
		"            <li>\r\n" + 
		"              <i class=\"" + typeIcon + "\"></i>\r\n" + 
		"\r\n" + 
		"              <div class=\"timeline-item\">\r\n" + 
		"                <span class=\"time\"><i class=\"fa fa-clock-o\"></i>  "+ calulateTime(time) + "</span>\r\n" + 
		"\r\n" + 
		"                <h3 class=\"timeline-header\">" + title + "</h3>\r\n" + 
		"\r\n" + 
		"                <div class=\"timeline-body\">\r\n" + 
		"                 " + content +   
		"                </div>\r\n" + 
		"                <div class=\"timeline-footer\">\r\n" + 
		"                  <a class=\"btn btn-primary btn-xs\">Read more</a>\r\n" + 
		"                </div>\r\n" + 
		"              </div>\r\n" + 
		"            </li>";
			
		return str;
	}
			
	createTimeLine = function(date) {
		var str = "<ul class=\"timeline\" id=\"" + date.trim() + "\">" +
				
					 "	<li class=\"time-label\">\r\n" + 
					 "     <span class=\"bg-red\">\r\n" + 
					 			date + 
					 "     </span>\r\n" + 
					 "	</li>" +
					"</ul>";
							
		return str;
	}
	
	
	calulateTime = function(time) {
		var today = moment().format('YYYY-MM-DD h:mm A');

		if(time.split(" ")[0] == today.split(" ")[0])
			return moment(time, 'YYYY-MM-DD h:mm A').fromNow();
		
		else 
			return time.split(" ")[1];
	}
	
	
	
	deleteEvent = function(event) {
		
		var no = $(this).attr("id");
					
		$.ajax({
			type : 'POST',
			url : '/notice/deleteNoticeProc.do',
			data : {
			 "noticeNo" : no
			 },
			dataType : 'json',
			success : function(data) {
				console.log(data);
		 		$("#"+no).parent().parent().parent().hide();
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
	
	
</script>
</body>
</html>
