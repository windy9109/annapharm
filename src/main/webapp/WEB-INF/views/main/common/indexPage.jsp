<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>아나팜</title>

<head>
</head>

<body>
  <div class="content-wrapper">
  <iframe name="ifr"  id="main_frame" src="<%=request.getContextPath() %>/main/common/index.do"
  	frameborder="0" style="width:100%;height:85vh;"></iframe>
    <!--  <iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>  -->
  </div>
 <c:if test="${param.mCode == 'U020000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/annapharmIn/list.do";
	</script>
</c:if>
<c:if test="${param.mCode=='U030000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/board/list.do";
	</script>
</c:if>
<c:if test="${param.mCode == 'U010000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/searchPharmacy/main.do";
	</script>
</c:if>
<c:if test="${param.mCode=='U000000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/main/common/index.do";
	</script>
</c:if>



</body>

