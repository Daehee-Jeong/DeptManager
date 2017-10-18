<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

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
<link rel="stylesheet"
  href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet"
  href="/resources/bower_components/bootstrap/dist/css/bootstrap-select.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
  href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
  href="/resources/dist/css/skins/_all-skins.min.css">
  
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
  <div class="wrapper">

  

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
      
        <h1>
          Timeline <small>example</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#">UI</a></li>
          <li class="active">Timeline</li>
        </ol>
      </section>
      
      <!--  Modal  -->
      <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
                Launch Default Modal
      </button>
      
       <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                   
               
                  <h4> 공지 등록 </h4>
                  
        
                  <div class="form-inline">
                  <div class="input-group" style="padding:10px;"> 
                   
                    
                    <select id="type" name="sel1" class="selectpicker" data-style="btn-info">
                     <option selected data-content="<span class='glyphicon glyphicon-envelope'></span>" value="1">일반</option>
                      <option data-content="<span class='glyphicon glyphicon-warning-sign'></span>" value="2">학사</option>
                      <option data-content="<span class='glyphicon glyphicon-education'></span>" value="3">긴급</option>
                    </select>
                    
                    <select id="target" name="sel2" class="selectpicker" data-style="btn-primary">
                      <option selected value="0">전체</option>
                      <option value="1">1학년</option>
                      <option value="2">2학년</option>
                      <option value="3">3학년</option>
                      <option value="4">4학년</option>
                      <option value="5">대학원</option>
                     </select>
                     <!-- HTML to write -->

                     
                   <input type="text" id="title" title="제목이 빈칸일 수 없습니다." class="form-control col-md-7" placeholder="공지 이름입력" required>
                    
                    </div>
                </div>
      
              </div>
              <div class="modal-body">
                <p id="tootlip-contents" title="내용이 빈칸일 수 없습니다."> <textarea name="contents" id="contents" style="width: 90%; height: 700px;"></textarea></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button id="create-btn" type="button" data-dismiss="modal" class="btn btn-primary">Save changes</button>
                
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

     

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
  <!-- AdminLTE App -->
  <script src="/resources/dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="/resources/dist/js/demo.js"></script>
<script type="text/javascript" src="../resources/bower_components/bootstrap/js/bootstrap-select.js"></script>
  <script type="text/javascript">
   var scrollCount = 1; 
	var preDate = '';
	var ul;
	
	
	$(document).ready(function() {
		$(".selectpicker").selectpicker();
		CKEDITOR.replace(
				'contents',
				{
					'filebrowserUploadUrl' : '${contextPath}/notice/imageUpload.do'
				});
		
		$("#create-btn").click(createButtonEvent);
	
		loadPage();
		
		console.log($('.timeline-footer').child);
		
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
		console.log(scrollCount);
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
        						
        					ul.append(createLabel(list[i].noticeNo, time, list[i].noticeTitle, list[i].noticeContent, list[i].noticeType, list[i].noticeTarget));
        				
        					$('button[type="button"]').on("click", function(event) {
        						 event.preventDefault();
        						 console.log(event);
        					})
        				}
        				
        				$('button[name="delete"]').click(function(event) {
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
        				})
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
			typeIcon = "fa fa-warning bg-red";
			break;
		case '3':
			typeIcon = "fa fa-mortar-board bg-black";
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
		"                <span class=\"time\"><i class=\"fa fa-clock-o\"></i>"+ time.split(".")[0] + "</span>\r\n" + 
		"\r\n" + 
		"                <h3 class=\"timeline-header\">" + title + "</h3>\r\n" + 
		"\r\n" + 
		"                <div class=\"timeline-body\">\r\n" + 
		"                 " + content +   
		"                </div>\r\n" + 
		"                <div class=\"timeline-footer\">\r\n" + 
		"                  <a class=\"btn btn-primary btn-xs\">Read more</a>\r\n" + 
		"                  <button tpye=\"button\" id=\""+no+"\" name=\"delete\" class=\"btn btn-danger btn-xs\">Delete</button>\r\n" + 
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
	
	createButtonEvent = function() {
		if($("#title").val().length < 1) {
			$("#title").tooltip('show');
			
			setTimeout(function() {
				$("#title").tooltip('destroy');
				},2000)
			
			return false;
		}
		
		if(CKEDITOR.instances.contents.getData().trim().length < 1) {
			$("#tootlip-contents").tooltip("show");
			
			setTimeout(function() {
				$("#tootlip-contents").tooltip('destroy');
				},2000)

			
			return false;
		}
		
		console.log( $("#target").val());
		console.log( $("#type").val()); 
		
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
        				console.log(data);
        				var today = moment().format("YYYY-MM-DD");
        				
        				if($("#"+today) == undefined) {
        					createTimeLine(today);
        				}
        				
        				
        				$(createLabel("방금", $("#title").val(), CKEDITOR.instances.contents.getData(), $("#type").val(), $("#target").val())).insertAfter("#"+today+ " li:nth-child(1)");
        				
        				$("#title").val("");
        				CKEDITOR.instances.contents.setData("");
        				$('select[name=sel1]').val(1);
        				$('select[name=sel2]').val(0);
        				$('.selectpicker').selectpicker('refresh')
        				
        				
        				
        				/* var list = data.mList;
        				
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
        						
        					console.log($("#notice").children().first());
        					ul.append(createLabel(time, list[i].noticeTitle, list[i].noticeContent, list[i].noticeType, list[i].noticeTarget)); */
        				
  				}	
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
				}
		});
	}
		
	deleteBtnEvent = function(event) {
		console.log("event");
		console.log(this);
	}
</script>
</body>
</html>
