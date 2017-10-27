<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문지 리스트</title>
</head>
<body>
	
	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
    <section class="content-header">
      <h1>
        설문지 목록
        <small>미응답한 설문에 응답해주세요.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 메인화면</a></li>
        <li class="active">설문목록</li>
      </ol>
    </section>
	
	<section class="content"></section>
    
	</div>
    
	<script>
      	
		var lastQuestNo = 0;
		
		$(document).ready(function() {
			selectList();
		});
      	
		// 최초 페이지 로드시 설문지 리스트 10건 조회
		function selectList() {
			$.ajax({
				type : 'POST',
				url: '/quest/selectQuestListStudentProc.do',
				data : {
					"questTo" : "${sessionScope.memberLoginBean.memberId}"
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					
					if (data.result == 'success') {
						
						$.each(data.qList, function(i, obj) {
				            
				            var str = '';
							str += '<div class="box" onclick="detailQuest('+obj.questNo+')"><div class="box-header with-border"><h3 class="box-title">'+ obj.questTitle+'</h3></div>';
					        str += '<div class="box-body">'+ obj.questType +'</div>';
					        str += '<div class="box-footer">'+ obj.questStart +'</div></div>';
							$(".content").append(str);
							
							lastQuestNo = obj.questNo;
							
				        });
						
						return;
					} else {
						// 안드로이드 토스트 호출
						// alert(data.resultMsg);
					}
				},
				error : function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
			});
		}
      
		$(window).scroll(function() {
		 	if ($(window).scrollTop() >= $(document).height() - $(window).height()){
		 		selectListScrollDown();
		 	}
		});
		
		// 스크롤 다운 시 설문지 리스트 조회
		function selectListScrollDown() {
			$.ajax({
				type : 'POST',
				url: '/quest/selectQuestListStudentScrollDownProc.do',
				data : {
					"questNo" : lastQuestNo,
					"questTo" : "${sessionScope.memberLoginBean.memberId}"
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					
					if (data.result == 'success') {
						
						$.each(data.qList, function(i, obj) {
				            
				            var str = '';
							str += '<div class="box" onclick="detailQuest('+obj.questNo+')"><div class="box-header with-border"><h3 class="box-title">'+ obj.questTitle+'</h3></div>';
					        str += '<div class="box-body">'+ obj.questDesc +'</div>';
					        str += '<div class="box-footer">'+ obj.questStart +'</div></div>';
							$(".content").append(str);
							
							lastQuestNo = obj.questNo;
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
		}
		
		function detailQuest(questNo){
			
			$.ajax({
				type : 'POST',
				url: '/quest/isResponseProc.do',
				data : {
					"questNo" : questNo,
					"questTo" : "${sessionScope.memberLoginBean.memberId}"
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					
					if (data.result == 'success') {
						
						if(data.isResponse) {
							// 이미 응답한 경우
							location.href = "/quest/selectQuestResultForm.do?questNo="+questNo;
						}else {
							// 미응답한 경우
							location.href = "/questres/insertQuestResForm.do?questNo="+questNo;
						}
						
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