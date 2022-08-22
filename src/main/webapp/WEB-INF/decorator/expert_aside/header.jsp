<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main>li a{  font-size: 14px;
}
.main>li{
    width: 120px;
}
</style>

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav"></ul>
<!--       <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li> -->
          <!-- Brand Logo -->


		<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.mName eq 'HOME'}">
					<a href="<%=request.getContextPath() %>/expert/main.do?mCode=${menu.mCode}" class="brand-link"> <img src="<%=request.getContextPath()%>/resources/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3">
					</a>
				</c:if>
		</c:forEach>


    <!-- menu start -->
    <nav>
        <div id="nav">
            <ul class="main">
				<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.mName ne '마이페이지'}"  >
				<c:if test="${menu.mName ne 'HOME'}"  >
				<c:if test="${not empty loginUser }">
                	<li><a href="<%=request.getContextPath() %>/expert/main.do?mCode=${menu.mCode}"></i>${menu.mName }</a>
                	</li>
                </c:if>
                    <c:if test="${menu.collapseYn eq 'Y'}"  >
                    	<ul class="main_sub">
   							<c:forEach items="${subMenuList}" var="subMenu">
   									<c:if test="${menu.mCode eq subMenu.parentId}"  >
			                        <li><a href="<%=request.getContextPath() %>/expert/main.do?mCode=${subMenu.mCode}">${subMenu.mName}</a></li>

                    		</c:if>
                    	</c:forEach>
                    	</ul>
                    </c:if>
                    </c:if>
                </li>
                </c:if>
               </c:forEach>

            </ul>
        </div>
    </nav>

<%--     <nav>
        <div id="nav">
            <ul class="main">
                <li><a href="#">조제/판매</a></li>
                <li><a href="<%=request.getContextPath() %>/expert/product/product.do">재고관리</a>
                    <ul class="main_sub">
                        <li><a href="<%=request.getContextPath() %>/expert/product/product.do">재고관리</a></li>
                        <li><a href="#">회수</a></li>
                    </ul>
                </li>
                <li><a href="#">약국경영</a></li>
                <li><a href="#">약사IN</a></li>
                <li><a href="#">공지사항</a></li>

            </ul>
        </div>
    </nav> --%>

	<!-- 로그인시 로그아웃 버튼 활성화 -->
	<c:if test="${not empty loginUser }">
		<div class="yo_log" style="position: absolute; right: 80px;">
	      	 <a href="#" class="d-block" style=" display: inline-block !important;  color: #fff;">${loginUser.memName }</a>&nbsp;&nbsp;
	      	 	<c:forEach items="${menuList }" var="menu">
					<c:if test="${menu.mName eq '마이페이지'}">
	      	 			<button onclick="location.href='<%=request.getContextPath() %>${menu.mUrl }';" class="btn btn-xs btn-primary col-xs-3 " type="button" >마이페이지</button>
		     		</c:if>
				</c:forEach>
		      <button onclick="location.href='<%=request.getContextPath() %>/loginTimeOut.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >LOGOUT</button>
		</div>
	</c:if>

	<!-- 비로그인시 로그인 버튼 활성화 -->
	<c:if test="${empty loginUser }">
		    <button onclick="location.href='<%=request.getContextPath() %>/common/loginForm.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >로그인</button>
			 <button onclick="location.href='<%=request.getContextPath() %>/signUp/main.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >회원가입</button>
	</c:if>

    <!-- Right navbar links -->


<!--     <ul class="navbar-nav ml-auto">
        <li style="margin-right: 10px; color: white;">김네모님</li>
        <li><div style="border-radius: 30px; background-color: white; width: 100px; text-align: center;"><a style="color: #2F88FF;">마이페이지</a></div></li>
    	<li><div style="margin:0px 20px; border-radius: 30px; background-color: white; width: 100px; text-align: center;"><a style="color: #2F88FF;">로그아웃</a></div></li>

    </ul> -->
  </nav>
