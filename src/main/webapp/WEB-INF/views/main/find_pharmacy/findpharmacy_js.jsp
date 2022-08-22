<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script type="text/x-handlebars-template"  id="pharmacyInfo-list-template" >
{{#each .}}
<div class="container pharmacyInfo" style="height: 190px;width: 300px; padding-top: 6px;">
<div class="card" data-pi="{{piHpid}}"style="height:176px;width: 286px;">
	<div class="card-body">
		<div class="row">
			<div class="col-9">
				<span style="font-size: 18px; font-weight: bolder;">{{piDutyname}}</span><br/>
				<span style="font-size: 12px;">{{piDutytel1}}</span><br/>
		
			</div>
			<div class="col-3">
				<div class="text-right" style="font-size: 13px; color: #007bff; ">{{distanceFilter distance}}</div>
		
			</div>
		</div>
        <div class="row">
			<div class="col-12">
				<span style="font-size: 12px;">{{piDutyaddr}}</span>
			</div>
		</div>
	</div>
	<!-- /.card-body -->

	<div class="card-footer" style="background-color: #87cefa75;">
		<div class="form-inline justify-content-between">
			<span style="font-size: 13px;">{{openTimeFilter toDayTime}}</span>
			<button onclick="pharmacyInfoDetail(this);" class="btn btn-sm btn-default detailInfo">상세정보</button>
		</div>
	</div>
	<!-- /.card-footer -->
</div>
</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="pharmacyInfo2-list-template" >
{{#each .}}
<div class="card pharmacyInfo" data-pi="{{piHpid}}" style="height: 176px;width: 286px;">
	<div class="card-body">
		<div class="row">
			<div class="col-9">
				<span style="font-size: 18px; font-weight: bolder;">{{piDutyname}}</span><br/>
				<span style="font-size: 12px;">{{piDutytel1}}</span><br/>
		
			</div>
			<div class="col-3">
				<div class="text-right" style="font-size: 13px; color: #007bff; ">{{distanceFilter distance}}</div>
		
			</div>
		</div>
        <div class="row">
			<div class="col-12">
				<span style="font-size: 12px;">{{piDutyaddr}}</span>
			</div>
		</div>
	</div>
	<!-- /.card-body -->

	<div class="card-footer" style="background-color: #87cefa75;">
		<div class="form-inline justify-content-between">
			<span style="font-size: 13px;">{{openTimeFilter toDayTime}}</span>
			<button onclick="pharmacyInfoDetail(this);" class="btn btn-sm btn-default detailInfo">상세정보</button>
		</div>
	</div>
	<!-- /.card-footer -->
</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="pharmacyInfoDetail-list-template" >
    <div class="card card-primary card-outline mx-auto pharmacyInfoDetail" style="height: 789px; width: 411px;">
		<div class="card-header">
			<div class="form-inline justify-content-between">
				<div class="form-inline">
					<i class="fas fa-capsules icon-size"></i>
					<h3 class="card-title">약국 상세정보</h3>
				</div>
			</div>
		</div>

		<div class="card-body" style="padding: 10px; font-size: 15px;">
			<div class="info">
				<div class="info-tel pb7">
					<strong style="margin-right: 1px;">대표전화</strong> : {{piDutytel1}}
				</div>
				<div class="info-addr-new pb7">
					<strong>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</strong> : {{piDutyaddr}}
				</div>
				<div class="container" style="padding-left: 2px;">
					<div class="form-inline justify-content-between pb9">
						<ul style="list-style-type: disc;">
							<li class="float-left ml-3">월요일 {{timeFilter piDutytime1s}}~{{timeFilter piDutytime1c}}</li>
							<li class="float-left ml-5">화요일 {{timeFilter piDutytime2s}}~{{timeFilter piDutytime2c}}</li>
						</ul>
						<ul style="list-style-type: disc;">
							<li class="float-left ml-3">수요일 {{timeFilter piDutytime3s}}~{{timeFilter piDutytime3c}}</li>
							<li class="float-left ml-5">목요일 {{timeFilter piDutytime4s}}~{{timeFilter piDutytime4c}}</li>
						</ul>
						<ul style="list-style-type: disc;">
							<li class="float-left ml-3">금요일 {{timeFilter piDutytime5s}}~{{timeFilter piDutytime5c}}</li>
							<li class="float-left ml-5">토요일 {{timeFilter piDutytime6s}}~{{timeFilter piDutytime6c}}</li>
						</ul>
					</div>
				
				</div>
				
				<table class="table table-hover table-bordered"
					style="border-top: 1px solid #dee2e6;">
					<colgroup>
						<col width="45%" />
						<col width="16%" />
					</colgroup>
					<thead class="text-center">
						<tr style="background-color: #E8F5FF;">
							<th>약명</th>
							<th>재고수</th>
						</tr>
					</thead>
					<tbody id="searchMedicineList" class="text-left">
					{{#each pharmacyProductInfo}}
						<tr>
							<td>{{mdName}}</td>
							<td>{{productOwnnum}}</td>
						</tr>							
					{{/each}}
					</tbody>
				</table>
			</div>

		</div>

	</div>
</script>

<script>
var map;
var categorySearchCallback;
var geocoder;
var places;
var markers = [];
$(function(){
	geocoder = new kakao.maps.services.Geocoder();
	places = new kakao.maps.services.Places();
	// map 객체
	
	var url = new URL(window.top.location.href);
	var piHpid = url.searchParams.get('piHpid');
	
	if(piHpid){
// 		alert(piCHpid);
<%-- 		location.href = "<%=request.getContextPath()%>/searchPharmacy/reGoPharmacy.do?piHpid=" + piHpid; --%>
		
		var data = {"piHpid":piHpid};
		
		$.ajax({
			url: "goPharmacy",
			type: "post",
			data: data,
			success:function(res){
				console.log(res);
				
				 map = settingMap(yp,xp);
				
				return;
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);	
			}
		});
		
		return;
	}
	
	// 카테고리 검색 콜백함수
	categorySearchCallback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	   		
	        underScoreParse(result);
	       	
        	$.ajax({
        		url:"<%=request.getContextPath()%>/searchPharmacy/getMakerInfo.do",
        		type:"post",
        		data:JSON.stringify(result),	
        		contentType:'application/json',
        		success:function(data){
        			console.log(data);
        			printDatapharmacyInfo(data,$('#pharmacyInfo'),$('#pharmacyInfo-list-template'),"pharmacyInfo");
        			data.forEach(function(obj,index){
//         				console.log(obj)
        	        	addMarker(obj.y,obj.x,map,document.querySelector('.pharmacyInfo'));
        	        });
        			printDatapharmacyInfo(data,$('#pharmacyInfo'),$('#pharmacyInfo2-list-template'),"pharmacyInfo");
        			
        		},
        		error:function(error){
        			AjaxErrorSecurityRedirectHandler(error.status);	
        		}
        	});
	    }
	};
	
	var addressSearchCallback = function(res, status){
		 if (status === kakao.maps.services.Status.OK) {
			 xp = res[0].x;
			 yp = res[0].y;
			 
			 // 맵 객체 생성
			 map = settingMap(yp,xp);
			 
			 // 공공기관 코드 검색
			 places.categorySearch('PM9', categorySearchCallback, {
				 // 공공기관 코듣 검색 옵션 설정 x,y: 지도중심 좌표값
				 // radius : 검색할 반경(m)
			     x : xp,
			     y : yp,
			     radius : 1000
			 });
		
			 console.log(map)
			// 카카오 지도 중심좌표 이벤트리스너
// 			 kakao.maps.event.addListener(map, 'center_changed', function() {
			
// 			//     // 지도의  레벨을 얻어옵니다
// 			//     var level = map.getLevel();
			
// 			    // 지도의 중심좌표를 얻어옵니다 
// 			    var latlng = map.getCenter(); 
// 				console.log(latlng);
// 			//     var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
// 			//     message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
			
// 			//     var resultDiv = document.getElementById('result');
// 			//     resultDiv.innerHTML = message;
			
// 			 });
		 }
	};
	
	// 주소->좌표 변환 콜백 함수
	geocoder.addressSearch("<c:out value='${loginUser.memAddr}'/>", addressSearchCallback);
	

});

function settingCenter(){
    var latlng = map.getCenter(); 
    map.setCenter(new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()));
	console.log(latlng);
	console.log(markers);
	
	hideMarkers();
	
	var callback1 = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	   		console.log(result);
	        underScoreParse(result);
	       	
        	$.ajax({
     		url:"<%=request.getContextPath()%>/searchPharmacy/getMakerInfo.do",
        		type:"post",
        		data:JSON.stringify(result),	
        		contentType:'application/json',
        		success:function(data){
        			console.log(data);
        			printDatapharmacyInfo(data,$('#pharmacyInfo'),$('#pharmacyInfo-list-template'),"pharmacyInfo");
        			data.forEach(function(obj,index){
//         				console.log(obj)
        	        	addMarker(obj.y,obj.x,map,document.querySelector('.pharmacyInfo'));
        	        });
        			printDatapharmacyInfo(data,$('#pharmacyInfo'),$('#pharmacyInfo2-list-template'),"pharmacyInfo");
        			
        		},
        		error:function(error){
        			AjaxErrorSecurityRedirectHandler(error.status);	
        		}
        	});
	    }
	};
	
	places.categorySearch('PM9', callback1, {
		location : map.getCenter(),
	    radius : 1000
	});
	
}

