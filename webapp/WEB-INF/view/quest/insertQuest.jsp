<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문지 작성</title>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- daterange picker -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="/resources/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet" href="/resources/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet" href="/resources/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="/resources/bower_components/select2/dist/css/select2.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
     folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">

</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		<h1>
			설문지 작성 <small>배포용 설문지를 제작합니다</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Forms</a></li>
			<li class="active">Advanced Elements</li>
		</ol>
		</section>
		<section class="content">

		<div class="row">
			<div class="col-md-4">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 폼 요소</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group has-feedback">
									<i class="fa fa-fw fa-font"></i> <label>텍스트 단문형</label> <input
										type="text" class="form-control" placeholder="Enter ..." disabled>
								</div>
								<button id="btn-short-text">추가</button>
								<!-- /.form-group -->

								<hr />

								<div class="form-group has-feedback">
									<i class="fa fa-fw fa-file-text-o"></i> <label>텍스트 장문형</label>
									<textarea class="form-control" rows="3" placeholder="Enter ..." disabled></textarea>
								</div>
								<button id="btn-long-text">추가</button>
								<!-- /.form-group -->

								<hr />

								<div class="form-group has-feedback">
									<i class="fa fa-fw fa-dot-circle-o"></i> <label>단일 선택형</label>&nbsp;&nbsp;
								</div>
								<button id="btn-radio">추가</button>
								<!-- /.form-group -->

								<hr />

								<div class="form-group has-feedback">
									<i class="fa fa-fw fa-check-square-o"></i> <label>복수 선택형</label>&nbsp;&nbsp;
								</div>
								<button id="btn-checkbox">추가</button>
								<!-- /.form-group -->

								<hr />

								<div class="form-group has-feedback">
									<i class="fa fa-fw fa-th-list"></i> <label>목록 선택형</label>
								</div>
								<button id="btn-list">추가</button>
								<!-- /.form-group -->

							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">* 각 요소를 선택하면 설문지 양식에 차례대로 등록됩니다</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="box box-danger">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 정보 입력</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label>제목</label> <input type="text" class="form-control" id="questTitle" placeholder="제목을 입력하세요.">
								</div>

								<div class="form-group">
									<label>설명</label> <textarea class="form-control" rows="3" id="questType" placeholder="설명을 입력하세요."></textarea>
								</div>

								<!-- Date and time range -->
								<div class="form-group">
									<label>설문기간</label>

									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-clock-o"></i>
										</div>
										<input type="text" class="form-control pull-right" id="reservationtime">
									</div>
									<!-- /.input group -->
								</div>
								<!-- /.form-group -->

							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- box -->
				
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 내용</h3>
					</div>
					
					<div class="box-body">
						<div class="row">
							<div class="col-md-12" id="quest-content">
								<!-- 설문지 내용 삽입 공간 -->
							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
				</div>

			</div>
			
		</div>
		</section>

		<section class="content">
		<div class="row">
			<button class="btn btn-default">취소</button>
			<button class="btn btn-success" id="btn-success">다음</button>
		</div>
		</section>
	</div>
	<!-- date-range-picker -->
	<script src="/resources/bower_components/moment/min/moment.min.js"></script>
	<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script src="/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- SlimScroll -->
	<script src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/dist/js/demo.js"></script>
	<script>
		$(function() {
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			})
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						startDate : moment().subtract(29, 'days'),
						endDate : moment()
					},
					function(start, end) {
						$('#daterange-btn span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'))
					})

			//Date picker
			$('#datepicker').datepicker({
				autoclose : true
			})

		})
		
		$(document).ready(function() {
			$('#btn-short-text').click(function() {
				doAdd(0);
			});
			$('#btn-long-text').click(function() {
				doAdd(1);
			});
			$('#btn-radio').click(function() {
				doAdd(2);
			});
			$('#btn-checkbox').click(function() {
				doAdd(3);
			});
			$('#btn-list').click(function() {
				doAdd(4);
			});
			$('#btn-success').click(function() {
				doNext();
			});
		});
		
		function doRadioAdd(element) {
			var str = '<div class="radio"><label><input type="radio" id="" value="" disabled><input type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doRadioDelete(this)"></i></div>';
			$(element).parent().find('.form-group').append(str);
		}
		
		function doRadioDelete(element) {
			$(element).parent().remove();
		}
		
		function doCheckAdd(element) {
			var str = '<div class="checkbox"><label><input type="checkbox" id="" value="" disabled><input type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doCheckDelete(this)"></i></div>';
			$(element).parent().find('.form-group').append(str);
		}
		
		function doCheckDelete(element) {
			$(element).parent().remove();
		}
		
		function doListAdd(element) {
			var option = $(element).parent().find("#input-list").val();
			
			if(option == '' || option == ' ' || option == null){
				return;
			}
			
			var str = '<option>'+option+'</option>';
			$(element).parent().find('.form-control').append(str);
			$(element).parent().find("#input-list").empty();
		}
		
		function doDelete(element) {
			var formDiv = $(element).parent().parent().parent();
			$(formDiv).slideUp({
				complete: function(){
					formDiv.remove();
				}
			});
		}
		
		function doAdd(num) {
			switch(num) {
			
			case 0:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">텍스트 단문형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<input type="text" class="form-control" placeholder="답변" disabled> </div>';
				str += '</div></div></div></div>';
				$('#quest-content').append(str);
				break;
			case 1:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">텍스트 장문형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<textarea class="form-control" rows="3" placeholder="자세한 답변" disabled></textarea></div>';
				str += '</div></div></div></div>';
				$('#quest-content').append(str);
				break;
			case 2:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">단일 선택형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<div class="radio"><label><input type="radio" id="" value="" disabled><input type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label></div>';
				str += '<div class="radio"><label><input type="radio" id="" value="" disabled><input type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doRadioDelete(this)"></i></div>';
				str += '</div><i class="fa fa-plus-square-o" onclick="doRadioAdd(this)"></i>';
				str += '</div></div></div>';
				$('#quest-content').append(str);
				break;
			case 3:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">복수 선택형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<div class="checkbox"><label><input type="checkbox" id="" value="" disabled><input type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label></div>';
				str += '<div class="checkbox"><label><input type="checkbox" id="" value="" disabled><input type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doCheckDelete(this)"></i></div>';
				str += '</div><i class="fa fa-plus-square-o" onclick="doCheckAdd(this)"></i>';
				str += '</div></div></div>';
				$('#quest-content').append(str);
				break;
			case 4:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">목록 선택형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<select class="form-control"></select>';
              	str += '<input type="text" class="form-control" id="input-list" placeholder="추가할 항목을 입력해주세요."><i class="fa fa-plus-square-o" onclick="doListAdd(this)">';
				str += '</div></div></div></div>';
				$('#quest-content').append(str);
				break;
			}
			
		}
		
		function setValue(element) {
			var x = $(element).val();
			$(element).attr('value', x);
		}
		
		/* 다음 페이지 이동 (설문지 설정화면) */
		function doNext() {
			
			$.ajax({
                url: '/quest/insertQuestProc.do',
                data: {
                		"questTitle" : $("#questTitle").val(),
                		"questEnd" : $("#reservationtime").val(),
                		"questContent" : $("#quest-content").html(),
                		"questType" :  $("#questType").val()
                		
                },
                type: 'POST',
                dataType: "json",
                success: function(data){
                	if(data.result == "ok") {
                		//화면이동 처리
						return;
					} else {
						alert(data.resultMsg);
						return;
					}
                },//success
                	error: function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
            });

		};//end function
	</script>
</body>
</html>