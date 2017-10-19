<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미응답자 재송신</title>
</head>
<body>

	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
    <section class="content-header">
      <h1>
        미응답자 재요청
        <small>it all starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 메인화면</a></li>
        <li class="active">미응답 재요청</li>
      </ol>
    </section>
		<button id="btn-nonResponserSend" type="submit" class="btn btn-primary">미응답자 재송신</button>
	<section class="content">
		
	</section>
      
	</div>
      
	<script>
      
	$(document).ready(function() {
		$('#btn-nonResponserSend').click(function{
			nonResponserSend();
		});
	});
	
	// 미응답자 재송신 요청
	function nonResponserSend() {
		$.ajax({
			type : 'POST',
			url: '/quest/nonResponseProc.do',
			data : {
				"questNo" = "${}"	
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