</script>




<script>

// 약국상세 정보 찾기 생창 띄우는 함수
function goDetailInfo(target){
	var piHpid = document.querySelector('.detailInfo').parentNode.parentNode.parentNode;
// 	console.log(parent.id);
	OpenWindow('<%=request.getContextPath() %>/searchPharmacy/detail.do?piHpid='+piHpid.id,'상세보기',420,810)
}

function underScoreParse(result){
	result.forEach(function(obj,index){
		obj.addressName = obj.address_name;
		delete obj.address_name;
		
		obj.categoryGroupCode = obj.category_group_code;
		delete obj.category_group_code;
		
		obj.categoryGroupName = obj.category_group_name;
		delete obj.category_group_name;
		
		obj.categoryName = obj.category_name;
		delete obj.category_name;
		
		obj.placeName = obj.place_name;
		delete obj.place_name;
		
		obj.placeUrl = obj.place_url;
		delete obj.place_url;
		
		obj.roadAddressName = obj.road_address_name;
		delete obj.road_address_name;
    });
}

function hideMarkers(){
	setMarkers(null);
}

function setMarkers(map){
	for(var i = 0; i < markers.length; i++){
		markers[i].setMap(map);
	}
}

// 마커 표시하기
function addMarker(y,x,map,info){
	var position =  new kakao.maps.LatLng(y, x);
	
	var marker = new kakao.maps.Marker({
		position: position,
	    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	});
	
	// 마커를 지도에 표시합니다.
	marker.setMap(map);
	
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = '<div class="container border" style="padding:5px; height: 180px;width: 300px;"><div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : info,
	    removable : iwRemoveable
	});

	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);  
	});
	markers.push(marker);
}

