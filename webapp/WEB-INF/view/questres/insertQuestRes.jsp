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
			<div class="col-md-12" id="div-quest">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 폼 요소</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<form>
									<div class="form-group has-feedback">
										<div class="form-group has-feedback">
											<label>전공엠티 참석여부 조사</label>
											<input type="text" class="form-control" placeholder="Enter ...">
										</div>
									</div>
								</form>
							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">* 설문작성 완료 후 제출버튼을 눌러주세요</div>
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
	
	<script>
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
						var divQuest = $('#div-quest');
						var divBox = $(divQuest).children().get(0);
						var divBoxBody = $(divBox).children().get(1);
						var row = $(divBoxBody).children().get(0);
						var questContent = $(row).children();
						var formGroup = $(questContent).children().get(0);
						var formGroupArr = $(formGroup).children();
						
						var str = '';
						
						$.each(formGroupArr, function(index, value) {
							var ele = $(value).get(0);
							var tagName = $(ele).get(0).tagName;
						    if (tagName == 'DIV') {
								var div = $(ele).get(0);
								var eleInDiv = $(div).children().get(0);
								var eleTagName = $(eleInDiv).get(0).tagName;
								
								if (eleTagName == 'INPUT') {
									var input = $($(eleInDiv).get(0)).get(0);
									console.log(input.value);
						        }
						    }
						});
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