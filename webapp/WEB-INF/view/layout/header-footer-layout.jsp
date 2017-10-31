<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 태그 라이브러리는 사이트매쉬 적용 안됨-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title default="김조교" /></title>

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
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
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
<link rel="stylesheet"
	href="/resources/dist/css/skins/skin-blue.min.css">
<!-- jQuery 3 -->
	<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Slimscroll -->
	<script
		src="/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
		
	<!-- 이하는 캘린더 추가를 위한 소 -->
	<!-- jQuery UI 1.11.4 -->
	<script src="/resources/bower_components/jquery-ui/jquery-ui.min.js"></script>
	
	<!-- FastClick -->
	<script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
<!-- 캘린더 추가를 위한 스타일 코드 -->
<!-- fullCalendar -->
<link rel="stylesheet"
	href="/resources/bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="/resources/bower_components/fullcalendar/dist/fullcalendar.print.min.css"
	media="print">
	
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<decorator:head />

<!-- 자체 수정 css -->
<link rel="stylesheet"
	href="/resources/dist/css/my.css">
	
</head>
<body class="hold-transition skin-blue sidebar-mini fixed"><!-- 상단바 고정을 위해 수정 -->
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="/index.do" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>김</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>김</b>조교</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Notifications Menu -->
						<li id="btn-noti" class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning">10</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- Inner Menu: contains the notifications -->
									<ul class="menu">
										<li>
											<!-- start notification --> <a href="#"> <i
												class="fa fa-users text-aqua"></i> 5 new members joined
												today
										</a>
										</li>
										<!-- end notification -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
							</ul>
						</li>
						<!-- User Account Menu -->
						<li id="btn-user" class="dropdown user user-menu">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
										<!-- The user image in the navbar-->
										<!-- <img src="/resources/dist/img/user2-160x160.jpg"
										class="user-image" alt="User Image"> hidden-xs hides the username on small devices so only the image appears.
										<span class="hidden-xs">Alexander Pierce</span> -->
										<span class="" >${sessionScope.memberLoginBean.memberName}님</span>
									</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header">
									<c:if test="${sessionScope.memberLoginBean.memberId eq '201202002'}">
									<img src="/resources/dist/img/daehyoung.jpg" class="img-circle" alt="User Image">
									</c:if>
									<c:if test="${sessionScope.memberLoginBean.memberId eq '201202023'}">
									<img src="/resources/dist/img/daehee2.jpg" class="img-circle" alt="User Image">
									</c:if>
									<c:if test="${sessionScope.memberLoginBean.memberId eq '201202009'}">
									<img src="/resources/dist/img/jaesam.jpg" class="img-circle" alt="User Image">
									</c:if>
									<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginYes'}">
									<img src="/resources/dist/img/ic_launcher.png" class="img-circle" alt="User Image">
									</c:if>
									<p>${sessionScope.memberLoginBean.memberName}
									<small>${sessionScope.memberLoginBean.memberId}</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body"></li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="/member/updateMemberForm.do" class="btn btn-default btn-flat">회원정보 수정</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat" id="btn-logout">로그아웃</a>
									</div>
								</li>
							</ul>
						</li>
						<!-- Control Sidebar Toggle Button -->
						<li><a id="btn-setting" href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<c:if test="${sessionScope.memberLoginBean.memberId eq '201202002'}">
						<img src="/resources/dist/img/daehyoung.jpg" class="img-circle" alt="User Image">
						</c:if>
						<c:if test="${sessionScope.memberLoginBean.memberId eq '201202023'}">
						<img src="/resources/dist/img/daehee2.jpg" class="img-circle" alt="User Image">
						</c:if>
						<c:if test="${sessionScope.memberLoginBean.memberId eq '201202009'}">
						<img src="/resources/dist/img/jaesam.jpg" class="img-circle" alt="User Image">
						</c:if>
						<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginYes'}">
						<img src="/resources/dist/img/ic_launcher.png" class="img-circle" alt="User Image">
						</c:if>
					</div>
					<div class="pull-left info">
						<p>${sessionScope.memberLoginBean.memberName}</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>

				<!-- search form (Optional) -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="공지 검색하기"> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">메뉴</li>
					<!-- Optionally, you can add icons to the links -->
					<li><a onclick="document.location.replace('/index.do');"><i class="fa fa-home"></i> 
							<span>메인화면</span></a>
					</li>
					<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginYes'}">
					<li><a href="/notice/selectNoticeForm.do"><i class="fa fa-bullhorn"></i>
							<span>공지사항</span></a></li>
					</c:if>
					<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginNo'}">
					<li><a href="/notice/selectNoticeStudentForm.do"><i class="fa fa-bullhorn"></i>
							<span>공지사항</span></a></li>
					</c:if>
					<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginYes'}">		
					<li><a href="/quest/selectQuestListForm.do"><i class="fa fa-copy"></i> 
							<span>설문목록</span></a></li>
					</c:if>
					<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginNo'}">		
					<li><a href="/quest/selectQuestListStudentForm.do"><i class="fa fa-copy"></i> 
							<span>설문목록</span></a></li>
					</c:if>
					<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginYes'}">		
					<li><a href="/schedule/selectScheduleForm.do"><i class="fa fa-calendar"></i>
							<span>일정</span></a></li>
					</c:if>
					<c:if test="${sessionScope.adminLoginCheck eq 'adminLoginNo'}">		
					<li><a href="/schedule/selectScheduleStudentForm.do"><i class="fa fa-calendar"></i>
							<span>일정</span></a></li>
					</c:if>
					<li><a href="#"><i class="fa fa-bell-o"></i> 
							<span>알림</span></a></li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
		
			<!-- REQUIRED JS SCRIPTS -->

	
	<!-- Bootstrap 3.3.7 -->
	<script
		src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/adminlte.min.js"></script>

		<!-- 내용 -->
		<decorator:body />

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">Anything you want</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2016 <a href="#">Company</a>.
			</strong> All rights reserved.
		</footer>

		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->



	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->



	
	<!-- Page specific script -->
	<script>
		$(function() {
			var w = window.innerWidth;
			var h = window.innerHeight;
			
			if (w < 767) {
				$('.main-header>a').css('display', 'none');
			}
			
			/* initialize the external events
			 -----------------------------------------------------------------*/
			function init_events(ele) {
				ele.each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					}

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject)

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					})

				})
			}

			init_events($('#external-events div.external-event'))

			

			/* ADDING EVENTS */
			var currColor = '#3c8dbc' //Red by default
			//Color chooser button
			var colorChooser = $('#color-chooser-btn')
			$('#color-chooser > li > a').click(function(e) {
				e.preventDefault()
				//Save color
				currColor = $(this).css('color')
				//Add color effect to button
				$('#add-new-event').css({
					'background-color' : currColor,
					'border-color' : currColor
				})
			})
			$('#add-new-event').click(function(e) {
				e.preventDefault()
				//Get value and make sure it is not null
				var val = $('#new-event').val()
				if (val.length == 0) {
					return

				}

				//Create events
				var event = $('<div />')
				event.css({
					'background-color' : currColor,
					'border-color' : currColor,
					'color' : '#fff'
				}).addClass('external-event')
				event.html(val)
				$('#external-events').prepend(event)

				//Add draggable funtionality
				init_events(event)

				//Remove event from text input
				$('#new-event').val('')
			})
		})
		
		$(document).ready(function() {
			
			// 이하 스마트폰과의 연동을 위한 안드로이드 네이티브 함수 호출 및 jQuery Mobile 에 관련된 내용
			$('#btn-login').click(function() {
				location.href = "/member/loginMemberForm.do"
			});
			$('#btn-logout').click(function() {
				doLogout();
			});
			$('.sidebar-toggle').bind('touchstart', function(e) {
				//var event = e;
				$(this).css('background-color', '#367fa9');
				$(this).css('background', 'rgba(0,0,0,0.1)');
				$(this).css('color', '#f6f6f6');
			});
			$('.sidebar-toggle').bind('touchend', function(e) {
				//var event = e;
				$(this).css('background-color', 'transparent');
				$(this).css('background', 'none');
				$(this).css('color', '#fff');
			});
			$('.dropdown-toggle').bind('touchstart', function(e) {
				//var event = e;
				$(this).css('background', 'rgba(0,0,0,0.1)');
				$(this).css('color', '#f6f6f6');
			});
			$('.dropdown-toggle').bind('touchend', function(e) {
				//var event = e;
				$(this).css('background-color', 'transparent');
				$(this).css('background', 'none');
				$(this).css('color', '#fff');
			});	
			$('#btn-setting').bind('touchstart', function(e) {
				//var event = e;
				$(this).css('background-color', '#367fa9');
				$(this).css('background', 'rgba(0,0,0,0.1)');
				$(this).css('color', '#f6f6f6');
			});
			$('#btn-setting').bind('touchend', function(e) {
				//var event = e;
				$(this).css('background-color', 'transparent');
				$(this).css('background', 'none');
				$(this).css('color', '#fff');
				window.mJSInterface.goSetting();
			});
		});
		
		 function doBack() {
		 
			var md_display = $('#clickModal').css('display');
			var nav_display = $('body').attr('class');
			var noti_display = $('#btn-noti').attr('class');
			var user_display = $('#btn-user').attr('class');
			
			if (md_display == 'block') $('#btn-close-md').click();
			else if (nav_display.indexOf('sidebar-open') != -1) $('.sidebar-toggle').click();
			else if (noti_display.indexOf('open') != -1) $('#btn-noti').click();
			else if (user_display.indexOf('open') != -1) $('#btn-user').click();
			else if (window.location.href.indexOf('index') != -1) window.mJSInterface.doCustomBackPress();
			else window.history.back();
			
		 } // end of doBack
		
		function doLogout() {
			
			$.ajax({
				type : 'POST',
				url: '/member/logoutMemberProc.do',
				success : function(data) {
					console.log(data);
					if (data.result == 'success') {
						doLogoutAndroid(); // 서버쪽 로그아웃 처리가 완료되면 안드로이드 네이티브에서도 로그아웃 처리한다.
						location.replace("/index.do");
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
		} // end of doLogout
		
		function doLogoutAndroid() {
			try {
				window.mJSInterface.doLogOut();
			} catch (event) {
				console.log('doLogoutAndroid() - not an Android');
			}
		} // end of doLogoutAndroid
		
	</script>

</body>
</html>
