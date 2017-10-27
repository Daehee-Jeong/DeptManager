<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>설문지 작성</title>
</head>
<body>
	<div class="content-wrapper" style="min-height: 900px;">
		<section class="content-header">
		<h1>
			설문 제출 <small>설문 응답을 작성하고 제출합니다</small>
		</h1>
		</section>
		
		<section class="content">
			<div class="row">
			<div id="div-hidden" style="display: none;"></div>
			<div class="col-md-12" id="div-quest">
			</div>
			<div class="row" style="text-align:center;">
				<button class="btn btn-default">취소</button>
				<button class="btn btn-success" id='btn-complete'>완료</button>
			</div>
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
	
	<script>
	
		var questionArray = [];
	
		$(document).ready(function() {
			
			console.log("param: " + "${param.questNo}");
			$.ajax({
				type : 'POST',
				url: '/quest/selectQuestProc.do',
				data : {
					"questNo" : "${param.questNo}"
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.result == 'success') {
						
						var str = '';
						var divHidden = $('#div-hidden');
						$(divHidden).append(data.qBean.questContent);
						var divHiddenChild = $(divHidden).children();
						
						str += '<div class="box box-info"><div class="box-header with-border"><h3 class="box-title">';
						str += data.qBean.questTitle;
						str += '</h3></div><div class="box-body"><div class="row"><div class="col-md-12"><form><h5><small>';
						str += data.qBean.questDesc;
						str += '</small></h5>';
						
						$.each(divHiddenChild, function(index, value) {
							var divBox = $(divHiddenChild).get(index);
							var divBoxBody = $(divBox).children().get(1);
							var row = $(divBoxBody).children().get(0);
							var questContent = $(row).children();
							var formGroup = $(questContent).children().get(0);
							var formGroupArr = $(formGroup).children();
							//console.log(formGroupArr);
								
							$.each(formGroupArr, function(index, value) {
								var ele = $(value).get(0);
								var tagName = $(ele).get(0).tagName;
								var cName = $(ele).attr('class');
							    if (tagName == 'DIV') {
									var div = $(ele).get(0);
									var eleInDiv = $(div).children().get(0);
									var eleTagName = $(eleInDiv).get(0).tagName;
									var cName = $(eleInDiv).attr('class');
									
									if (eleTagName == 'INPUT') {
										var input = $($(eleInDiv).get(0)).get(0);
										//console.log(input.value);
										questionArray.push(input.value);
										//console.log('name : ' + $(input).attr('name'));
										str += '<br/><label>';
										str += input.value;
										
										str += '</label>';
							        } else if (eleTagName == 'LABEL') {
							        		var label = $($(eleInDiv).get(0)).get(0);
							        		var labelChild = $(label).children();
							        		console.log(labelChild);
							        		
							        		$.each(labelChild, function(index, value) {
							        			var child = $(labelChild).get(index);
							        			var type = $(child).attr('type');
							        			var name = $(child).attr('name');
							        			if (type == 'radio') {
							        				var textRadio = $($(labelChild).next()).val();
							        				//console.log(textRadio);
							        				str += '<div class="radio"><label><input type="radio" name="' + name + '" id="optionsRadios1" value="' + textRadio + '" checked="">';
							        				str += textRadio;
							        				str += '</label></div>';
							        			} else if (type == 'checkbox') {
							        				var checkboxName = $($(labelChild).get(0)).attr('name');
							        				console.log('checkboxName');
							        				console.log(checkboxName);
							        				var textCheck = $($(labelChild).next()).val();
							        				//console.log(textCheck);
							        				str += '<div class="check"><label><input type="checkbox" name="' + checkboxName + '">';
							        				str += textCheck;
							        				str += '</label></div>';
							        			}
							        		});
							        }
							    } else if (tagName == 'INPUT') {
									var input = $(value).get(0);
									var placeholder = $(input).attr('placeholder');
									
									var inputForName = $($($(input).parent()).children().get(1)).children().get(0);
									var inputName = $(inputForName).attr('name');
									//console.log('inputForName');
									//console.log(inputName);
									
									if (placeholder == '답변') {
										str += '<input type="text" class="form-control" placeholder="Enter ..." name="' + inputName + '">';
									}
						        } else if (tagName == 'TEXTAREA') {
						        		var ta = $(value).get(0);
						        		var taForName = $($($(ta).parent()).children().get(1)).children().get(0);
									var taName = $(taForName).attr('name');
									console.log('taName : ' + taName);
						        		str += '<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요..." name="' + taName + '"></textarea>';
						        } else if (tagName == 'SELECT') {
						        		var select = $(value).get(0);
									var selectChild = $(select).children();
									str += '<br/><select>';
									$.each(selectChild, function(index, value) {
										var option = $(selectChild).get(index);
										var optText = $(option).text();
										str += '<option>' + optText + '</option>';
									});
									str += '</select><br/>';
						        }
							}); // inner each
						}); // outer each
						
						str += '</form></div></div></br><div class="box-footer">* 설문작성 완료 후 제출버튼을 눌러주세요</div></div>';
						console.log(str);
						
						var divQuest = $('#div-quest');
						divQuest.append(str);
						
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
			
			
			$('#btn-complete').click(function() {
				var formData = $('form').serializeArray();
				formData.splice(0,1); // name 값이 q 인녀석을 제거해야함.. 0번인덱스에 있음 
				console.log(formData);
				var jsonData = formToJson(formData);
				console.log(JSON.stringify(jsonData));
				
				$.ajax({
					type : 'POST',
					url: '/questres/insertQuestResProc.do',
					data : {
						'questResQuest' : ${param.questNo},
						'questResMember' : ${sessionScope.memberLoginBean.memberId},
						'questResContent' : JSON.stringify(jsonData)
					},
					dataType : 'json',
					success : function(data) {
						console.log(data);
						if (data.result == 'success') {
							// alert 관련 안내요소는	하이브리드 앱에서 모두 처리 해야함
							location.replace('/quest/selectQuestListStudentForm.do');
							//alert(data.resultMsg);
						} else {
							//alert(data.resultMsg);
						}
					},
					error : function(xhr, status, error) {
						console.log(xhr);
						alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
					}
				});
			});
		});
		
		function formToJson(formData) {
			var jsonData = [];
			
			$.each(formData, function(i, v) {
				//console.log(v);
				var obj = {
					"name" : "",
					"type" : "",
					"value" : ""
				};
				obj.name = questionArray[i];
				obj.type = v.name;
				obj.value = v.value;
				
				jsonData.push(obj);
			});

		    /* $.map(formData, function(n, i){
		    		jsonData[n['name']] = n['value'];
		    }); */
		    
		    return jsonData;
		}
	</script>
</body>
</html>