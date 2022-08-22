package kr.or.annapharm.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jsp.controller.MakeFileName;
import com.jsp.exception.InvalidPasswordException;
import com.jsp.exception.NotFoundIdException;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.DoctorVO;
import kr.or.annapharm.dto.HospitalVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.MenuVO;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.QnaVO;
import kr.or.annapharm.service.AnnapharmInService;
import kr.or.annapharm.service.HospitalService;
import kr.or.annapharm.service.MemberService;
import kr.or.annapharm.service.MenuService;
import kr.or.annapharm.service.PharmacyService;
import kr.or.annapharm.service.QnaService;

@Controller
public class CommonController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private HospitalService hospitalService;

	@Autowired
	private PharmacyService pharmacyService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private AnnapharmInService service;
	

	@RequestMapping("/main")
	public String main() {
		String url = "home";
		return url;
	}

//	@RequestMapping("/")
//	public String home() {
//		String url = "home";
//		return url;
//	}


	@RequestMapping("/main/common/index")
	public ModelAndView loginIndex(ModelAndView mnv) throws Exception {
		String url = "main/common/index";

		List<QnaVO> qnaList = qnaService.getQnaList();

		AnnapharmInVO AnnapharmIn_main01 = service.selectAnnapharmIn_main01();
		AnnapharmInVO AnnapharmIn_main02 = service.selectAnnapharmIn_main02();
		AnnapharmInVO AnnapharmIn_main03 = service.selectAnnapharmIn_main03();
		AnnapharmInVO AnnapharmIn_main04 = service.selectAnnapharmIn_main04();
		
		mnv.addObject("qnaList", qnaList);
		mnv.addObject("AnnapharmIn_main01", AnnapharmIn_main01);
		mnv.addObject("AnnapharmIn_main02", AnnapharmIn_main02);
		mnv.addObject("AnnapharmIn_main03", AnnapharmIn_main03);
		mnv.addObject("AnnapharmIn_main04", AnnapharmIn_main04);
		mnv.setViewName(url);
		
		
		
		return mnv;
	}

	// 개요 : 메인화면에서 로그인 없이 처방전 내역을 확인할 수 있는 버튼
	// 작성자 : 이병진
	@RequestMapping("/main/common/nonLoginReadPrescript")
	public ModelAndView nonLoginReadPrescript(ModelAndView mnv) throws Exception{
		String url = "main/common/nonLoginReadPrescript";

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue = "U000000") String mCode, Model model, HttpServletRequest request)
			throws Exception {
		String url = "main/common/indexPage";

		// List<MenuVO> menuList = menuService.getUserMenuList();
		// 로그인한 사용자가 의사일 경우
		// List<MenuVO> menuList = menuService.getDoctorMenuList();
		// 로그인한 사용자가 약사일 경우
		// List<MenuVO> menuList = menuService.getChemistMenuList();

		// MenuVO menu = menuService.getMenuByMcode(mCode);

		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO) session.getAttribute("loginUser");

		String Mcode = "U";

		if (mavo == null || mavo.equals("null")) {
			url = "main/common/indexPage";
		} else {

			if (mavo.getMemAuthority().equals("약사")) {
				url = "expert/main/indexPage";
			} else if (mavo.getMemAuthority().equals("관리자")) {
				url = "redirect:/manager/main.do";
			} else if (mavo.getMemAuthority().equals("일반")) {
				url = "main/common/indexPage";
			} else if (mavo.getMemAuthority().equals("의사")) {
				url = "redirect:/patient/main.do";
			}

		}

		List<MenuVO> menuList = menuService.selectMainMenu(Mcode);
		List<MenuVO> subMenuList = menuService.selectSubMenu2();

		//System.out.println(menu.toString());

		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuList", subMenuList);

		return url;
	}

	@RequestMapping("/mypageIndex")
	public String mypageIndex(@RequestParam(defaultValue = "U000001") String mCode, Model model,
			HttpServletRequest request) throws SQLException {
		String url = "mainAside/indexPage";

		//List<MenuVO> menuList = menuService.getUserMenuList();
		// 로그인한 사용자가 의사일 경우
		// List<MenuVO> menuList = menuService.getDoctorMenuList();
		// 로그인한 사용자가 약사일 경우
		// List<MenuVO> menuList = menuService.getChemistMenuList();

		//MenuVO menu = menuService.getMenuByMcode(mCode);

		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");

		String Mcode ="U";

//		if( mavo == null || mavo.equals("null")) {
//			url = "mainAside/mypage/myPastPrescription";
//		}else {
//
//			if(mavo.getMemAuthority().equals("약사")) {
//				url = "expert/main/indexPage";
//			}
//			else if(mavo.getMemAuthority().equals("관리자")){
//				url = "redirect:/manager/main.do";
//			}
//			else if(mavo.getMemAuthority().equals("일반")){
//				url = "mainAside/mypage/myPastPrescription";
//			}
//			else if(mavo.getMemAuthority().equals("의사")){
//				url = "redirect:/patient/main.do";
//			}
//
//		}


		List<MenuVO> menuList = menuService.selectMainMenu(Mcode);
		List<MenuVO> subMenuList = menuService.selectSubMenu2();

		//System.out.println(menu.toString());

		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuList", subMenuList);

		return url;
	}

	@RequestMapping("/subMenu")
	public ResponseEntity<List<MenuVO>> subMenuToJSON(String mCode, HttpServletRequest request, RedirectAttributes rttr, Model model) throws Exception {
		ResponseEntity<List<MenuVO>> entity = null;
		List<MenuVO> subMenu = null;

		try {
			subMenu = menuService.getSubMenuList(mCode);
			entity = new ResponseEntity<List<MenuVO>>(subMenu, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>( HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}


		return entity;
	}



	// 회원가입유형 선택 페이지
	@RequestMapping("/signUp/main")
	public String signUpForm() {
		String url = "common/signUpMain";
		return url;
	}

	// 의사 회원가입폼으로 이동
	@RequestMapping("/signUp/doctorResistForm")
	public ModelAndView doctorResistForm(ModelAndView mnv) throws SQLException {
		String url = "common/signUpFormDoctor";

		// 근무 병원 출력용 데이터 가져오기()
		List<HospitalVO> hospitalName = hospitalService.getHospitalName();

		// System.out.println("병원 개수 : " + hospitalName.size());

		mnv.addObject("hospitalName", hospitalName);
		mnv.setViewName(url);

		return mnv;
	}

	// 의사회원등록
	@RequestMapping(value = "/signUp/doctor", method = RequestMethod.POST)
	public String registDoctor(DoctorVO doctorVO) throws Exception {
		String url = "main/common/loginForm";

		// System.out.println(doctorVO.toString());
		// 회원 타입을 의사로 변경
		doctorVO.setMemAuthority("의사");

		if (memberService.isPatient(doctorVO.getMemRegnum()) == 1) {
			// 환자로 이미 등록되어있을때
			memberService.updateMemId(doctorVO);
		} else {
			// 환자로 등록되어있지 않을때
			PatientVO patient = new PatientVO();

			patient.setMemId(doctorVO.getMemId());
			String patientCode = "";
			for (int k = 0; k < 5; k++) {
				patientCode = "A" + (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 8);
				System.out.println(k + "번째 아이디 : " + patientCode);
			}
			patient.setPatientCode(patientCode);
			patient.setPatientName(doctorVO.getMemName());
			patient.setPatientRegnum(doctorVO.getMemRegnum());
			patient.setPatientPhone(doctorVO.getMemTel());
			patient.setPatientAddr(doctorVO.getMemAddr() + "$$" + doctorVO.getMemAddr2());

			memberService.insertPatient(patient);
		}

		memberService.insertMember(doctorVO);
		memberService.insertDoctor(doctorVO);

		return url;
	}

	// 약사 회원가입 폼
	@RequestMapping("/signUp/chemistResistForm")
	public String chemistResistForm() throws SQLException {
		String url = "common/signUpFormChemist";

		return url;
	}

	// 근무 약국 찾기 새창 화면 띄우기
	@RequestMapping("/signUp/list")
	public ModelAndView opensearchPharmacy(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "common/searchPharmacy";
		Map<String, Object> dataMap = pharmacyService.getPharmacyList(cri);

		if (cri.getKeyword() == null) {
			cri.setKeyword("");
		}
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	// 약사회원등록
	@RequestMapping(value = "/signUp/chemist", method = RequestMethod.POST)
	public String registChemist(ChemistVO chemistVO) throws Exception {
		String url = "main/common/loginForm";

		// 회원 타입을 약사로 변경
		chemistVO.setMemAuthority("약사");

		if (memberService.isPatient(chemistVO.getMemRegnum()) == 1) {
			// 환자로 이미 등록되어있을때
			memberService.updateMemId(chemistVO);
		} else {
			// 환자로 등록되어있지 않을때
			PatientVO patient = new PatientVO();

			patient.setMemId(chemistVO.getMemId());
			String patientCode = "";
			for (int k = 0; k < 5; k++) {
				patientCode = "A" + (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 8);
				System.out.println(k + "번째 아이디 : " + patientCode);
			}
			patient.setPatientCode(patientCode);
			patient.setPatientName(chemistVO.getMemName());
			patient.setPatientRegnum(chemistVO.getMemRegnum());
			patient.setPatientPhone(chemistVO.getMemTel());
			patient.setPatientAddr(chemistVO.getMemAddr() + "$$" + chemistVO.getMemAddr2());

			memberService.insertPatient(patient);
		}

		memberService.insertMember(chemistVO);
		memberService.insertChemist(chemistVO);

		return url;
	}

	// 일반 회원 회원가입
	@RequestMapping("/signUp/userResistForm")
	public String userResistForm() {
		String url = "common/signUpFormUser";
		return url;
	}

	// 일반회원등록
	@RequestMapping(value = "/signUp/user", method = RequestMethod.POST)
	public String registUser(MemberVO memberVO) throws Exception {
		String url = "main/common/loginForm";

		if (memberService.isPatient(memberVO.getMemRegnum()) == 1) {
			// 환자로 이미 등록되어있을때
			memberService.updateMemId(memberVO);
		} else {
			// 환자로 등록되어있지 않을때
			PatientVO patient = new PatientVO();

			patient.setMemId(memberVO.getMemId());
			String patientCode = "";
			for (int k = 0; k < 5; k++) {
				patientCode = "A" + (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 8);
				System.out.println(k + "번째 아이디 : " + patientCode);
			}
			patient.setPatientCode(patientCode);
			patient.setPatientName(memberVO.getMemName());
			patient.setPatientRegnum(memberVO.getMemRegnum());
			patient.setPatientPhone(memberVO.getMemTel());
			patient.setPatientAddr(memberVO.getMemAddr() + "$$" + memberVO.getMemAddr2());

			memberService.insertPatient(patient);
		}

		memberService.insertMember(memberVO);

		return url;
	}

	// 로그인 폼 이동
	@RequestMapping(value = "/common/loginForm", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue = "") String error, HttpServletResponse response, HttpServletRequest request) {
		String url = "main/common/loginForm";

		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");



		//System.out.println( mavo+"으아아~~~~~~~~~~~~~~~~");
		if( mavo == null || mavo.equals("null")) {

		}else {
			if( mavo.getMemAuthority().equals("약사")) {
				//url = "redirect:/expert/main.do";
				url = "redirect:/expert/main.do";
			}
			else if(mavo.getMemAuthority().equals("의사") ) {
				url = "redirect:/patient/list.do";
			}
			else if(mavo.getMemAuthority().equals("관리자")){
				url = "redirect:/manager/main.do";
			}
			else if(mavo.getMemAuthority().equals("일반")){
				url = "redirect:/index.do";
			}
		}

		if (error.equals("-1")) {
			response.setStatus(302);
		}
		return url;
	}

	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception{

		String url = "security/sessionOut";

		model.addAttribute("message", "세션이 만료되었습니다. \\n 다시 로그인 하세요!");
		return url;
	}

	// 로그인 후 회원별 메인페이지로 이동
//	@RequestMapping(value = "/common/login", method = RequestMethod.POST)
//	public String login(MemberVO member, HttpServletRequest request) throws Exception {
//		//member 안에 id, pwd만 들어있음
//		String url = "";
//		try {
//			//로그인한 유저의 아이디 존재, 비번 일치 확인
//			memberService.login(member.getMemId(), member.getMemPwd());
//			//로그인에 입력한 아이디, 비밀번호로 member 가져오기
//			member = memberService.getMember(member.getMemId());
//			//로그인한 사용자 마지막 로그인 시간 업데이트
//			memberService.updateLoginDate(member.getMemId());
//
//			ChemistVO chemist;
//			DoctorVO doctor;
//			MemberVO patient;
//			HttpSession session = request.getSession();
//
//			//로그인한 사용지의 유형에 따라
//			if( member == null || member.equals("null")) {
//				url = "redirect:/index.do";
//			}else {
//				if(member.getMemAuthority().equals("의사")) {
//					doctor = memberService.selectDoctorInfo(member.getMemId());
//					session.setAttribute("loginUser", doctor);
//				}
//				else if(member.getMemAuthority().equals("약사")) {
//					chemist = memberService.selectChemistInfo(member.getMemId());
//					session.setAttribute("loginUser", chemist);
//				}
//				else if(member.getMemAuthority().equals("일반")) {
//					patient= memberService.selectPatientInfo(member.getMemId());
//					session.setAttribute("loginUser", patient);
//				}
//				else if(member.getMemAuthority().equals("관리자")) {
//					session.setAttribute("loginUser", member);
//				}
//			}
//
//			session.setMaxInactiveInterval(6 * 60);
//
//			if( member == null || member.equals("null")) {
//				url = "redirect:/index.do";
//			}else {
//					if (member.getMemAuthority().equals("일반")) {
//						url = "redirect:/index.do";
//					}
//					else if (member.getMemAuthority().equals("의사")) {
//						url = "redirect:/patient/main.do";
//					}
//					else if (member.getMemAuthority().equals("약사")) {
//						url = "redirect:/expert/main.do";
//					}
//					else if(member.getMemAuthority().equals("관리자")) {
//						url= "redirect:/manager/main.do";
//					}
//			}
//
//		} catch (NotFoundIdException | InvalidPasswordException e) {
//			// e.printStackTrace();
//			request.setAttribute("message", e.getMessage());
//			url = "main/common/login_fail";
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			// Exceptin 처리
//			throw e;
//		}
//		return url;
//	}

	@RequestMapping("/common/foundIdPassword")
	public String foundIdPassword() {
		String url = "main/common/foundIdPassword";
		return url;
	}

//	@RequestMapping(value = "/foundPassword", method = RequestMethod.POST)
//	public ModelAndView foundPassword(MemberVO member, ModelAndView mnv, HttpServletRequest request) throws Exception {
//		String url = "redirect:/changePasswordForm";
//
//		System.out.println(member.toString());
//
//		String error = "";
//		if (memberService.getMember(member.getMemId()) == null) {
//			error = "존재하지 않는 아이디입니다.";
//		}
//
//		if (memberService.foundId(member) == null) {
//			error = "정보가 일치하지 않습니다!";
//		}
//
//		if (error != "") {
//			mnv.addObject("error", error);
//			url = "main/common/foundIdPassword";
//		}
//
//		mnv.addObject("memId", member.getMemId());
//		mnv.setViewName(url);
//
//		return mnv;
//	}

	@RequestMapping(value = "/changePasswordForm", method = RequestMethod.GET)
	public String changePasswordForm(Model model, HttpServletRequest request) {
		String url = "/main/common/changePassword";

		model.addAttribute("memId",request.getParameter("memId"));

		return url;
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword(MemberVO member, @RequestParam String memRePwd) throws Exception {
		String url = "redirect:common/loginForm";

		String error = "";

		System.out.println(member.toString());
		System.out.println(memRePwd);

		if(member.getMemPwd().equals(memRePwd)) {
			memberService.updatePwd(member);
			System.out.println("비번업데이트");
		}else {
			error = "비밀번호가 일치 하지않습니다.";
		}

		if(error != "") {
			url = "/main/common/changePassword";
		}

		return url;
	}

	@RequestMapping("/security/accessDenied")
	public void accessDenied() {
	}

	@RequestMapping("/loginTimeOut")
	public String loginTimeOut(Model model, HttpServletRequest request) throws Exception {
		String url = "redirect:index.do";

	    HttpSession session = request.getSession();
		session.invalidate();
		/* String url = "security/sessionOut"; */

		/* model.addAttribute("message", "세션이 만료되었습니다.\\n다시 로그인 하세요!"); */
		return url;
	}



	@RequestMapping(value = "/subMenu", method = RequestMethod.GET)
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;

		String mCode = request.getParameter("mCode");
		List<MenuVO> subMenu = null;

		try {
			subMenu = menuService.getSubMenuList(mCode);

			// 출력
			ObjectMapper mapper = new ObjectMapper();

			// content Type 결정
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			// 내보내기
			out.println(mapper.writeValueAsString(subMenu));

			// out 객체를 종료하고 환원.
			out.close();


		} catch (Exception e) {
			e.printStackTrace();
			// Exception 처리......
			throw e;
		}

		return url;

	}





//	@RequestMapping(value = "/mainMenuList.do")
//    public void mainMenuList(HttpServletResponse response) throws Exception {
//
//       PrintWriter out = null;
//
//       response.setCharacterEncoding("UTF-8");
//
//       List<MenuVO> menuList = menuService.selectMainMenu();
//
//       out = response.getWriter();
//
//       out.write(JsonUtil.ListToJson(menuList));
//    }
//
//


// @RequestMapping(value = "/subMenuList2.do")
//    public List<MenuVO> subMenuList(HttpServletRequest request, HttpServletResponse response, @RequestParam String menuId) throws Exception {
//
//
//       PrintWriter out = null;
//       request.setCharacterEncoding("utf-8");
//       response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json; charset=utf-8");
//
//       List<MenuVO> menuList22 = menuService.selectSubMenu2(menuId);
//
//       out = response.getWriter();
//
//
//
//       System.out.println(menuId);
//       System.out.println(menuList22+"아아악~~~~~~~!!!33");
//       //out.write(JsonUtil.ListToJson(menuList));
//
////       Gson gson = new Gson();
////
////		String jsonData = gson.toJson(menuList22);
////		out.write(jsonData);
////		response.flushBuffer();
//       return menuList22;
//
//    }






//	@RequestMapping(value = "/common/login", method = RequestMethod.POST)
//	public String login(String id, String pwd, HttpSession session) throws Exception {
//		String url = "redirect:/index.do";
//		try {
//			memberService.login(id, pwd);
//			session.setAttribute("loginUser", memberService.getMember(id));
//		} catch (NotFoundIdException | InvalidPasswordException e) {
//			//model.addAttribute("message", e.getMessage());
//			url = "common/login_fail";
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//			throw e;
//		}
//		return url;
//	}
//
//	@RequestMapping(value = "/common/logout", method = RequestMethod.GET)
//	public String logout(HttpSession session) {
//		String url = "redirect:/";
//		session.invalidate();
//		return url;
//	}


	//마이페이지 시작
//	@RequestMapping("/mypage/myPastPrescription/main")
//	public String myPastPrescription() {
//		String url = "mainAside/mypage/pastPrescriptionList";
//
//
//
//		return url;
//	}

	@RequestMapping("/mypage/myPharmacyIN/main")
	public String myPharmacyIN() {
		String url = "mainAside/mypage/myPharmacyIN";
		return url;
	}


	@RequestMapping("/mypage/inquiry/main")
	public String removeForm() {
		String url = "mainAside/mypage/inquiry";
		return url;
	}


	@RequestMapping("/mypage/userInfo/main")
	public String userInfo() {
		String url = "mainAside/mypage/infoModifyNomalUser";
		return url;
	}


	@RequestMapping("/mypage/member/removeForm")
	public String inquiry() {
		String url = "mainAside/mypage/passwordConfirm";
		return url;
	}


}
