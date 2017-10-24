<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>김조교 :: 자동로그인</title>

</head>
<body>
	<div class="content-wrapper"></div>
	<script>
		$(document).ready(function() {
			window.mJSInterface.setSmile('ok');
			
			var id = ${param.memberId};
			var pw = ${param.memberPw};
			
			window.mJSInterface.setSmile('id == ' + id);
			
			console.log('id == ' + id);
			console.log('pw == ' + pw);
			
			$.ajax({
				type : 'POST',
				url: '/member/loginMemberProc.do',
				data : {
					"memberId" : id,
					"memberPw" : pw
				},
				dataType : 'json',
				success : function(data) {
					if (data.result == 'success') {
						location.replace('/index.do');
					} else {
						location.replace('/member/loginMemberForm.do');
					}
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		});
	</script>
</body>
</html>