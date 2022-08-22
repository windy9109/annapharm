<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>아나팜</title>

<head>
</head>

<body>
  <div class="content-wrapper">
  <iframe name="ifr" id="main_frame" src="<%=request.getContextPath() %>/expert/expertDashBoard.do" frameborder="0" style="width:100%;height:92vh;"></iframe>
    <!--  <iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>  -->
  </div>



 <c:if test="${param.mCode == 'C010000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/pharmacist/main.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C010100'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/pharmacist/main.do";
	</script>
</c:if>
<c:if test="${param.mCode == 'C020000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/product/product.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C020100'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/product/product.do";
	</script>
</c:if>
  <c:if test="${param.mCode == 'C020200'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/retrieve/list.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C030000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/business/visitor.do";
	</script>
</c:if>
<c:if test="${param.mCode == 'C030100'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/business/visitor.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C030200'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/sales_analysis/search.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C030300'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/business/compare.do";
	</script>
</c:if>
<c:if test="${param.mCode == 'C040000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/annapharmIn/list.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C050000'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/board/list.do";
	</script>
</c:if>




</body>