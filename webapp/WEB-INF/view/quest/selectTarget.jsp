<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>설문지 작성</title>
</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		<h1>
			설문 배포대상 설정 <small>배포대상을 설정합니다 (엑셀파일 사용)</small>
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
						<h3 class="box-title">명단 등록</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="exampleInputFile">파일 업로드</label> <input type="file"
										id="exampleInputFile">
									<br/>
									<p class="help-block">(예시)</p>
									<img src="/resources/dist/img/xlsx-example.png" width="100%">
								</div>
								<!-- /.form-group -->
							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer" id='zz'>* 예시와 동일 형식의 엑셀파일을 등록해주세요</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 내용</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body" id='div-table'>
						
					</div>
					<!-- /.box-body -->
				</div>

			</div>
		</div>
		</section>

		<section class="content">
		<div class="row">
			<button class="btn btn-default">취소</button>
			<button class="btn btn-success" id='btn-complete'>완료</button>
		</div>
		</section>
	</div>
	<div class="modal fade" id="modal-default" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<!-- SheetJS 사용을 위한 import -->
	<script src="/resources/dist/js/jszip.js"></script>
	<script src="/resources/dist/js/shim.js"></script>
	<script src="/resources/dist/js/xlsx.js"></script>
	<!-- DataTables -->
	<script src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script>
		var memberIds = [];
	
		$(document).ready(function() {
			/* var w = window.innerWidth;
			var h = window.innerHeight;
			
			if (w < 767) {
				window.mJSInterface.setSmile('안녕? -> w: ' + w + ', h: ' + h);
				$('.main-header>a').css('display', 'none');
			} */
			
			/* try {
                window.mJSInterface.setSmile('안녕? -> w: ' + w + ', h: ' + h);
            } catch(event) {
                console.log(event);
            } */
			
			
			$('#btn-complete').click(function(){
				
				$.ajax({
					type : 'POST',
					url: '/quest/insertQuestProc.do',
					data : {
						"memberIds" : JSON.stringify(memberIds),
						"questTitle" : '${questBean.questTitle}',
						"questStart" : '${questBean.questStart}',
						"questEnd" : '${questBean.questEnd}',
						"questContent" : '${questBean.questContent}',
						"questDesc" : '${questBean.questDesc}'
					},
					dataType : 'json',
					success : function(data) {
						console.log(data);
						if (data.result == 'success') {
							alert(data.resultMsg);
							location.replace('/quest/selectQuestListForm.do');
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
				 
			});
			
			$('#exampleInputFile').on('change', function(evt) {
				// IE10, 11은 readAsBinaryString 지원을 안함. 따라서 체크함.
				var rABS = typeof FileReader !== "undefined" && typeof FileReader.prototype !== "undefined" && typeof FileReader.prototype.readAsBinaryString !== "undefined";
				var file = evt.target.files[0]; // files 를 사용하면 파일의 정보를 알 수 있음
				// file 은 배열이므로 file[0] 으로 접근해야 함

				console.log('로그');
				console.log(file);
				console.log('파일사이즈 : ' + file.size);

				if (file.size > 1024 * 1024 * 5) {
					// 큰 파일을 올리니까 브라우저가 다운되었음 -_-;;
					/*alert('5MB 이상의 파일은 업로드 할 수 없습니다.');*/
					$('.modal-title').text('파일 업로드 에러');
					$('.modal-body p').text('5MB 이상의 파일은 업로드 할 수 없습니다');
					$('#modal-default').modal();
					
					$('#exampleInputFile').val('');
					return;
				} else {
					console.log('파일 용량 OK');
				}
				if (file.type.indexOf('sheet') < 0) { // 선택한 파일이 이미지인지 확인
					/*alert('이미지 파일만 선택하세요.');*/
					$('.modal-title').text('파일 업로드 에러');
					$('.modal-body p').text('엑셀 파일만 업로드 가능합니다.');
					$('#modal-default').modal();
					
					$('#exampleInputFile').val('');
					return;
				} else {
					console.log('파일 형식 OK');
				}
				
				var data = null;
			    if (typeof file == "undefined") {
					alert("파일 선택 시 오류 발생!!");
			        return;
			    }
			    var reader = new FileReader();

				reader.onload = function(e) {
					var data = e.target.result;

					/* 엑셀 바이너리 읽기 */					
					var workbook;

					if(rABS) { // 일반적인 바이너리 지원하는 경우
						workbook = XLSX.read(data, {type: 'binary'});
					} else { // IE 10, 11인 경우
						var arr = fixdata(data);
						workbook = XLSX.read(btoa(arr), {type: 'base64'});
					}

					var jsonObj = process_wb(workbook);
					
					//console.log(JSON.stringify(jsonObj));
					
					var sortedKeys = Object.keys(jsonObj);
					//console.log(sortedKeys);
					var firstKey = sortedKeys[0];
					
					var dataArray = jsonObj[firstKey];
					console.log(JSON.stringify(dataArray));
					
					//console.log(JSON.stringify(jsonObj.Sheet1, 2, 2));
					
					//createAUIGrid( jsonObj[Object.keys(jsonObj)[0]] );
					
					renderData(dataArray);
				};

				if(rABS) reader.readAsBinaryString(file);
				else reader.readAsArrayBuffer(file);
			});
		});
		
		// IE10, 11는 바이너리스트링 못읽기 때문에 ArrayBuffer 처리 하기 위함.
		function fixdata(data) {
			var o = "", l = 0, w = 10240;
			for(; l<data.byteLength/w; ++l) o+=String.fromCharCode.apply(null,new Uint8Array(data.slice(l*w,l*w+w)));
			o+=String.fromCharCode.apply(null, new Uint8Array(data.slice(l*w)));
			return o;
		};

		// 파싱된 시트의 CDATA 제거 후 반환.
		function process_wb(wb) {
			var output = "";
			output = JSON.stringify(to_json(wb));
			output = output.replace( /<!\[CDATA\[(.*?)\]\]>/g, '$1' );
			return JSON.parse(output);
		};
		
		// 엑셀 시트를 파싱하여 반환
		function to_json(workbook) {
			var result = {};
			workbook.SheetNames.forEach(function(sheetName) {
				var roa = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
				if(roa.length > 0){
					result[sheetName] = roa;
				}
			});
			return result;
		}
		
		function renderData(jsonObj) {
			
			memberIds = [];
			
			var str = '';
			str += '<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">';
			str += '<div class="row">';
			str += '<div class="col-sm-12">';
			str += '<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">';
            str += '<thead>';
            str += '<tr role="row">';
            str += '<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending">학번</th>';
            str += '<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column descending" aria-sort="ascending">이름</th>'
            str += '</tr>';
            str += '</thead>';
            str += '<tbody>';
            
            $.each(jsonObj, function(index, value) {
            	
				var firstKey = Object.keys(value)[0];
				var secondKey = Object.keys(value)[1];
				
				memberIds.push(value[firstKey]);
            	
            		if (index == 0) {
            			str += '<tr role="row" class="odd">';
        	            str += '<td class="" width="50%">' + value[firstKey] + '</td>';
        	            str += '<td class="sorting_1" width="50%">' + value[secondKey] + '</td>';
        	            str += '</tr>';
            		} else {
            			if (index%2 == 0) {
            				str += '<tr role="row" class="odd">';
            				str += '<td class="" width="50%">' + value[firstKey] + '</td>';
            	            str += '<td class="sorting_1" width="50%">' + value[secondKey] + '</td>';
            	            str += '</tr>';
            			} else if (index%2 == 1) {
            				str += '<tr role="row" class="even">';
            				str += '<td class="" width="50%">' + value[firstKey] + '</td>';
            	            str += '<td class="sorting_1" width="50%">' + value[secondKey] + '</td>';
            	            str += '</tr>';
            			}
            		}
            });
            str += '</tbody>';
            str += '<table>';
            str += '</div></div></div>';
			
            $('#div-table').append(str);
            
            $('#example2').DataTable({
            	'paging'      : true,
                'lengthChange': false,
                'searching'   : false,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : false
            });
            
            console.log(JSON.stringify(memberIds));
		}
	</script>
</body>
</html>