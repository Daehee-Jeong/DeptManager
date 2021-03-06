<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문지 작성</title>

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

<script src="/resources/bower_components/moment/min/moment.min.js"></script>

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
									<textarea class="form-control" rows="3" style="max-width : 100%;" placeholder="Enter ..." disabled></textarea>
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
									<label>설명</label> <textarea class="form-control" rows="3" id="questDesc" placeholder="설명을 입력하세요."></textarea>
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
							<div class="col-md-12" id="quest-content"><!-- 설문지 내용 삽입 공간 --></div>
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
	<script src="/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script src="/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- fullCalendar -->
	
	<script
		src="/resources/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<script>
		
		var textShortCnt = 1;
		var textLongCnt = 1;
		var radioCnt = 1; // radio 버튼 name 속성 카운트
		var checkCnt = 1; // checkBox name 속성 카운트
		var listCnt = 1;
	
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
			
			var arr = $(element).parent().find('.inputRadio');
			var tag = $(arr).get(0);
			var nameValue = $(tag).attr('name');
			
			console.log(nameValue);
			
			var str = '<div class="radio"><label><input type="radio" name="'+nameValue+'" class="inputRadio" id="" value="" disabled><input id="radio" type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doRadioDelete(this)"></i></div>';
			$(element).parent().find('.form-group').append(str);
		}
		
		function doRadioDelete(element) {
			$(element).parent().remove();
		}
		
		function doCheckAdd(element) {
			
			var arr = $(element).parent().find('.inputCheck');
			var tag = $(arr).get(0);
			var nameValue = $(tag).attr('name');
			
			var str = '<div class="checkbox"><label><input type="checkbox" name="'+nameValue+'" class="inputCheck" id="" value="" disabled><input id="check" type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doCheckDelete(this)"></i></div>';
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
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" name="'+'textShortTitle'+textShortCnt+'" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<input type="text" class="form-control" placeholder="답변" disabled> </div>';
				str += '</div></div></div></div>';
				$('#quest-content').append(str);
				
				textShortCnt++;
				break;
			case 1:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">텍스트 장문형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" name="'+'textLongTitle'+textLongCnt+'" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<textarea class="form-control" rows="3" placeholder="자세한 답변" style="max-width : 100%;" disabled></textarea></div>';
				str += '</div></div></div></div>';
				$('#quest-content').append(str);
				
				textLongCnt++;
				break;
			case 2:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">단일 선택형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" name="'+'radioTitle'+radioCnt+'" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<div class="radio"><label><input type="radio" name="'+'radio'+radioCnt+'" class="inputRadio" id="" value="" disabled><input id="radio" type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label></div>';
				str += '<div class="radio"><label><input type="radio" name="'+'radio'+radioCnt+'" class="inputRadio" id="" value="" disabled><input id="radio" type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doRadioDelete(this)"></i></div>';
				str += '</div><i class="fa fa-plus-square-o" onclick="doRadioAdd(this)"></i>';
				str += '</div></div></div>';
				$('#quest-content').append(str);
				
				radioCnt++;
				break;
			case 3:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">복수 선택형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" name="'+'checkTitle'+checkCnt+'" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<div class="checkbox"><label><input type="checkbox" name="'+'check'+checkCnt+'" class="inputCheck" id="" value="" disabled><input id="check" type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label></div>';
				str += '<div class="checkbox"><label><input type="checkbox" name="'+'check'+checkCnt+'" class="inputCheck" id="" value="" disabled><input id="check" type="text" class="form-control" placeholder="항목" onchange="setValue(this)"></label><i class="fa fa-fw fa-remove" onclick="doCheckDelete(this)"></i></div>';
				str += '</div><i class="fa fa-plus-square-o" onclick="doCheckAdd(this)"></i>';
				str += '</div></div></div>';
				$('#quest-content').append(str);
				
				checkCnt++;
				break;
			case 4:
				var str = '';
				str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">목록 선택형</h3>';
				str += '<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" onclick="doDelete(this)"><i class="fa fa-remove"></i></button>';
				str += '</div></div>';
				str += '<div class="box-body"><div class="row">';
				str += '<div class="col-md-12" id="quest-content">';
				str += '<div class="form-group">';
				str += '<label class="col-sm-2 control-label">항목 제목</label><div class="col-sm-10"><input type="text" name="'+'listTitle'+listCnt+'" class="form-control" placeholder="제목을 입력해주세요." onchange="setValue(this)"></div><br><br>';
				str += '<select class="form-control"></select>';
              	str += '<input type="text" class="form-control" id="input-list" placeholder="추가할 항목을 입력해주세요."><i class="fa fa-plus-square-o" onclick="doListAdd(this)">';
				str += '</div></div></div></div>';
				$('#quest-content').append(str);
				
				listCnt++;
				break;
			}
			
		}
		
		function setValue(element) {
			var x = $(element).val();
			$(element).attr('value', x);
			
			var type = $(element).attr('id');
			if(type == 'radio') {
				var arr = $(element).parent().find('.inputRadio');
				$(arr).val(x);
			} else if (type == 'checkbox') {
				var arr = $(element).parent().find('.inputCheck');
				$(arr).val(x);
			}
		}
		
		/* 다음 페이지 이동 (설문지 설정화면) */
		function doNext() {
			
			if($("#questTitle").val()==null || $("#questTitle").val()=='' || $("#questTitle").val()==' '){
				alert("설문지 제목을 입력해주세요.");
				return;
			}
			if($("#questDesc").val()==null || $("#questDesc").val()=='' || $("#questDesc").val()==' '){
				alert("설문지 설명을 입력해주세요.");
				return;
			}
			if($("#quest-content").html()==null || $("#quest-content").html()=='' ){
				alert("설문지 내용을 작성해주세요.");
				return;
			}
			
			var datetime = $("#reservationtime").val()
			var startDate = datetime.substring(6,10)+"-"+datetime.substring(0,2)+"-"+datetime.substring(3,5)+" 12:00:00";
			var endDate = datetime.substring(19,23)+"-"+datetime.substring(13,15)+"-"+datetime.substring(16,18)+" 12:00:00";
			
			var form = document.createElement('form');
        		var objs1;
			objs1 = document.createElement('input');
		    objs1.setAttribute('type', 'hidden');
		    objs1.setAttribute('name', 'questTitle');
		    objs1.setAttribute('value', $("#questTitle").val());
			form.appendChild(objs1);
			var objs2;
			objs2 = document.createElement('input');
			objs2.setAttribute('type', 'hidden');
		    objs2.setAttribute('name', 'questStart');
		    objs2.setAttribute('value', startDate);
			form.appendChild(objs2);
			var objs3;
			objs3 = document.createElement('input');
			objs3.setAttribute('type', 'hidden');
		    objs3.setAttribute('name', 'questEnd');
		    objs3.setAttribute('value', endDate);
			form.appendChild(objs3);
			var objs4;
			objs4 = document.createElement('input');
			objs4.setAttribute('type', 'hidden');
		    objs4.setAttribute('name', 'questContent');
		    objs4.setAttribute('value', $("#quest-content").html());
			form.appendChild(objs4);
			var objs5;
			objs5 = document.createElement('input');
			objs5.setAttribute('type', 'hidden');
		    objs5.setAttribute('name', 'questDesc');
		    objs5.setAttribute('value', $("#questDesc").val());
			form.appendChild(objs5);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "/quest/selectTargetForm.do");
			document.body.appendChild(form);
			form.submit();

		};//end function
	</script>
</body>
</html>