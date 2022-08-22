<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<title>아나팜</title>

<head>
</head>

<body>
  <div class="content-wrapper">
  <iframe name="ifr" scrolling="no" id="main_frame_ma" src="<%=request.getContextPath() %>/manager/managerDashBoard.do" frameborder="0" style="width:100%;height:85vh;"></iframe>
    <!--  <iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>  -->				
  </div>
</body>