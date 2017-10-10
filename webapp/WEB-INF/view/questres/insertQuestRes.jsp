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
			설문 제출 <small>설문 응답을 작성하고 제출합니다</small>
		</h1>
		</section>
		
		<section class="content">
			<div class="row">
			<div id="div-hidden" style="display: none;"></div>
			<div class="col-md-12" id="div-quest">
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
	
	<script>
		$(document).ready(function() {
			
			/* <div class="form-group has-feedback">
			
			<div class="form-group has-feedback">
				<label>전공엠티 불참 여부가 무엇이라고 생각하십니까?</label>
				<input type="text" class="form-control" placeholder="Enter ...">
			</div>
			<div class="form-group">
				<label>금번 전공엠티에 참석하시겠습니까?</label>
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios1" value="option1" checked="">
						네
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios2" value="option2">
						아니오
					</label>
				</div>
			</div>
		</div> */
			
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
						str += data.qBean.questType;
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
							        			if (type == 'radio') {
							        				var textRadio = $($(labelChild).next()).val();
							        				//console.log(textRadio);
							        				str += '<div class="radio"><label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">';
							        				str += textRadio;
							        				str += '</label></div>';
							        			} else if (type == 'checkbox') {
							        				console.log('check');
							        				var textCheck = $($(labelChild).next()).val();
							        				//console.log(textCheck);
							        				str += '<div class="check"><label><input type="checkbox">';
							        				str += textCheck;
							        				str += '</label></div>';
							        			}
							        		});
							        }
							    } else if (tagName == 'INPUT') {
									var input = $(value).get(0);
									var placeholder = $(input).attr('placeholder');
									if (placeholder == '답변') {
										str += '<input type="text" class="form-control" placeholder="Enter ...">';
									}
						        } else if (tagName == 'TEXTAREA') {
						        		str += '<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요..."></textarea>';
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
		});
	</script>
</body>
</html>