<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	body:not(.sidebar-mini-md):not(.sidebar-mini-xs):not(.layout-top-nav) .content-wrapper,
	body:not(.sidebar-mini-md):not(.sidebar-mini-xs):not(.layout-top-nav) .main-footer{
	    margin-left: 0;
	}
</style>

<nav class="main-header navbar navbar-expand navbar-white navbar-light" style=" padding: 0px;">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<!--       <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li> -->
		<!-- Brand Logo -->


		<c:forEach items="${menuList }" var="menu">
			<c:if test="${menu.mName eq 'HOME'}"  >
				<a href="javascript:subMenu_go('${menu.mCode }');goPage('<%=request.getContextPath() %>${menu.mUrl }','${menu.mCode }');" class="brand-link"> <img src="<%=request.getContextPath()%>/resources/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3">
				</a>
			</c:if>
		</c:forEach>


<div id="targetMenu">
</div>

    <nav>
        <div id="nav">
            <ul class="main">
				<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.mName ne '마이페이지'}"  >
				<c:if test="${menu.mName ne 'HOME'}"  >
                <li><a href="javascript:subMenu_go('${menu.mCode }');goPage('<%=request.getContextPath() %>${menu.mUrl }','${menu.mCode }');" class="nav-link"><i class="${menu.mIcon}"></i>${menu.mName }</a>
                    <c:if test="${menu.collapseYn eq 'Y'}"  >
                    	<ul class="main_sub">
   							<c:forEach items="${subMenuList}" var="subMenu">
   									<c:if test="${menu.mCode eq subMenu.parentId}"  >
			                        <li><a href="javascript:subMenu_go('${subMenu.mCode }');goPage('<%=request.getContextPath() %>${subMenu.mUrl }','${subMenu.mCode }');">${subMenu.mName}</a></li>

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



<%--
		<c:forEach items="${menuList }" var="menu">
			<li class="nav-item d-none d-sm-inline-block"><a href="javascript:subMenu_go('${menu.mcode }');goPage('<%=request.getContextPath() %>${menu.murl }','${menu.mcode }');" class="nav-link"><i class="${menu.micon}"></i>&nbsp;${menu.mname }</a></li>
		</c:forEach>  --%>
	</ul>

	<!-- Right navbar links -->


	<!-- 로그인시 로그아웃 버튼 활성화 -->
	<c:if test="${not empty loginUser }">
			<div class="yo_log" style="position: absolute; right: 80px;">
	      		<a href="" class="d-block" style=" display: inline-block !important;  color: #fff;" >${loginUser.memName }</a>&nbsp;&nbsp;
	      	 	<button onclick="location.href='<%=request.getContextPath() %>/common/logout.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >마이페이지</button>
		      	<button onclick="location.href='<%=request.getContextPath() %>/loginTimeOut.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >LOGOUT</button>
			</div>
	</c:if>

	<!-- 비로그인시 로그인 버튼 활성화 -->
	<c:if test="${empty loginUser }" >
		<div class="yo_out" style="position: absolute; right: 80px;">
		     	<button onclick="location.href='<%=request.getContextPath() %>/common/loginForm.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >로그인</button>
				<button onclick="location.href='<%=request.getContextPath() %>/signUp/main.do';" class="btn btn-xs btn-primary col-xs-3 " type="button" >회원가입</button>
		</div>
	</c:if>
<%-- 	<ul class="navbar-nav ml-auto">
		<!-- 로그인을 안했을 경우 -->
		<c:if test="${empty loginUser }">
			<li><a href="#">로그인</a></li>
			<li style="margin-left: 30px; margin-right: 30px;"><a href="#">회원가입</a></li>
		</c:if>
		<!-- 로그인을 한 일반사용자 -->
		<c:if test="${!empty loginUser }">
			<li><div style="border-radius: 30px; background-color: #2F88FF; width: 100px; text-align: center;"><a style="color: white;">마이페이지</a></div></li>
			<li><div style="margin:0px 20px; border-radius: 30px; background-color: #2F88FF; width: 100px; text-align: center;"><a style="color: white;">로그아웃</a></div></li>
		</c:if>
	</ul> --%>
</nav>
