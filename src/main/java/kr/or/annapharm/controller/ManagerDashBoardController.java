package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.MenuVO;
import kr.or.annapharm.service.BoardService;
import kr.or.annapharm.service.ExpertDashBoardService;
import kr.or.annapharm.service.IPatientService;
import kr.or.annapharm.service.ManagerDashBoardService;
import kr.or.annapharm.service.MenuService;


@Controller
@RequestMapping("manager")
public class ManagerDashBoardController {

//관리자 메인대쉬보드
	@Autowired
	private ManagerDashBoardService service;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model) throws SQLException{
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");
		
		
		String url = "";
	

		
		//System.out.println( mavo+"으아아~~~~~~~~~~~~~~~~");
		if( mavo == null || mavo.equals("null")) {
			url = "redirect:/index.do";
		}else {
			
			if(mavo.getMemAuthority().equals("약사")) {
				url = "redirect:/expert/main.do";
			}
			else if(mavo.getMemAuthority().equals("관리자")){
				url = "manager/main/indexPage";
			}
			else if(mavo.getMemAuthority().equals("일반")){
				url = "redirect:/index.do";
			}
			else if(mavo.getMemAuthority().equals("의사")){
				url = "redirect:/patient/main.do";
			}
			
		}
		
		
		String Mcode ="M";
		
		List<MenuVO> menuList = menuService.selectMainMenu(Mcode);
		List<MenuVO> subMenuList = menuService.selectSubMenu2();

		//System.out.println(menu.toString());
		
		
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("subMenuList", subMenuList);
		
		return url;
	}
	
	
	
	@RequestMapping("/managerDashBoard")
	public String managerDashBoard(HttpServletRequest request, Model model) throws SQLException{
		String url = "manager/main/managerDashBoard";
		
		return url;
	}
	
	
	@RequestMapping("/viewT/memberCount")
	public ModelAndView list(ModelAndView mnv) throws Exception{
		
		String url = "manager/viewT/memberCount";

		String allCount = service.allCount();
		String allCountCompare = service.allCountCompare();
		String allPharmacy = service.allPharmacy();
		String allPountCompare = service.allPountCompare();
		String allDoctor = service.allDoctor();
		String allDoctorCompare = service.allDoctorCompare();
		String allNormal = service.allNormal();
		String allNormalCompare = service.allNormalCompare();
		String newCount = service.newCount();
		String newCountCompare = service.newCountCompare();
		
		
		
		mnv.addObject("allCount", allCount);
		mnv.addObject("allCountCompare", allCountCompare);
		mnv.addObject("allPharmacy", allPharmacy);
		mnv.addObject("allPountCompare", allPountCompare);
		mnv.addObject("allDoctor", allDoctor);
		mnv.addObject("allDoctorCompare", allDoctorCompare);
		mnv.addObject("allNormal", allNormal);
		mnv.addObject("allNormalCompare", allNormalCompare);
		mnv.addObject("newCount", newCount);
		mnv.addObject("newCountCompare", newCountCompare);
		mnv.setViewName(url);
		return mnv;
	}
	
	


	
	@RequestMapping("/viewT/visit")
	public String visit(){
		String url = "manager/viewT/visit";

		return url;
	}

	
	
	
//	@RequestMapping("/viewT/analysisPrescription_w")
//	public String analysisPrescription_w() throws SQLException{
//		String url = "expert/viewT/analysisPrescription_w";
//
//		return url;
//	}
//	
//	@RequestMapping("/viewT/analysisPrescription_m")
//	public String analysisPrescription_m() throws SQLException{
//		String url = "expert/viewT/analysisPrescription_m";
//
//		return url;
//	}
//	
//	
//	
//	@RequestMapping("/viewT/takeStatistics")
//	public String takeStatistics() throws SQLException{
//		String url = "expert/viewT/takeStatistics";
//
//		return url;
//	}
//	
//	
//	@RequestMapping("/viewT/takeStatistics_y")
//	public String takeStatistics_y() throws SQLException{
//		String url = "expert/viewT/takeStatistics_y";
//
//		return url;
//	}
//	
//	
//	
//	@RequestMapping("/viewT/takeStatistics_m")
//	public String takeStatistics_m() throws SQLException{
//		String url = "expert/viewT/takeStatistics_m";
//
//		return url;
//	}
//	
	
	


}