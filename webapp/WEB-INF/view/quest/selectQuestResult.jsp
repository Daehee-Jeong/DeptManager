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

</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		<h1>
			설문결과 조회 <small>설문 결과를 확인합니다</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Forms</a></li>
			<li class="active">Advanced Elements</li>
		</ol>
		</section>
		<section class="content">
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
	
		var renderData = [
			
		];
	
		$(document).ready(function() {
			$.ajax({
				type : 'GET',
				url: '/quest/selectQuestResultProc.do?questNo=' + '${param.questNo}',
				dataType : 'json',
				success : function(data) {
					if (data.result == 'success') {
						//console.log(data);
						
						var resList = data.resList;
						//console.log(resList);
						makeRenderData(resList);
						
					} else {
						alert(data.resultMsg);
					}
				},
				error : function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
			});
		});
		
		function makeRenderData(resList) {
			
			// 설문응답 객체 목록을 반복한다.
			$.each(resList, function(index, value) {
				
				
				// 설문응답 객체 안의 설문 내용
				var questResContent = $.parseJSON(value['questResContent']);
				//console.log(questResContent);
				
				// 설문 내용을 반복한다.
				$.each(questResContent, function(i, v) {
					console.log(v);
					
					var type = v.type; // 설문 내용 속 각 항목의 종류
					
					// 종류가 라디오일때
					if (type.indexOf("radio") >= 0) {
						var obj = {
								"name" : "",
								"type" : "",
								"text" : []
						};
						obj.type = type;
						obj.name = v.name;
						obj[v.value] = 1;
						
						var index = -1;
						// renderData 를 하나씩 돌면서
						$.each(renderData, function(idx, val) {
							if (val.type == v.type) { //renderData 각 항목의 타입명과 응답 내용의 항목이 일치하
								index = idx;
							}
							//console.log(val.type);
							//console.log(v.type);
							//console.log(index);
						});
						
						//console.log(index);
						
						// 라디오항목의 타입이 renderData 안에 존재하는지 여부
						if (index >= 0) { // 존재할 때
							//console.log(renderData[index]);
							if (renderData[index][v.value] == undefined) {
								renderData[index][v.value] = 1;
							} else {
								renderData[index][v.value]++;
							}
						} else { // 존재하지 않을 때
							renderData.push(obj);
						}
					}
					
					// 종류가 텍스트 단문일
					else if (type.indexOf("textShort") >= 0) {
						var obj = {
								"name" : "",
								"type" : "",
								"text" : []
						};
						obj.type = type;
						obj.name = v.name;
						obj.text.push(v.value);
						
						var index = -1;
						// renderData 를 하나씩 돌면서
						$.each(renderData, function(idx, val) {
							if (val.type == v.type) { //renderData 각 항목의 타입명과 응답 내용의 항목이 일치하면
								index = idx;
							}
						});
						
						if (index >= 0) { // 존재할 때
							//console.log(renderData[index]);
							renderData[index].text.push(v.value);
						} else { // 존재하지 않을 때
							renderData.push(obj);
						}
					}
					
					// 종류가 텍스트 장문일때
					/* else if (type.indexOf("textLong") >= 0) {
						obj.type = type;
						obj.name = v.name;
						obj.text.push(v.value);
						renderData.push(obj);
					} */
					
				});
				var obj = {
						"name" : "",
						"type" : "",
						"text" : []
				};
			});
			console.log(renderData);
		}
	</script>
</body>
</html>