// function addCO(y,x,map){
// 	var marker = new kakao.maps.Marker({
// 	    map: map, 
// 	    position: new kakao.maps.LatLng(y, x)
// 	});

// 	// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 	// 별도의 이벤트 메소드를 제공하지 않습니다 
// 	var content =   '<div class="card pharmacyInfo" style="height: 176px;width: 286px;">'+
// 			        '	<div class="card-body">'+
// 			        '		<div class="row">'+
// 			        '			<div class="col-9">'+
// 			        '				<span style="font-size: 18px; font-weight: bolder;">{{piDutyname}}</span><br/>'+
// 			        '				<span style="font-size: 12px;">{{piDutytel1}}</span><br/>'+
// 			        '			</div>'+
// 			        '			<div class="col-3">'+
// 			        '				<div class="text-right" style="font-size: 13px; color: #007bff; ">{{distanceFilter distance}}</div>'+
// 			        '			</div>'+
// 			        '		</div>'+
// 			        '        <div class="row">'+
// 			        '			<div class="col-12">'+
// 			        '				<span style="font-size: 12px;">{{piDutyaddr}}</span>'+
// 			        '			</div>'+
// 			        '		</div>'+
// 			        '	</div>'+
// 			        '	<div class="card-footer" style="background-color: #87cefa75;">'+
// 			        '		<div class="form-inline justify-content-between">'+
// 			        '			<span style="font-size: 13px;">영엽중</span>'+
// 			        '			<button class="btn btn-sm btn-default">상세정보</button>'+
// 			        '			<button onclick="closeOverlay()" class="btn btn-sm btn-default">닫기</button>'+
// 			        '		</div>'+
// 			        '	</div>'+
// 			        '</div>';
	            
	            

