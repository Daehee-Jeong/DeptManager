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
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Forms</a></li>
			<li class="active">Advanced Elements</li>
		</ol>
		</section>
		
		<section class="content">
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