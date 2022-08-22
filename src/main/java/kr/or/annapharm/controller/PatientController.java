package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.annapharm.dto.PrescriptionHistoryVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.MenuVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.service.IPatientService;
import kr.or.annapharm.service.MedicineService;
import kr.or.annapharm.service.MenuService;
import kr.or.annapharm.service.PrescriptionService;

@Controller
@RequestMapping("/patient")
public class PatientController {

	@Autowired
	private IPatientService ipatientService;

	@Autowired
	private PrescriptionService prescriptionService;

	@Autowired
	private MedicineService medicineService;


	@Autowired
	private MenuService menuService;


	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model) throws SQLException{
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");
		String url ="";
		String Mcode ="D";
		//System.out.println( mavo+"으아아~~~~~~~~~~~~~~~~");
		if( mavo == null || mavo.equals("null")) {
			url = "redirect:/index.do";
		}else {

			if(mavo.getMemAuthority().equals("약사")) {
				url = "redirect:expert/main.do";
			}
			else if(mavo.getMemAuthority().equals("관리자")){
				url = "redirect:/manager/main.do";
			}
			else if(mavo.getMemAuthority().equals("일반")){
				url = "redirect:/index.do";
			}
			else if(mavo.getMemAuthority().equals("의사")){
				url = "expert/main/indexPage_do";
			}

		}



		List<MenuVO> menuList = menuService.selectMainMenu(Mcode);
		List<MenuVO> subMenuList = menuService.selectSubMenu2();

		//System.out.println(menu.toString());



		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuList", subMenuList);

		return url;
	}





	@RequestMapping("/patientMypageMain")
	public String ExpertDashMypageMain(HttpServletRequest request, Model model) throws SQLException{
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");
		String url ="expertAside/indexPage_do";
		String Mcode ="D";

		//System.out.println( mavo+"으아아~~~~~~~~~~~~~~~~");
//		if( mavo == null || mavo.equals("null")) {
//			url = "redirect:/index.do";
//		}else {
//
//			if(mavo.getMemAuthority().equals("약사")) {
//				url = "expertDashBoard/mypage/main";
//			}
//			else if(mavo.getMemAuthority().equals("관리자")){
//				url = "redirect:/manager/main.do";
//			}
//			else if(mavo.getMemAuthority().equals("일반")){
//				url = "redirect:/index.do";
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




	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest request, ModelAndView mnv, Model model) throws Exception{

		String url = "doctor/prescription";

		String Mcode ="D";

//		List<Map<String, String>> list = ipatientService.getPatientList();


		// 처방 대기 환자 목록
		List<Map<String, String>> waitingList = ipatientService.getWaitingPatientList();

//		System.out.println("waitingList : " + waitingList);

		List<MenuVO> menuList = menuService.selectMainMenu(Mcode);
		List<MenuVO> subMenuList = menuService.selectSubMenu2();

		//System.out.println(menu.toString());



		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuList", subMenuList);



//		mnv.addObject("list", list);
		mnv.addObject("waitingList",waitingList);
		mnv.setViewName(url);
		return mnv;
	}

	// 헤지 : 수정 요청 창 출력
	@RequestMapping("/preUpdateRequest")
	public ModelAndView preUpdateRequest(String psCode, ModelAndView mnv) throws Exception {
		String url = "doctor/requestPreCheck";

		RequestPrescriptionChemistVO aa = prescriptionService.getPrescriptionRequest(psCode);

//		System.out.println("aa : " + aa);

		mnv.addObject("aa",aa);
		mnv.setViewName(url);

		return mnv;
	}

}
