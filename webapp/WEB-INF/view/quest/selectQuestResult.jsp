<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<!-- DataTable JS -->
<!-- DataTables -->
<script src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- ChartJS -->
<script src="/resources/bower_components/chart.js/Chart.js"></script>

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
		<div class="row">
			<div class="col-md-4">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">설문 응답률</h3>
						<span class="badge bg-red">55%</span>
					</div>
					<div class="box-body">
						<div class="progress progress-xs">
							<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
						</div>
						<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginYes'}">	
						<button id="btn-nonResponserSend" type="button" class="btn btn-block btn-primary btn-xs">미응답자 재알림</button>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-md-8" id="div-box-list"></div>
		</div>
		</section>

	</div>
	<script>
	
		var renderData = [
			
		];
		
		var colorList = [
			'#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'
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
			
			$('#btn-nonResponserSend').click(function (){
				nonResponserSend();
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
						obj['text'][v.value] = 1;
						
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
							if (renderData[index]['text'][v.value] == undefined) {
								renderData[index]['text'][v.value] = 1;
							} else {
								renderData[index]['text'][v.value]++;
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
			doRender(renderData);
		} // end of makeRenderData
		
		function doRender(renderData) {
			$.each(renderData, function(index, value) {
				if (value.type.indexOf("radio") >= 0) {
					var str = '';
					str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">';
					str += value.name;
					str += '</h3></div><div class="box-body">';
					str += '<canvas id="' + value.type + '"></canvas>'
					str += '</div></div></div></div>';
					$('#div-box-list').append(str);
					
					var cvs = $('#' + value.type);
					
					drawPie(value.text, cvs);
				}
				else if (value.type.indexOf("textShort") >= 0) {
					var str = '';
					str += '<div class="box box-default"><div class="box-header with-border"><h3 class="box-title">';
					str += value.name;
					str += '</h3></div><div class="box-body">';
					str += '<div id="' + value.type + '"></div'
					str += '</div></div></div></div>';
					$('#div-box-list').append(str);
					
					var div = $('#' + value.type);
					
					drawTable(value.text, div);
				}
				else if (value.type.indexOf("textLong") >= 0) {
					
				}
			});
		}
		
		function drawPie(data, cvs) {
			console.log('pieData');
			console.log(data);
			
			//-------------
		    //- PIE CHART -
		    //-------------
		    // Get context with jQuery - using jQuery's .get() method.
		    var pieChartCanvas = $(cvs).get(0).getContext('2d');
		    var pieChart       = new Chart(pieChartCanvas)
			
			var PieData = [];
			
		    var keys = Object.keys(data);
			$.each(keys, function(index, key) {
				var obj = {
					value : data[key],
					color : colorList[index],
					label : key
				};
				PieData.push(obj);
			});

			var pieOptions     = {
		      //Boolean - Whether we should show a stroke on each segment
		      segmentShowStroke    : true,
		      //String - The colour of each segment stroke
		      segmentStrokeColor   : '#fff',
		      //Number - The width of each segment stroke
		      segmentStrokeWidth   : 2,
		      //Number - The percentage of the chart that we cut out of the middle
		      percentageInnerCutout: 50, // This is 0 for Pie charts
		      //Number - Amount of animation steps
		      animationSteps       : 100,
		      //String - Animation easing effect
		      animationEasing      : 'easeOutBounce',
		      //Boolean - Whether we animate the rotation of the Doughnut
		      animateRotate        : true,
		      //Boolean - Whether we animate scaling the Doughnut from the centre
		      animateScale         : false,
		      //Boolean - whether to make the chart responsive to window resizing
		      responsive           : true,
		      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
		      maintainAspectRatio  : true,
		      //String - A legend template
		      legendTemplate       : ''
		    }
		    //Create pie or douhnut chart
		    // You can switch between pie and douhnut using the method below.
		    pieChart.Doughnut(PieData, pieOptions);
		} // end of doRender
		
		function drawTable(data, div) {
			var str = '';
			str += '<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">';
            str += '<thead>';
            str += '<tr role="row">';
            str += '<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending">번호</th>';
            str += '<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column descending" aria-sort="ascending">내용</th>'
            str += '</tr>';
            str += '</thead>';
            str += '<tbody>';
            
            $.each(data, function(index, value) {
	            	if (index == 0) {
	        			str += '<tr role="row" class="odd">';
	    	            str += '<td class="" width="15%">' + (index+1) + '</td>';
	    	            str += '<td class="sorting_1" width="85%">' + value + '</td>';
	    	            str += '</tr>';
	        		} else {
	        			if (index%2 == 0) {
	        				str += '<tr role="row" class="odd">';
	        				str += '<td class="" width="15%">' + (index+1) + '</td>';
		    	            str += '<td class="sorting_1" width="85%">' + value + '</td>';
	        	            str += '</tr>';
	        			} else if (index%2 == 1) {
	        				str += '<tr role="row" class="even">';
	        				str += '<td class="" width="15%">' + (index+1) + '</td>';
		    	            str += '<td class="sorting_1" width="85%">' + value + '</td>';
	        	            str += '</tr>';
        				}
        			}
            });
            
            str += '</tbody>';
            str += '<table>';
            
			$(div).append(str);
            
            $('#example2').DataTable({
            		'paging'      : true,
                'lengthChange': false,
                'searching'   : false,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : false
            });
		} // end of drawTable
		
		// 미응답자 재송신 요청
		function nonResponserSend() {
			$.ajax({
				type : 'POST',
				url: '/quest/nonResponseProc.do',
				data : {
					"questNo" : "${param.questNo}"	
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					
					if (data.result == 'success') {
						
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
	</script>
</body>
</html>