package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnalysisPrescriptionVO;
import kr.or.annapharm.dto.DashBoardProductVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.MenuVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.SalesDashboardResultVO;
import kr.or.annapharm.service.ExpertDashBoardService;
import kr.or.annapharm.service.MenuService;
import kr.or.annapharm.service.SalesAnalysisService;

@Controller
@RequestMapping("expert")
public class ExpertDashBoardController{

//약국 메인대쉬보드
	@Autowired
	private ExpertDashBoardService service;

	@Autowired
	private MenuService menuService;

	@Autowired
	private SalesAnalysisService salesAnalysisService;

	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model) throws SQLException{
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");
		String url ="";
		String Mcode ="C";

		//System.out.println( mavo+"으아아~~~~~~~~~~~~~~~~");
		if( mavo == null || mavo.equals("null")) {
			url = "redirect:/index.do";
		}else {

			if(mavo.getMemAuthority().equals("약사")) {
				url = "expert/main/indexPage";
			}
			else if(mavo.getMemAuthority().equals("관리자")){
				url = "redirect:/manager/main.do";
			}
			else if(mavo.getMemAuthority().equals("일반")){
				url = "redirect:/index.do";
			}
			else if(mavo.getMemAuthority().equals("의사")){
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


	@RequestMapping("/expertDashBoard/mypage/main")
	public String expertMypageAside(HttpServletRequest request, Model model) throws SQLException{
		String url = "mainAside/mypage/myPharmacyIN";
		return url;
	}




	@RequestMapping("/expertMypageMain")
	public String ExpertDashMypageMain(HttpServletRequest request, Model model) throws SQLException{
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");
		String url ="expertAside/indexPage";
		String Mcode ="C";

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







	@RequestMapping("/expertDashBoard")
	public String expertDashBoard(HttpServletRequest request, Model model) throws SQLException{
		String url = "expert/main/expertDashBoard";

		return url;
	}



	@RequestMapping("/viewT/prescription")
	public ModelAndView list(ModelAndView mnv, HttpServletRequest request) throws Exception{

		String url = "expert/viewT/prescription";
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");


		List<Map<String, String>> list = service.getExpertDashBoardList(mavo);

		mnv.addObject("list", list);
		mnv.setViewName(url);
		return mnv;
	}



	@RequestMapping("/viewT/pharmacistIN")
	public ModelAndView pharmacistIN(ModelAndView mnv) throws Exception{
		String url = "expert/viewT/pharmacistIN";

		List<Map<String, String>> list = service.getPharmacistINList();

		mnv.addObject("list", list);
		mnv.setViewName(url);
		return mnv;
	}




	@RequestMapping("/viewT/cumulativeStock")
	public ModelAndView cumulativeStock(ModelAndView mnv, HttpServletRequest request) throws Exception{
		String url = "expert/viewT/cumulativeStock";
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");

		List<Map<String, String>> list = service.getCumulativeStockList(mavo.getMemId());

		mnv.addObject("list", list);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value = "/viewT/analysisPrescription", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<AnalysisPrescriptionVO>> analysisPrescription(@RequestBody SearchCriteria cri) throws Exception{
		ResponseEntity<List<AnalysisPrescriptionVO>> entity = null;

		List<AnalysisPrescriptionVO> list = service.getAnalysisPrescription(cri);

		entity = new ResponseEntity<List<AnalysisPrescriptionVO>>(list, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/viewT/selectSalesStatistics", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<PreferMedicineVO>> selectSalesStatistics(@RequestBody SearchCriteria cri) throws Exception{
		ResponseEntity<List<PreferMedicineVO>> entity = null;

		List<PreferMedicineVO> list = service.getSalesStatisticsList(cri);

		entity = new ResponseEntity<List<PreferMedicineVO>>(list, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/viewT/selectMaximumSalesList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<PreferMedicineVO>> selectMaximumSalesList(@RequestBody SearchCriteria cri) throws Exception{
		ResponseEntity<List<PreferMedicineVO>> entity = null;

		List<PreferMedicineVO> list = service.getMaximumSalesList(cri);

		entity = new ResponseEntity<List<PreferMedicineVO>>(list, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/viewT/stockList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<DashBoardProductVO>> StockController(@RequestBody SearchCriteria cri) throws Exception{
		ResponseEntity<List<DashBoardProductVO>> entity = null;

		System.out.println("gubun : " + cri.getKeyword());

		List<DashBoardProductVO> list = null;

		if(cri.getKeyword().equals("stockShortage")) {
			list = service.getStockShortageList();
		}else {
			list = service.getStockEXPList();
		}

		entity = new ResponseEntity<List<DashBoardProductVO>>(list, HttpStatus.OK);

		return entity;
	}

	// 개요 : 매출액 통계 일주일에 데이터를 보내는 컨트롤러
	// 작성자 : 이병진
	@RequestMapping(value = "/viewT/salesWeek")
	@ResponseBody
	public ResponseEntity<SalesDashboardResultVO> salesWeek(String pharmacyCode) throws Exception{
		ResponseEntity<SalesDashboardResultVO> entity = null;

		System.out.println("매출액 통계 약국 코드 :" + pharmacyCode);

		SalesDashboardResultVO sdrVO = salesAnalysisService.getWeekSalesListforDashboard(pharmacyCode);

		entity = new ResponseEntity<SalesDashboardResultVO>(sdrVO, HttpStatus.OK);

		return entity;
	}

	// 개요 : 매출액 통계 한달에 데이터를 보내는 컨트롤러
	// 작성자 : 이병진
	@RequestMapping(value = "/viewT/salesMonth")
	@ResponseBody
	public ResponseEntity<SalesDashboardResultVO> salesMonth(String pharmacyCode) throws Exception{
		ResponseEntity<SalesDashboardResultVO> entity = null;

		System.out.println("매출액 통계 약국 코드 :" + pharmacyCode);

		SalesDashboardResultVO sdrVO = salesAnalysisService.getMonthSalesListforDashboard(pharmacyCode);

		entity = new ResponseEntity<SalesDashboardResultVO>(sdrVO, HttpStatus.OK);

		return entity;
	}

	// 개요 : 매출액 통계 일년 데이터를 보내는 컨트롤러
	// 작성자 : 이병진
	@RequestMapping(value = "/viewT/salesYear")
	@ResponseBody
	public ResponseEntity<SalesDashboardResultVO> salesYear(String pharmacyCode) throws Exception{
		ResponseEntity<SalesDashboardResultVO> entity = null;

		SalesDashboardResultVO sdrVO = salesAnalysisService.getYearSalesListforDashboard(pharmacyCode);

		entity = new ResponseEntity<SalesDashboardResultVO>(sdrVO, HttpStatus.OK);

		return entity;
	}





//	@RequestMapping("/viewT/analysisPrescription_y")
//	public String analysisPrescription_y() throws SQLException{
//		String url = "expert/viewT/analysisPrescription_y";
//
//		return url;
//	}
//
//
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
