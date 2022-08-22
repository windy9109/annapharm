<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="kr.or.annapharm.dto.DoctorVO" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><decorator:title default="ddit's System" /></title>

<!-- none_decorator -->

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main_aside.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
<%--       <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/fullpage.css"> --%>




  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/toastr/toastr.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">



     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/menu.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/expert.css">
<decorator:head />

<style>
body {
	background-color: #f4f6f9 !important;
}
.login-page, .register-page{
background-color: #f4f6f9 !important;
}
</style>
</head>
<body>

	<div class="wrapper" data-test="${loginUser.memAuthority}">

		<decorator:body />

	</div>

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/menu.js"></script>

<%-- 	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script> --%>

	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<!-- 	<script src="https://cdn.jsdelivr.net/npm/datalist-css/dist/datalist-css.min.js"></script> -->



<!-- summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/1fc71bb455.js" crossorigin="anonymous"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script src="<%=request.getContextPath() %>/resources/js/menu.js" ></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>




<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
<%-- <script src="<%=request.getContextPath() %>/resources/js/analysisPrescription.js" ></script> --%>
<%-- <script src="<%=request.getContextPath() %>/resources/js/takeStatistics.js" ></script> --%>



<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"
	});

</script>


<!-- LSG 코드 -->
<script>
	$(function() {
		  var cnt0 = 0;

		  counterFn();

		  function counterFn() {

		    id0 = setInterval(count0Fn, 10);

		    function count0Fn() {
		      cnt0++;
		      if (cnt0 > 100) {
		        clearInterval(id0);
		      } else {
		        $(".number000").text(cnt0);
		      }
		    }
		  }
		});


	$(function() {
		  var cnt1 = 850;

		  counterFn1();

		  function counterFn1() {

		    id01 = setInterval(count0Fn1, 10);

		    function count0Fn1() {
		      cnt1++;
		      if (cnt1 > 1000) {
		        clearInterval(id01);
		      } else {
		        $(".number100").text(cnt1);
		      }
		    }
		  }
		});

</script>




<!--------------------------  전문가 페이지 시작  -------------------------------->





<!-- checkbox event -->
<script>
  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        	$('.mailbox-messages input[class="abled"]').prop('checked', false)
        	$('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        	$('.mailbox-messages input[class="abled"]').prop('checked', true)
        	$('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })
  })
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script  type="text/x-handlebars-template"  id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>

<script>
	Handlebars.registerHelper('eq', function(arg1, arg2, options) {
		 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
	});

	Handlebars.registerHelper('sum',function(num, price){ // 입고, 발주 상세내용에서 해당 약품의 금액을 수량 *약품 금액 으로 출력되도록..
		var a = parseInt(num);
		var b = parseInt(price);
		var sum = a * b;
		var res = sum.toLocaleString('ko-KR');
		return res;
	});
</script>

<!-- 이름과 생년월일로 조회된 회원을 출력하는 기능 -->
<script  type="text/x-handlebars-template"  id="lookUp-list-template">
	{{#each .}}
	<tbody id="lookUp_tboy">
		<tr>
			<td>{{inc @index}}</td>
			<td>{{patientName}}</td>
			<td>{{patientRegnum}}</td>
			<td>{{patientPhone}}</td>
		</tr>
	{{/each}}
</script>



<script>
var nowPage2 = 1;
Handlebars.registerHelper("inc", function(value,options){
    return parseInt(value) + 1;
});

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		if(timeValue == null){
			return "-";
		}
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();

		if(month < 10) month = "0" + month;
		if(date < 10) date = "0" + date;

		return year+"."+month+"."+date;
	},
	"signActive2" : function(pageNum){
		if(pageNum == nowPage2) return 'active';
	}
});


</script>




<script>
function a(){
		<%-- goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode}');
		subMenu_go('${menu.mcode}'.substring(0,3)+"0000"); --%>
		var mediName = document.querySelector(".mediName");
	 	console.log(mediName);
	}

</script>
<!----------------------------------- 전문가 페이지 마침 --------------------------------->



<script type="text/x-handlebars-template" id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>
<%-- <%@ include file="/WEB-INF/views/expert/business_management/compare_js.jsp" %> --%>
<c:if test="${loginUser.memAuthority == '약사'}">
<%@ include file="/WEB-INF/views/expert/business_management/compare_js.jsp" %>
<%@ include file="/WEB-INF/views/expert/business_management/visitor_js.jsp" %>
</c:if>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c99daf9f4940504e05bd8b62691a54c1&libraries=services"></script>
<c:if test="${loginUser.memAuthority == '일반'}">
<%@ include file="/WEB-INF/views/main/find_pharmacy/findpharmacy_js.jsp" %>
</c:if>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
	$(document).ready(function(){
	   $('[data-toggle="tooltip"]').tooltip();
	});

	Handlebars.registerHelper("inc", function(value,options){
	    return parseInt(value) + 1;

	});

	Handlebars.registerHelper({
		"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
			if(timeValue == null){
				return "-";
			}
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			var date=dateObj.getDate();

			if(month < 10) month = "0" + month;
			if(date < 10) date = "0" + date;
			return year+"."+month+"."+date;
		},
	});


	function printData4(list,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(list);
		$('.medicineInfoList').remove();
		target.after(html);
	}
</script>
<script>
Handlebars.registerHelper('eq', function(arg1, arg2, options) {
	 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});

Handlebars.registerHelper('compareDatePhmacy', function(arg1, options) {
	var arg2 = new Date();
	var diffDate = arg2.getTime() - arg1;
	var compare = Math.abs(diffDate / (1000*60*60*24));
	return (compare >= 7) ? options.fn(this) : options.inverse(this);
});

Handlebars.registerHelper('substr',function(data, start, end){ // 입고, 발주 상세내용에서 해당 약품의 금액을 수량 *약품 금액 으로 출력되도록..
	return data.substring(start,end)
});

</script>

<script>
$(function(){
		$('#endDate').change(function(){
			var changeEnd = $(this).val();
			$('#startDate').attr('max',changeEnd);

			var endDate = $('#endDate').val();
			var startDate = $('#startDate').val();

			if(!compareDate(startDate,endDate)){
				$('#startDate').val(endDate);
			}
		});
});

function compareDate(startDate, endDate) {

	var start = new Date(startDate);
	var end = new Date(endDate);

	var result;

	if(start <= end) result = true;
	else result = false;

	return result;
}
</script>


<script>

</script>
</body>

</html>

