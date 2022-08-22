<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<head>
<style type="text/css">

.button-div {
  position: absolute;
  left: 415px;
  top: 317px;
  width: 37px;
  height: 50px;
  background: #f8f9fa;
  z-index: 2;
}

.button-open {
  width: 0px;
  height: 0px;
  border-top: 10px solid transparent;
  border-right: 20px solid #1b8bf1;
  border-bottom: 10px solid transparent;
  margin: 15px 6px;
  z-index: 2;
}

.button-close {
  width: 0px;
  height: 0px;
  border-top: 10px solid transparent;
  border-left: 20px solid #1b8bf1;
  border-bottom: 10px solid transparent;
  margin: 15px 6px;
  z-index: 2;
}

li{
	list-style: disc;
}

.table td, .table th{
	padding: 10px;
}

.pb7{
	padding-bottom: 7px;
}

.pb9{
	padding-bottom: 9px;
}
.positionButton{
	z-index: 1;
    position: absolute;
    top: 712px;
    left: 420px;
    height: 41px;
    border-radius: 24px;
    width: 176px;
    background-color: #0363d0;
    color: white;
    border: none;
}
</style>
</head>

<title>약국 찾기</title>

<body>
	<div class="content-wrapper">
		<div class="row m-0" style="background-color: white; padding: 8px; padding-left: 0px">
			<div class="col-3" style="height: 800px; overflow-y: scroll; padding: 0px; z-index: 4; background-color: white; padding-left:8px;">
				<div id="pharmacyInfo"></div>


			</div>


			<div class="col-9 p-0">
				<button class="btn btn-default btn-lg"
					style="display: none; position: absolute; top: auto; left: 892px; bottom: auto; right: auto; z-index: 1;">
					<i class="fa fa-search"></i>
				</button>
				
				<button class="positionButton" onclick="settingCenter()">
					<i class='fas fa-undo'></i> 현 지도에서 검색 ${param.piHpid}
				</button>
				
				<div class="slide-div" style="background-color: white; width: 415px; height: 100%; position: absolute; z-index: 2;left: -415px;">
					<div id="pharmacyInfoDetail"></div>
				</div>
				<div class="button-div div-close" style="left: 0px; display: none">
				    <div class="button-close"></div>
				</div>
								
				<div class="input-group input-group-lg mb-3"
					style="width: 800px; position: absolute; top: 62px; left: 73px; bottom: auto; right: auto; z-index: 1;">
					<input type="text" class="form-control" placeholder="Search">
					<div class="input-group-append">
						<button class="btn btn-default">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				
<!-- 				<div> -->
				
<!-- 				</div> -->

				<div id="map" style="width: 100%; height: 800px; z-index: 0;"
					data-x="" data-y=""></div>
			</div>
		</div>
	</div>



</body>
