<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>아나팜</title>

<head>
</head>

<body>
  <div class="content-wrapper">
  <iframe name="ifr"  id="main_frame" src="<%=request.getContextPath() %>/mypage/myPharmacyINReply/main.do" frameborder="0" style="width:100%;height:85vh;"></iframe>
    <!--  <iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>  -->
  </div>


<c:if test="${param.mCode == 'C060100'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/mypage/myPharmacyINReply/main.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C060200'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/mypage/inquiry/main.do";
	</script>
</c:if>
<c:if test="${param.mCode == 'C060300'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/mypage/userInfo/main.do";
	</script>
</c:if>
<c:if test="${param.mCode=='C060400'}">
	<script type="text/javascript">
		let f = document.getElementById("main_frame");
		f.src = "/annapharm/expert/mypage/member/removeForm.do";
	</script>
</c:if>


</body>