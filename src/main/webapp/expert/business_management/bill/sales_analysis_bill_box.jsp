<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청구서 서식</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/toastr/toastr.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
<style>
	.main_table{
		width: 1150px;
		text-align: center;
		border: 1px solid black;
		border-collapse: collapse;
	}
	body{
		font-size: 14px;
	}
</style>

</head>
<body>

	<div class="container" style="max-width:1280px; max-height: 950px; margin-top: 20px;">
		<div class="row">
			<div class="col-lg-12">
				<span>별지 제9-2호서식</span>
			</div>
		</div>
		<div class="card card-outline">
			<div class="card-header">

			</div>
			<!-- card-header end -->

			<div class="card-body">
				<h4>Custom Content Below</h4>
				<ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="custom-content-below-home-tab" data-toggle="pill"
						href="#custom-content-below-home" role="tab"
						aria-controls="custom-content-below-home" aria-selected="true">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="custom-content-below-profile-tab" data-toggle="pill"
						href="#custom-content-below-profile" role="tab"
						aria-controls="custom-content-below-profile" aria-selected="false">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="custom-content-below-messages-tab" data-toggle="pill"
						href="#custom-content-below-messages" role="tab"
						aria-controls="custom-content-below-messages" aria-selected="false">Messages</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="custom-content-below-settings-tab" data-toggle="pill"
						href="#custom-content-below-settings" role="tab"
						aria-controls="custom-content-below-settings" aria-selected="false">Settings</a>
					</li>
				</ul>
				<div class="tab-content" id="custom-content-below-tabContent">
					<div class="tab-pane fade show active"
						id="custom-content-below-home" role="tabpanel"
						aria-labelledby="custom-content-below-home-tab">Lorem ipsum
						dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus
						ullamcorper dui molestie, sit amet congue quam finibus. Etiam
						ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis
						auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque
						tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque
						habitant morbi tristique senectus et netus et malesuada fames ac
						turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus
						porta, ante et varius ornare, sem enim sollicitudin eros, at
						commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor
						porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus
						pulvinar non consequat neque. Mauris lacus elit, condimentum ac
						condimentum at, semper vitae lectus. Cras lacinia erat eget sapien
						porta consectetur.</div>
					<div class="tab-pane fade" id="custom-content-below-profile"
						role="tabpanel" aria-labelledby="custom-content-below-profile-tab">
						Mauris tincidunt mi at erat gravida, eget tristique urna bibendum.
						Mauris pharetra purus ut ligula tempor, et vulputate metus
						facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
						posuere cubilia Curae; Maecenas sollicitudin, nisi a luctus
						interdum, nisl ligula placerat mi, quis posuere purus ligula eu
						lectus. Donec nunc tellus, elementum sit amet ultricies at, posuere
						nec nunc. Nunc euismod pellentesque diam.</div>
					<div class="tab-pane fade" id="custom-content-below-messages"
						role="tabpanel" aria-labelledby="custom-content-below-messages-tab">
						Morbi turpis dolor, vulputate vitae felis non, tincidunt congue
						mauris. Phasellus volutpat augue id mi placerat mollis. Vivamus
						faucibus eu massa eget condimentum. Fusce nec hendrerit sem, ac
						tristique nulla. Integer vestibulum orci odio. Cras nec augue
						ipsum. Suspendisse ut velit condimentum, mattis urna a, malesuada
						nunc. Curabitur eleifend facilisis velit finibus tristique. Nam
						vulputate, eros non luctus efficitur, ipsum odio volutpat massa,
						sit amet sollicitudin est libero sed ipsum. Nulla lacinia, ex vitae
						gravida fermentum, lectus ipsum gravida arcu, id fermentum metus
						arcu vel metus. Curabitur eget sem eu risus tincidunt eleifend ac
						ornare magna.</div>
					<div class="tab-pane fade" id="custom-content-below-settings"
						role="tabpanel" aria-labelledby="custom-content-below-settings-tab">
						Pellentesque vestibulum commodo nibh nec blandit. Maecenas neque
						magna, iaculis tempus turpis ac, ornare sodales tellus. Mauris eget
						blandit dolor. Quisque tincidunt venenatis vulputate. Morbi euismod
						molestie tristique. Vestibulum consectetur dolor a vestibulum
						pharetra. Donec interdum placerat urna nec pharetra. Etiam eget
						dapibus orci, eget aliquet urna. Nunc at consequat diam. Nunc et
						felis ut nisl commodo dignissim. In hac habitasse platea dictumst.
						Praesent imperdiet accumsan ex sit amet facilisis.</div>
				</div>
				<div class="tab-custom-content">
					<p class="lead mb-0">Custom Content goes here</p>
				</div>
				<h4 class="mt-5 ">Custom Content Above</h4>
				<ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="custom-content-above-home-tab" data-toggle="pill"
						href="#custom-content-above-home" role="tab"
						aria-controls="custom-content-above-home" aria-selected="true">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="custom-content-above-profile-tab" data-toggle="pill"
						href="#custom-content-above-profile" role="tab"
						aria-controls="custom-content-above-profile" aria-selected="false">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="custom-content-above-messages-tab" data-toggle="pill"
						href="#custom-content-above-messages" role="tab"
						aria-controls="custom-content-above-messages" aria-selected="false">Messages</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						id="custom-content-above-settings-tab" data-toggle="pill"
						href="#custom-content-above-settings" role="tab"
						aria-controls="custom-content-above-settings" aria-selected="false">Settings</a>
					</li>
				</ul>
				<div class="tab-custom-content">
					<p class="lead mb-0">Custom Content goes here</p>
				</div>
				<div class="tab-content" id="custom-content-above-tabContent">
					<div class="tab-pane fade show active"
						id="custom-content-above-home" role="tabpanel"
						aria-labelledby="custom-content-above-home-tab">Lorem ipsum
						dolor sit amet, consectetur adipiscing elit. Proin malesuada lacus
						ullamcorper dui molestie, sit amet congue quam finibus. Etiam
						ultricies nunc non magna feugiat commodo. Etiam odio magna, mollis
						auctor felis vitae, ullamcorper ornare ligula. Proin pellentesque
						tincidunt nisi, vitae ullamcorper felis aliquam id. Pellentesque
						habitant morbi tristique senectus et netus et malesuada fames ac
						turpis egestas. Proin id orci eu lectus blandit suscipit. Phasellus
						porta, ante et varius ornare, sem enim sollicitudin eros, at
						commodo leo est vitae lacus. Etiam ut porta sem. Proin porttitor
						porta nisl, id tempor risus rhoncus quis. In in quam a nibh cursus
						pulvinar non consequat neque. Mauris lacus elit, condimentum ac
						condimentum at, semper vitae lectus. Cras lacinia erat eget sapien
						porta consectetur.</div>
					<div class="tab-pane fade" id="custom-content-above-profile"
						role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
						Mauris tincidunt mi at erat gravida, eget tristique urna bibendum.
						Mauris pharetra purus ut ligula tempor, et vulputate metus
						facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
						posuere cubilia Curae; Maecenas sollicitudin, nisi a luctus
						interdum, nisl ligula placerat mi, quis posuere purus ligula eu
						lectus. Donec nunc tellus, elementum sit amet ultricies at, posuere
						nec nunc. Nunc euismod pellentesque diam.</div>
					<div class="tab-pane fade" id="custom-content-above-messages"
						role="tabpanel" aria-labelledby="custom-content-above-messages-tab">
						Morbi turpis dolor, vulputate vitae felis non, tincidunt congue
						mauris. Phasellus volutpat augue id mi placerat mollis. Vivamus
						faucibus eu massa eget condimentum. Fusce nec hendrerit sem, ac
						tristique nulla. Integer vestibulum orci odio. Cras nec augue
						ipsum. Suspendisse ut velit condimentum, mattis urna a, malesuada
						nunc. Curabitur eleifend facilisis velit finibus tristique. Nam
						vulputate, eros non luctus efficitur, ipsum odio volutpat massa,
						sit amet sollicitudin est libero sed ipsum. Nulla lacinia, ex vitae
						gravida fermentum, lectus ipsum gravida arcu, id fermentum metus
						arcu vel metus. Curabitur eget sem eu risus tincidunt eleifend ac
						ornare magna.</div>
					<div class="tab-pane fade" id="custom-content-above-settings"
						role="tabpanel" aria-labelledby="custom-content-above-settings-tab">
						Pellentesque vestibulum commodo nibh nec blandit. Maecenas neque
						magna, iaculis tempus turpis ac, ornare sodales tellus. Mauris eget
						blandit dolor. Quisque tincidunt venenatis vulputate. Morbi euismod
						molestie tristique. Vestibulum consectetur dolor a vestibulum
						pharetra. Donec interdum placerat urna nec pharetra. Etiam eget
						dapibus orci, eget aliquet urna. Nunc at consequat diam. Nunc et
						felis ut nisl commodo dignissim. In hac habitasse platea dictumst.
						Praesent imperdiet accumsan ex sit amet facilisis.</div>
				</div>
			</div>

			<div class="card-footer" style="display:none">

			</div>
			<!--end card-footer  -->

		</div>
	</div>








	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

</body>
</html>