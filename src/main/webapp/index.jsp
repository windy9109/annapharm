
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="content-wrapper">
</div>

<script>
	sre="";
	if('${loginUser.name}'){
		location.href="index.do";
	}else{
		location.href="index.do";
		
	/* 	location.href="main/common/index.jsp"; */
<%-- 		sre += '<iframe name="ifr" src="<%=request.getContextPath() %>/main/common/index.jsp" frameborder="0" style="width:100%;height:85vh;">'; --%>
// 		sre += '</iframe>';

// 		document.querySelector('.content-wrapper').innerHTML=sre

	}
</script>