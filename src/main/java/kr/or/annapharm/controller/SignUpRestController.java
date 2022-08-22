package kr.or.annapharm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.annapharm.service.MemberService;

@RestController
@RequestMapping("/signUp")
public class SignUpRestController {
	@Autowired
	private MemberService memberService;

	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> idCheck(@RequestParam String memId) throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!");
		System.out.println("id : " + memId);

		ResponseEntity<String> entity = null;
		String str = null;

		if (memberService.getCountSameId(memId) > 0) {
			str = "아이디중복";
		} else {
			str = "아이디사용가능";
		}
		entity = new ResponseEntity<String>(str, HttpStatus.OK);

		return entity;
	}

	// 병원 코드 가져오기


	// 근무약국 검색하기
	@RequestMapping(value = "/searchPharmacy", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> searchPharmacy() throws Exception {
		ResponseEntity<String> entity = null;

		entity = new ResponseEntity<String>(HttpStatus.OK);

		return entity;
	}

}
