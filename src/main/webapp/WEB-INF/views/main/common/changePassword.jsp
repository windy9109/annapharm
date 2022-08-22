<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div class="content-wrapper" style="margin-left:0px; background:url( '<%=request.getContextPath()%>/resources/img/mainImg.png'); background-size: cover;">
		<div style="padding-top: 25%; margin: 0px auto;">
			<div style="background-color: white; width: 450px; margin: 0px auto; font-size: 14px;">
				<div style="padding: 30px 25px;">
					<img src="/annapharm/resources/img/logo.png" style="width: 100px;" onclick="javascript:location.href='<%=request.getContextPath()%>/index.do'"> <span style="float: right; margin-top: 20px;">비밀번호 변경</span>
					<hr>
					<div class="container">
						<form action="<%=request.getContextPath()%>/changePassword.do" method="get">
							<input type="hidden" name="memId" value="<%=request.getParameter("memId")%>"/>
							<div class="row">
								<div class="col-4" style="line-height: 40px;">
									<span style="font-weight: bold;">비밀번호</span>
								</div>
								<div class="col-8">
									<input class="form-control form-control-border pwd" name="memPwd" type="text" style="width: 100%;" placeholder="변경할 비밀번호를 입력해주세요">
								</div>
							</div>
							<div class="row">
								<div class="col-4" style="line-height: 40px;">
									<span style="font-weight: bold;">비밀번호 재입력</span>
								</div>
								<div class="col-8">
									<input class="form-control form-control-border repwd" name="memRePwd" type="text" style="width: 100%;" placeholder="비밀번호를 재입력해주세요">
								</div>
							</div>
							<br>
							<div style="text-align: center;">
								<span style="color: #ff0000; font-size: 0.8em;">8~16자 영문 대소문자, 숫자, 특수문자를 사용해서 변경해주세요</span>
							</div>
							<br> <br>
							<div class="row" style="margin-top: 5px;">
								<div class="col-12">
									<button type="submit" class="btn btn-default" style="width: 100%; background-color: #3D435F; color: white;">확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/main/common/common_js.jsp"%>
	<c:if test="${!empty error }">
		<script type="text/javascript">
			alert('${error}');
		</script>
	</c:if>
</body>
</html>