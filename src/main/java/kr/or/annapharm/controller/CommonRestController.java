package kr.or.annapharm.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jsp.exception.InvalidPasswordException;
import com.jsp.exception.NotFoundIdException;

import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionLogVO;
import kr.or.annapharm.dto.ReadMedicineInfoVO;
import kr.or.annapharm.dto.SalesAnalysisDetailVO;
import kr.or.annapharm.service.MemberService;
import kr.or.annapharm.service.NonLoginUserService;
import kr.or.annapharm.service.PrescriptionService;
import kr.or.annapharm.service.SalesAnalysisService;

@RestController
public class CommonRestController {

	@Autowired
	MemberService memberService;

	@Autowired
	private NonLoginUserService nonLoginUserService;

	@Autowired
	private SalesAnalysisService salesAnalysisServuce;

	// 휴대폰 인증(인증번호 발송)
	@RequestMapping(value = "/sendSms", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> telCheck(@RequestParam String memTel, HttpServletRequest request) throws Exception {
		System.out.println("!!!!!!!!!!!!!!");
		System.out.println("tel : " + memTel);

		ResponseEntity<String> entity = null;

		Random rand = new Random();
		String numStr = ""; // 난수가 저장될 변수

		for (int i = 0; i < 6; i++) {

			// 0~9 까지 난수 생성
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		// Sendsms.sendSMS(memTel, "인증번호 [ "+numStr+" ]");

		HttpSession session = request.getSession();
		session.setAttribute("numStr", numStr);
		session.setMaxInactiveInterval(60 * 3);

		System.out.println(numStr);

		entity = new ResponseEntity<String>(numStr, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/foundId", method = RequestMethod.POST)
	public ResponseEntity<MemberVO> foundId(MemberVO member, HttpServletRequest request) throws Exception {
		ResponseEntity<MemberVO> entity = null;
		System.out.println("///////////////////컨트롤러 오자마자" + member.toString());
		try {
			String memId = memberService.foundId(member);
			System.out.println("///////////////////아이디 찾기로 아이디 가져오기" + memId);
			member = memberService.getMember(memId);
			System.out.println("///////////////////아이디로 member가져오기" + member.toString());

		} catch (NotFoundIdException | InvalidPasswordException e) {
			// e.printStackTrace();
			request.setAttribute("message", e.getMessage());
			entity = new ResponseEntity<MemberVO>(HttpStatus.BAD_REQUEST);
			return entity;

		} catch (Exception e) {
			e.printStackTrace();
			// Exceptin 처리
			throw e;
		}

		entity = new ResponseEntity<MemberVO>(member, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/foundPassword", method = RequestMethod.POST)
	public ResponseEntity<String> foundPassword(MemberVO member, Model model) throws Exception {
		ResponseEntity<String> entity = null;

		String error = "";
		if (memberService.getMember(member.getMemId()) == null) {
			error = "존재하지 않는 아이디입니다.";
		}

		if (memberService.foundId(member) == null) {
			error = "정보가 일치하지 않습니다!";
		}

		if (error == "") {
			//에러가 없을 경우 메시지 전송
			// Sendsms.sendSMS(member.getMemTel(), "비밀번호 [ "+member.getMemPwd()+" ]");
		}

		entity = new ResponseEntity<String>(error, HttpStatus.OK);

		return entity;
	}

	// 개요 : 이름/생년월일/휴대폰 번호로 해당하는 사용자의 처방전의 정보를 가져오는 컨트롤러
	// 작성자 : 이병진
	@RequestMapping("/main/common/nonLoginPrescription")
	public ResponseEntity<List<PrescriptionLogVO>> nonLoginPrescription(String name, String birth, String phone) throws Exception{
		ResponseEntity<List<PrescriptionLogVO>> entity = null;

		PatientVO vo = new PatientVO();
		vo.setPatientName(name);
		vo.setPatientRegnum(birth);
		vo.setPatientPhone(phone);

		List<PrescriptionLogVO> list = nonLoginUserService.searchNonLoginUser(vo);

		System.out.println("list : " + list);

		entity = new ResponseEntity<List<PrescriptionLogVO>>(list, HttpStatus.OK);

		return entity;
	}

	// 개요 : 처방전 행을 클릭했을 때 해당하는 처방전의 상세내역을 가져오는 컨트롤러
	// 작성자 : 이병진
	@RequestMapping("/main/common/nonLoginprescriptionReadDetail")
	public ResponseEntity<List<SalesAnalysisDetailVO>> nonLoginprescriptionReadDetail(String psCode) throws Exception{
		ResponseEntity<List<SalesAnalysisDetailVO>> entity = null;

		List<SalesAnalysisDetailVO> list = salesAnalysisServuce.getSalesAnalyssisDetail(psCode);

		entity = new ResponseEntity<List<SalesAnalysisDetailVO>>(list, HttpStatus.OK);

		return entity;
	}



//	@RequestMapping(value ="/changePassword",method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
//	public ResponseEntity<T>
//	@ResponseBody

}
