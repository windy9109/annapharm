<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<script>

	function click2() {
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	console.log(data.zonecode)
            	//우편번호
            	document.querySelector(".zcode").value = data.zonecode;
            	//주소넣기
            	document.querySelector(".addr1").value = data.address;
            	//상세주소 입력으로 커서 포커싱
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
	}


	//아이디 중복 검사
	function idCheck() {
		var id = $('.id').val();
		/* alert(id);
		console.log(id); */

		var data = {
			"memId" : id
		}

		$.ajax({
			url : "idCheck.do",
			type : "post",
			data : data,
			success : function(data) {
				console.log(data);
				//데이터를 받아와서 아이디 중복 여부를 판단
				//아이디가 중복되지 않았을 경우
				// - 아이디 입력받은 부분 아래에 "사용가능한 아이디 입니다."출력
				// - 중복 확인 버튼 비활성화
				if (data == '아이디사용가능') {
					if (data == "")
						return;

					$('#idCheck').text('사용가능한 아이디 입니다.');
					$('#idCheck').css("color", "green");
					$('#abc').attr('disabled', true);
				}

				//아이디가 중복됬을 경우
				// - 아이디 입력받는 부분 아래 "아이디가 중복되었습니다."출력
				if (data == '아이디중복') {
					$('#idCheck').text('아이디가 중복되었습니다.');
					$('#idCheck').css("color", "red");
				}

				// 아이디 중복확인 후 아이디를 hidden, form 태그에 저장하고
				$('input[name=memId]').attr('value', id);
				// 회원가입버튼을 눌렀을 때 입력받은 아이디와 form 태그에 저장된 아이디를 비교하여
				// 중복검사 여부를 판단한다.

				// 중복검사 이후 아이디를 변경했을 경우 onchange를 통해 disabled 속성 해제

			},
			error : function(error) {
				/* alert("에러//"); */
			}
		});
	}
	//중복검사 완료 후 다시 아이디를 고쳤을 경우
	function changeId() {
		$('#abc').attr('disabled', false);
	}
</script>
<script>
	// 이벤트 발생할 때 마다 비밀번호 입력|비밀번호 재입력 내용 일치 판단
	function passCheck() {
		// 비밀번호를 변경할때마다 비밀번호 입력과 비밀번호 재확인 입력창에 입력한 값이 동일한지 확인한다.
		// 비밀번호 입력, 비밀번호 재입력 창 모두 onchange 속성을 추가
		var pwd = $('.pwd').val();
		var pwdRe = $('.pwdRe').val();

		//추가 비밀번호 유효성 검사 추가
		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig);
		var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		var str = "";

		if(pwd.length < 8 || pwd.length > 20){
			str = "8자리 ~ 20자리 이내로 입력해주세요.";
		}else if(pwd.search(/\s/) != -1){
			str = "비밀번호는 공백 없이 입력해주세요.";
		}else if(num < 0 || eng < 0 || spe < 0 ){
			str = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";
		}

		$('#validation').text(str);
		$('#validation').css("color", "red");

		/* console.log(pwd + "_" + pwdRe); */

		if (pwd == pwdRe) {
			$('#passCheck').text('');
		} else {
			$('#passCheck').text('비밀번호가 일치하지 않습니다.');
			$('#passCheck').css("color", "red");
		}
		//비밀번호 입력, 비밀번호 재입력 요소가 동일하지 않을 경우 "비밀번호가 일치하지 않습니다." 메시지를 비밀번호 재입력 밑에 출력한다.
	}
</script>

<script>
	function doctorCheck() {
		var doctorNum = $('.doctorNum').val();
		/* alert(doctorNum);
		console.log(doctorNum); */

		// 	var data={
		// 		"doctorNum":doctorNum
		// 	}
		// 	$.ajax({
		// 		url:"doctorNumCheck.do",
		// 		type:"post",
		// 		data:data,
		// 		success:function(data){
		// 			console.log(data);
		// 		},
		// 		error : function(error) {
		// 			alert("에러//");
		// 		}
		// 	});
	}
</script>

<script>
	function chemistCheck() {
		var chemistCode = $('.chemistCode').val();
		/* alert(chemistNum);
		console.log(chemistNum); */

		// 	var data={
		// 		"doctorNum":doctorNum
		// 	}
		// 	$.ajax({
		// 		url:"doctorNumCheck.do",
		// 		type:"post",
		// 		data:data,
		// 		success:function(data){
		// 			console.log(data);
		// 		},
		// 		error : function(error) {
		// 			alert("에러//");
		// 		}
		// 	});
	}
</script>


<script>
	var temp = 0;
	//후대폰 인증(인증번호 발송)
	function telCheck() {
		var tel = $('.tel').val();
		console.log(tel);

		if (tel == "") {
			alert("휴대폰 번호를 입력해주세요!");
			return;
		}

		var data = {
			"memTel" : tel
		}

		$.ajax({
			url : "<%=request.getContextPath()%>/sendSms.do",
			type : "post",
			data : data,
			success : function(data) {
				//인증번호 받기를 눌렀을 경우 인증번호받기 버튼을 비활성화한다.
				/* alert("성공" + data); */
				temp = data;
				$('.telCheck').attr('disabled', true);
				$('.telCheck').css("background-color", "lightgray");

				$('.randNumCheck').css('background-color', '#2F88FF');
				//$('#tel').attr('disabled', true);
			},
			error : function(error) {
				/* alert("에러//"); */
			}
		});
	}
	function randNumCheck() {
		var randNum = $('.randNum').val();
		/* console.log('randNum', randNum); */

		if (randNum == temp) {
			$('.randNumCheck').val('인증 완료');
			$('.randNumCheck').css("background-color", "#f8f9fa");
			$('.randNumCheck').css("border", "0.5px solid");
			$('.randNumCheck').css("border-color", "#ddd");
			$('.randNumCheck').css("color", "#444");
			$('.randNumCheck').attr('disabled', true);
			$('.tel').attr('disabled', true);
		} else {
			$('.telCheck').attr('disabled', false);
			$('.telCheck').css("background-color", "#2F88FF");
			$('.randNumCheck').css('background-color', 'lightgray');
		}

	}
