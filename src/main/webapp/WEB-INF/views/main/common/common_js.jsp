<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
	var temp = 0;

	//후대폰 인증(인증번호 발송)
	function telCheck1() {
		tel = $('.idtel');
		memTel = tel.val();
		telcheck = $('.idtelCheck');
		randNumCheck = $('.idrandNumCheck');

		if (memTel == "") {
			alert("휴대폰 번호를 입력해주세요!");
			return;
		}

		var data = {
			"memTel" : memTel
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/sendSms.do",
			type : "post",
			data : data,
			success : function(data) {
				//인증번호 받기를 눌렀을 경우 인증번호받기 버튼을 비활성화한다.
				/* alert("성공" + data); */
				temp = data;
				console.log(temp);
				telcheck.attr('readonly', true);
				telcheck.css("background-color", "lightgray");

				randNumCheck.css('background-color', '#2F88FF');
				randNumCheck.attr('disabled', false);
				//$('#tel').attr('disabled', true);
			},
			error : function(error) {
				/* alert("에러//"); */
			}
		});
	}
	function telCheck2() {
		tel = $('.pwdtel');
		memTel = tel.val();
		telcheck = $('.pwdtelCheck');
		randNumCheck = $('.pwdrandNumCheck');

		if (memTel == "") {
			alert("휴대폰 번호를 입력해주세요!");
			return;
		}

		var data = {
			"memTel" : memTel
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/sendSms.do",
			type : "post",
			data : data,
			success : function(data) {
				//인증번호 받기를 눌렀을 경우 인증번호받기 버튼을 비활성화한다.
				/* alert("성공" + data); */
				temp = data;
				console.log(temp);
				telcheck.attr('readonly', true);
				telcheck.css("background-color", "lightgray");

				randNumCheck.css('background-color', '#2F88FF');
				randNumCheck.attr('disabled', false);
				//$('#tel').attr('disabled', true);
			},
			error : function(error) {
				/* alert("에러//"); */
			}
		});
	}

	function randNumCheck1() {
		telcheck = $('.idtelCheck');
		randNumCheck = $('.idrandNumCheck');
		randNumtext = $('.idrandNum')
		randNum = $('.idrandNum').val();

		if(randNum == ""){
			alert("인증번호를 입력해주세요!");
			return;
		}

		console.log('randNum', randNum);

		if (randNum == temp) {
			randNumCheck.val('인증 완료');
			randNumCheck.css("background-color", "#f8f9fa");
			randNumCheck.css("border", "0.5px solid");
			randNumCheck.css("border-color", "#ddd");
			randNumCheck.css("color", "#444");
			randNumCheck.attr('disabled', true);
			randNumtext.attr('disabled', true);
			tel.attr('readonly', true);
		} else {
			$('.idtelCheck').attr('readonly', false);
			$('.idtelCheck').css("background-color", "#2F88FF");
			$('.idtelCheck').css("color", "white");
			$('.idrandNumCheck').css('background-color', 'lightgray');
		}

	}
	function randNumCheck2() {
		randNumtext = $('.pwdrandNum')
		randNum = $('.pwdrandNum').val();

		if(randNum == ""){
			alert("인증번호를 입력해주세요!");
			return;
		}

		console.log('randNum', randNum);

		if (randNum == temp) {
			randNumCheck.val('인증 완료');
			randNumCheck.css("background-color", "#f8f9fa");
			randNumCheck.css("border", "0.5px solid");
			randNumCheck.css("border-color", "#ddd");
			randNumCheck.css("color", "#444");
			randNumCheck.attr('disabled', true);
			randNumtext.attr('disabled', true);
			tel.attr('readonly', true);
		} else {
			$('.pwdtelCheck').attr('readonly', false);
			$('.pwdtelCheck').css("background-color", "#2F88FF");
			$('.pwdtelCheck').css("color", "white");
			$('.pwdrandNumCheck').css('background-color', 'lightgray');
		}

	}
</script>

<script>
//아이디 찾기 버튼을 눌렀을 때
	function foundId() {
		//입력받은 것들 가져오기
		var name = $('.idname').val();
		var tel = $('.idtel').val();

		console.log(name,tel);

		if(name==""){
			alert("이름을 입력해주세요!");
			return;
		}
		if(tel == ""){
			alert("전화번호를 입력해주세요!");
			return;
		}

		var idrandNum = $('.idrandNum').attr("disabled");
		//disabled 상태라면 disabled, 아니면 undefined
		if(idrandNum != "disabled"){
			//인증번호 확인이 완료되지 않았을 경우
			alert("휴대폰 인증을 해주세요!");
			return;
		}

		var data = {
			"memName" : name,
			"memTel" : tel
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/foundId.do",
			type : "post",
			data : data,
			success : function(member) {
				//조회한 정보의 아이디 가져오기
				console.log(member);
				if (member.memId == "") {
					alert("아이디가 존재하지 않습니다.");
					return;
				} else {
					$('#regDateResult').text(member.memRegdate.substr(0,10));
					$('#idResult').text(member.memId);
					$('.btn_foundId').attr('disabled', true);
					$('.showId').show();
				}
			},
			error : function(error) {
				alert("정보가 일치하지 않습니다! 다시입력해주세요!");
			}
		});

	}
</script>
<script>
	function foundPassword() {
		var id = $('.id').val();
		var name = $('.pwdname').val();
		var tel = $('.pwdtel').val();
		var pwdrandNum = $('.pwdrandNum').attr("disabled");

		if (id == "") {
			alert("아이디를 입력해주세요!");
			return;
		}
		if (name == "") {
			alert("이름을 입력해주세요!");
			return;
		}
		if (tel == "") {
			alert("전화번호를 입력해주세요!");
			return;
		}
		if (pwdrandNum != "disabled") {
			//인증번호 확인이 완료되지 않았을 경우
			alert("휴대폰 인증을 해주세요!");
			return;
		}

		var data = {
				"memId" : id,
				"memTel" : tel,
				"memName" : name
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/foundPassword.do",
			type : "post",
			data : data,
			success : function(error) {
				if(error != ""){
					alert(error);
				}
				else{
					$('.showPassword').show();
				}
			},
			error : function() {
				/* alert("에러//"); */
			}
		});
	}
</script>

<script>
	function changePassword() {
		var pwd = $('.pwd').val();
		var repwd = $('.repwd').val();

		if (pwd != repwd) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요!");
			return;
		}

		var data = {
			"memId" : '<%=request.getParameter("memId")%>',
			"memPwd" : pwd
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/changePassword.do",
			type : "post",
			data : data,
			success : function() {
				location.href = "<%=request.getContextPath()%>/common/loginForm.do"
			},
			error : function(error) {
				/* alert("에러//"); */
			}
		});

	}
</script>