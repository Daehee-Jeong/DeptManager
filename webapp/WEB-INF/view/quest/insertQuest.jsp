<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문지 작성</title>
</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		<h1>
			설문지 작성 <small>배포용 설문지를 제작합니다</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Forms</a></li>
			<li class="active">Advanced Elements</li>
		</ol>
		</section>
		<section class="content">

		<div class="row">
			<div class="col-md-4">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 폼 요소</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove">
								<i class="fa fa-remove"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>텍스트 (단문)</label> <input type="text" class="form-control"
										placeholder="Enter ...">
								</div>
								<button>추가</button>
								<!-- /.form-group -->

								<hr />

								<div class="form-group">
									<label>텍스트 (장문)</label>
									<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
								</div>
								<button>추가</button>
								<!-- /.form-group -->

							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">* 각 요소를 선택하면 설문지 양식에 차례대로 등록됩니다</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 정보 입력</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove">
								<i class="fa fa-remove"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>제목</label> <input type="text" class="form-control"
										placeholder="Enter ...">
								</div>
								<div class="form-group">
									<label>설명</label>
									<textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
								</div>
								<!-- /.form-group -->
							</div>
							<!-- col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- box -->

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">설문지 내용</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove">
								<i class="fa fa-remove"></i>
							</button>
						</div>
					</div>
				</div>

			</div>
		</div>
		</section>

		<section class="content">
		<div class="row">
			<button class="btn btn-default">취소</button>
			<button class="btn btn-success">완료</button>
		</div>
		</section>
	</div>
</body>
</html>