</script>
<script>
	function signUp(type) {
		var id = $('.id').val();
		var idCheck = $('input[name=memId]').val();
		/* 		console.log("id : " + id);
		 console.log("idCheck : " + idCheck); */

		if (id != idCheck) {
			alert("아이디 중복검사를 해주세요!");
			return;
		}

		if (id == "") {
			alert("아이디를 입력해주세요");
			return;
		}

		var pwd = $('.pwd').val();
		var pwdRe = $('.pwdRe').val();

		/* 		console.log("pwd : " + pwd);
		 console.log("pwdRe : " + pwdRe); */

		if (pwd == "") {
			alert("비밀번호를 입력해주세요");
			return;
		}

		if (pwd != pwdRe) {
			alert("비밀번호가 일치하지않습니다. 다시 입력해주세요! ");
			return;
		}

		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig);
		var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(pwd.length < 8 || pwd.length > 20){
			alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
		 	return;
		}else if(pwd.search(/\s/) != -1){
		 	alert("비밀번호는 공백 없이 입력해주세요.");
		 	return;
		}else if(num < 0 || eng < 0 || spe < 0 ){
			alert("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		 	return;
		}

		var name = $('.name').val();
		/* 		console.log("name : " + name); */

		var regNum1 = $('.regNum1').val();
		var regNum2 = $('.regNum2').val();
		var regnum = regNum1 + "-" + regNum2;

		if (regnum.length != 14) {
			alert("주민등록번호를 다시 입력해주세요!");
			return;
		}
		/* 		console.log("regNum : " + regNum); */

		var email = $('.email').val();
		/* 		console.log("email : " + email); */

		if (email == "") {
			alert("이메일을 입력해주세요");
			return;
		}

		var randNumCheck = $('.randNumCheck').val();
		if (randNumCheck != "인증 완료") {
			alert("휴대폰 인증을 해주세요!");
			return;
		}
		var tel = $('.tel').val();
		/* 		console.log("tel : " + tel); */

		var zipCode = $('.zcode').val();
		var addr1 = $('.addr1').val();
		var addr2 = $('.addr2').val();
		/* 		console.log("zcode : " + zcode);
		 console.log("addr1 : " + addr1);
		 console.log("addr2 : " + addr2); */

		if (zcode == "") {
			alert("주소를 입력해주세요");
			return;
		}


		$("input[name=memId]").val(id);
		$("input[name=memPwd]").val(pwd);
		$("input[name=memName]").val(name);
		$("input[name=memRegnum]").val(regnum);
		$("input[name=memEmail]").val(email);
		$("input[name=memTel]").val(tel);
		$("input[name=memAddr]").val(addr1);
		$("input[name=memAddr2]").val(addr2);
		$("input[name=memZipcode]").val(zipCode);

		//의사 회원가입
		if (type == 'd') {
			var doctorNum = $('.doctorNum').val();
			if (doctorNum == "") {
				alert("의사면허번호를 입력해주세요!");
				return;
			}

			$("input[name=doctorNum]").val(doctorNum);
			/* 			console.log(doctorNum); */

			var hospitalCode = $("select[name=selectHospital]").val(); //value값 가져오기
			var hospitalName = $("select[name=selectHospital] option:selected")
					.text(); //text값 가져오기
			/* 			console.log("hospitalCode : " + hospitalCode);
			 console.log("hospitalName : " + hospitalName); */

			$("input[name=hospitalCode]").val(hospitalCode);
			$("input[name=hospitalName]").val(hospitalName);

			var signUpForm = $('#signUpForm');
			signUpForm.attr({
				action : "doctor.do",
				method : 'post'
			}).submit();
		}

		//약사 회원가입
		if (type == 'c') {
			var chemistCode = $('.chemistCode').val();
			if (chemistCode == "") {
				alert("근무약국을 등록해주세요!");
				return;
			}

			var chemistCode = $('.chemistCode').val();
			$("input[name=chemistCode]").val(chemistCode);

			var signUpFormChemist = $('#signUpFormChemist');
			signUpFormChemist.attr({
				action : "chemist.do",
				method : 'post'
			}).submit();
		}

		if (type == 'u') {
			var signUpFormUser = $('#signUpFormUser');
			signUpFormUser.attr({
				action : "user.do",
				method : 'post'
			}).submit();
		}

	}
</script>

<script>
	//enter key눌렀을 때 검색 가능
	function enterkey() {
		if (window.event.keyCode == 13) {
			list_go(1);
		}
	}
</script>


<script>
	//근무약국창 닫기
	function pharmacyRegist(pharmacyCode, data) {

		console.log(data);
		console.log(data.getElementsByTagName('span')[0].innerText);
		console.log(data.getElementsByTagName('strong')[0].innerHTML);

		var pharmacyName = data.getElementsByTagName('strong')[0].innerHTML;
		var pharmacyAddr = data.getElementsByTagName('span')[0].innerText;
		var pharmacyCode = pharmacyCode;

		//form 태그
		window.opener.document.getElementById('formPharmacyCode').value = pharmacyCode;
		window.opener.document.getElementById('formPharmacyName').value = pharmacyName;
		//input 태그
		window.opener.document.getElementsByClassName('pharmacyName')[0].value = pharmacyName;
		window.opener.document.getElementsByClassName('pharmacyAddr')[0].value = pharmacyAddr;
		window.close();
	}
</script>


