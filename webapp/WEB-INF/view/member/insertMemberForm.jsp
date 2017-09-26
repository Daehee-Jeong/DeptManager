<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원등록</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/plugins/iCheck/square/blue.css">

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
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="../../index2.html"><b>Admin</b>LTE</a>
		</div>

		<div class="register-box-body">
			<p id="reg-ment" class="login-box-msg">공주대 학생 인증을 통해 쉽게 가입하세요</p>

			<div class="form-group">
				<label> <input type="radio" name="r1" class="minimal special"
					checked>&nbsp;&nbsp;포털 계정 인증
				</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
					type="radio" name="r1" class="minimal special">&nbsp;&nbsp;도서관 계정
					인증
				</label>
			</div>

			<form action="" method="post">
				<div class="form-group has-feedback">
					<input id="input-auth-id" type="text" class="form-control"
						placeholder="학번"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input id="input-auth-pw" type="password" class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
			</form>
			<button id="btn-auth" type="button" class="btn btn-block btn-default">인증하기</button>

			<hr />

			<form id="member-form" method="post">
				<div class="form-group has-feedback">
					<input name="memberName" id="input-data-name" type="text"
						class="form-control" placeholder="이름"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					성별 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>
						<input name="memberGen" type="radio" name="r1" class="minimal" value="남" checked> 남
					</label>
					&nbsp;&nbsp;&nbsp;
					<label>
						<input name="memberGen" type="radio" name="r1" class="minimal" value="여"> 여
					</label>
				</div>
				<input id="input-data-state" name="memberState" type="hidden" >
				<input id="input-data-id" name="memberId" type="hidden" >
				<div class="form-group has-feedback">
					<input name="memberDept" id="input-data-dept" type="text"
						class="form-control" placeholder="전공"> <span
						class="glyphicon glyphicon-education form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input name="memberHp" id="input-data-hp" type="text"
						class="form-control" placeholder="전화번호"> <span
						class="glyphicon glyphicon-earphone form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input name="memberEmail" id="input-data-email" type="email"
						class="form-control" placeholder="이메일"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input name="memberAddr" id="input-data-addr" type="text"
						class="form-control" placeholder="주소"> <span
						class="glyphicon glyphicon-home form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input name="memberPw" id="input-data-pw" type="password"
						class="form-control" placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input id="input-data-pw2" type="password" class="form-control"
						placeholder="비밀번호 재입력"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" class="special">&nbsp;&nbsp;<a href="#">약관</a>
								에 동의합니다
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button id="btn-submit" type="button" class="btn btn-primary btn-block btn-flat">회원가입</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<div class="modal fade" id="modal-default">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Default Modal</h4>
				</div>
				<div class="modal-body">
					<p>One fine body&hellip;</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- jQuery 3 -->
	<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$('input.special').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('#btn-auth').click(function() {
				doAuth();
			});
			$('#btn-submit').click(function() {
				doSubmit();
			});
		});

		function doAuth() {
			var formData = new FormData();

			formData.append('memberId', $('#input-auth-id').val());
			formData.append('memberPw', $('#input-auth-pw').val());
			
			console.log(formData.get('memberId'));
			console.log(formData.get('memberPw'));

			$.ajax({
				type : 'POST',
				url: '/member/authMemberProc.do',
				data : {
					"memberId" : $('#input-auth-id').val(),
					"memberPw" : $('#input-auth-pw').val()
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.result == 'success') {
						$('#btn-auth').attr('class', 'btn btn-block btn-success disabled');
						$('#btn-auth').text('인증 완료');
						$('#btn-auth').attr('disabled', 'disabled');
						$('#input-auth-id').attr('disabled', 'disabled');
						$('#input-auth-pw').attr('disabled', 'disabled');
						$('#reg-ment').html('<div class="has-success"><label class="control-label" for="inputSuccess"><i class="fa fa-check"></i> 인증에 성공하였습니다.</label></div>');
						
						$('#input-data-name').val(data.aBean.name);
						$('#input-data-dept').val(data.aBean.deptName);
						$('#input-data-hp').val(data.aBean.mobilePhoneNo);
						$('#input-data-email').val(data.aBean.email);
						$('#input-data-state').val(data.aBean.state);
						$('#input-data-addr').val(data.aBean.addr);
						$('#input-data-id').val($('#input-auth-id').val());
						
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
		
		function doSubmit() {
			
			console.log('doSubmit');
			
			var param = $('#member-form').serialize();
			console.log(param);
			
			$.ajax({
				type : 'POST',
				url: '/member/insertMemberProc.do',
				data : param,
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
