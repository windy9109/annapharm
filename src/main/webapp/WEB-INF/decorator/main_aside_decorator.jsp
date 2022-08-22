<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<title><decorator:title default="ddit's System"/></title>

  <!-- main_aside_decorator -->

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main_aside.css">
     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/menu.css">

  <decorator:head />

  <style>
   	body { background:#292e33;}
   	.sideIcon{
   		color: #007bff;
   	}
   	.nav-link p{
   		color: black;
   		font-size: 1.3em;
   	}
  </style>
</head>
<body>

<div class="wrapper">

<%@ include file="./main_aside/header.jsp" %>
<%@ include file="./main_aside/aside.jsp" %>

<decorator:body />

<%@ include file="./main/footer.jsp" %>
</div>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
<!-- summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/1fc71bb455.js" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>
<script src="<%=request.getContextPath() %>/resources/js/menu.js" ></script>




<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"
	});
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script  type="text/x-handlebars-template"  id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{mUrl}}','{{mCode}}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>


<script>

	function changeIframeUrl(url){
		/*  document.getElementById("main_frame").src = url; */

		goPage('<%=request.getContextPath()%>${menu.mUrl}','${menu.mCode}');

	}
</script>


<%--  <script>
   window.onload=function(){
      goPage('<%=request.getContextPath()%>${menu.mUrl}','${menu.mCode}');

   }

   </script> --%>

 <script>
function goPage(url,mCode){
	//alert(url);
	$('iframe[name="ifr"]').attr("src",url);

	// HTML5 지원브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);

	    if (mCode != 'U040100') {
	        renewURL += "?mCode="+mCode;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);

	} else {
	    location.hash = "#"+mCode;
	}
}

<%-- function subMenu_go(mCode){
	//alert(mCode);
	if(mCode!="U040100"){

		$.ajax({
			url:"<%=request.getContextPath()%>/subMenu.do?mCode="+mCode,
			method:"get",
			success:function(data){
				printData(data,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');

			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);

			}
		}); --%>


<%--  function subMenu_go(mCode){
	//alert(mCode);
	if(mCode!="U040100"){

		$.ajax({
			url:"<%=request.getContextPath()%>/subMenu.do?mCode="+mCode,
			method:"get",
			success:function(data){
				printData(data,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});


	}else{
		$('.subMenuList').html("");
	}
} --%>


//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printData(dataArr,target,templateObject,removeClass){

	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	$(removeClass).remove();
	target.append(html);
}


</script>
</body>

</html>

