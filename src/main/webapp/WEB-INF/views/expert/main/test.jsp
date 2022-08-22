<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card card-primary card-tabs">
		<div class="card-header p-0 pt-1">
			<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
				<li class="pt-2 px-3"><h3 class="card-title">Card Title</h3></li>
				<li class="nav-item"><a class="nav-link active"
					id="custom-tabs-two-home-tab" data-toggle="pill"
					href="#custom-tabs-two-home" role="tab"
					aria-controls="custom-tabs-two-home" aria-selected="true">한달</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-profile-tab" data-toggle="pill"
					href="#custom-tabs-two-profile" role="tab"
					aria-controls="custom-tabs-two-profile" aria-selected="false">일주일</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-messages-tab" data-toggle="pill"
					href="#custom-tabs-two-messages" role="tab"
					aria-controls="custom-tabs-two-messages" aria-selected="false">어제</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					id="custom-tabs-two-settings-tab" data-toggle="pill"
					href="#custom-tabs-two-settings" role="tab"
					aria-controls="custom-tabs-two-settings" aria-selected="false">오늘</a>
				</li>
			</ul>
		</div>
		<div class="card-body">
			<div class="tab-content" id="custom-tabs-two-tabContent">
				<div class="tab-pane fade show active" id="custom-tabs-two-home" role="tabpanel" aria-labelledby="custom-tabs-two-home-tab">
					1</div>
				<div class="tab-pane fade" id="custom-tabs-two-profile" role="tabpanel" aria-labelledby="custom-tabs-two-profile-tab">
					2</div>
				<div class="tab-pane fade" id="custom-tabs-two-messages" role="tabpanel" aria-labelledby="custom-tabs-two-messages-tab">
					3</div>
				<div class="tab-pane fade" id="custom-tabs-two-settings" role="tabpanel" aria-labelledby="custom-tabs-two-settings-tab">
					4</div>
			</div>
		</div>
	</div>
</body>
</html>