// 	// 마커 위에 커스텀오버레이를 표시합니다
// 	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
// 	var overlay = new kakao.maps.CustomOverlay({
// 	    content: content,
// 	    map: map,
// 	    position: marker.getPosition()       
// 	});
// }

// function closeOverlay() {
//     overlay.setMap(null);     
// }

// 지도 세팅
function settingMap(y,x){
	var container = document.getElementById('map');
    options = {
         center: new kakao.maps.LatLng(y, x),
         level: 3
    };
 
	var map = new kakao.maps.Map(container, options);
	
	var places = new kakao.maps.services.Places();

	places.setMap(map);
	
	return map;
}

function printDatapharmacyInfo(replyArr,target,templateObject,targetName){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	if(targetName == "pharmacyInfo") $('.pharmacyInfo').remove();
	if(targetName == "pharmacyInfoDetail") $('.pharmacyInfoDetail').remove();
	target.after(html);
}

function pharmacyInfoDetail(target){
	
	var piHpid = target.parentNode.parentNode.parentNode;
	
	var data = {
		"piHpid" : piHpid.getAttribute('data-pi')
	};
	
	console.log("piHpid : " + piHpid.getAttribute('data-pi'))
	
	$.ajax({
		url:"<%=request.getContextPath()%>/searchPharmacy/getMakerInfoDetail.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			console.log(data);
			printDatapharmacyInfo(data,$('#pharmacyInfoDetail'),$('#pharmacyInfoDetail-list-template'),"pharmacyInfoDetail");
			infoToggle(document.querySelector('.button-div'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
}


//Handlebars 필터함수 및 필터
Handlebars.registerHelper({
	"distanceFilter" : function(data){
		if(data > 1000) data = data/1000 + 'km';
		else data = data + 'm'; 
		return data;
	},
	"timeFilter" : function(data){
		if(!data) return "정 기 휴 일"
		
		return data.substr(0,2) + ':' + data.substr(2);
	},
	"openTimeFilter" : function(data){
		if(data == "영업준비중"){
			return data;
		}
		var openTime = Number(data.split(',')[0]);
		var closeTime = Number(data.split(',')[1]);
		var today = new Date();   

		var hours = today.getHours(); // 시
		var minutes = today.getMinutes();  // 분
		
		var nowTime = Number(today.getHours() + "" + today.getMinutes());
		
// 		console.log("openTime : " + openTime);
// 		console.log("closeTime : " + closeTime);
// 		console.log("nowTime : " + nowTime);
		
		if(openTime <= nowTime && nowTime <= closeTime){
			return '영업중'
		}else{
			return '영업준비중'
		}
		
	}
	
});

function infoToggle(target){
	$(target).toggleClass("div-close");
	  
	  if ($(target).hasClass("div-close")) {
	  	return;
	  } else {
	    $(".slide-div").animate({ left: "0px"}, 800);  
	    $(".button-div").animate({ left: "401px"}, 800);
	    $(target).find(".button-close").attr("class", "button-open");
	  }	
}

// $('.detailInfo').click(function(){
// 	$(this).show;
// })


$(document).delegate('.detailInfo','click',function(){
	$('.button-div').show();
});

$(".button-div").click(function(){
	  
  $(this).toggleClass("div-close");
  
  if ($(this).hasClass("div-close")) {
    $(".slide-div").animate({ left: "-415px"}, 800);  
    $(".button-div").animate({ left: "0px"}, 800);
    $(this).find(".button-open").attr("class", "button-close");
  } else {
    $(".slide-div").animate({ left: "0px"}, 800);  
    $(".button-div").animate({ left: "415px"}, 800);
    $(this).find(".button-close").attr("class", "button-open");
  }
});

</script> 
