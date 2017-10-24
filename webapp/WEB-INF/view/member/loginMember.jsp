<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>김조교::: 로그인 페이지</title>
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
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="/member/loginMemberForm.do"><b>로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg"></p>

			<form method="post">
				<div class="form-group has-feedback">
					<input id="memberId" type="text" class="form-control"
						placeholder="학번"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input id="memberPw" type="password" class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck"> 
							<label> <input type="checkbox" id="mycheck">&nbsp;&nbsp;자동 로그인
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button id="btn-login" type="button" class="btn btn-primary btn-block btn-flat">로그인</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<a href="/member/findMemberForm.do">비밀번호를 잃어버렸습니다</a><br> 
			<a href="/member/insertMemberForm.do" class="text-center">회원이 아니신가요?</a>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 3 -->
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/resources/plugins/iCheck/icheck.min.js"></script>
<script>
  	var isAutoLogin = false;
  	
	$(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-blue',
			radioClass : 'iradio_square-blue',
			increaseArea : '20%' // optional
		});

		// 로그인 버튼 이벤트
		// 이벤트 함수 레디 함수 안으로 이동.
		$("#btn-login").click(function() {
			
			// 안드로이드 : 자동로그인 선택시 네이티브앱의 함수 호출을 통해 앱의 변수내 저장한다.
			// 이후 로그인이 성공할 시, 네이티브 앱에서 해당 변수를 SharedPreference 내부에 저장한다.
			if (isAutoLogin) {
				try {
					window.mJSInterface.setLoginInfo($('#memberId').val(), $('#memberPw').val());
				} catch (event) {
					console.log('안드로이드 아니므로 네이티브 함수 호출 에러');
				}
			}

			if ($('#memberPw').val() == '' || $('#memberPw').val() == null) {
				alert("비밀번호를 입력해주세요.");
				return;
			}

			$.ajax({
				type : 'POST',
				url : '/member/loginMemberProc.do',
				data : {
					"memberId" : $('#memberId').val(),
					"memberPw" : $('#memberPw').val()
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.result == 'success') {
						location.replace("/index.do");
					} else {
						alert(data.resultMsg);
					}
				},
				error : function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : "
							+ status + ", error : " + error);
				}
			});
		});
		
		$('#mycheck').on('ifChecked', function () {
			isAutoLogin = true;
		});
	}); // end of jQuery Ready

	function onCheckChanged() {
		console.log('changed');
		//window.mJSInterface.setSmile("click");
		
		try {
			window.mJSInterface.setAutoLogin($('#memberId').val(), $('#memberPw').val());
		} catch (event) {
			window.mJSInterface.setSmile("에러");
			console.log(event);
		}
	}
</script>
</body>
</html>
