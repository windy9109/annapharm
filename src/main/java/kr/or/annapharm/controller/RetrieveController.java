package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.service.ProductService;
import kr.or.annapharm.service.RetrieveService;

@Controller
public class RetrieveController {


	@Autowired
	RetrieveService retrieveService;

	//회수하는 페이지 이동
	@RequestMapping("/retrieve/list")
	public ModelAndView retrieveMain(SearchCriteria cri, ModelAndView mnv, HttpSession request) throws SQLException{
		String url ="expert/recallRequest/RecallRequest";
		mnv.setViewName(url);
		return mnv;
	}

	//회수할 재고 출력 iframe
	@RequestMapping("/retrieve/productListIframe")
	public ModelAndView productListIframe(SearchCriteria cri, ModelAndView mnv, HttpSession request) throws SQLException {
		String url = "expert/recallRequest/RetrieveProductListIframe";

		ChemistVO chemist = (ChemistVO) request.getAttribute("loginUser");
//		System.out.println("///////////////"+chemist.toString());

		String pharmacyCode = chemist.getPharmacyCode();
		cri.setPharmacyCode(pharmacyCode);

		Map<String, Object> dataMap = retrieveService.getRetrieveProductList(cri);

		mnv.addObject("dataMap", dataMap);

		mnv.setViewName(url);
		return mnv;
	}



	//회수내역확인 페이지 이동
	@RequestMapping("/retrieveList/list")
	public ModelAndView retrieveList(SearchCriteria cri, ModelAndView mnv,HttpSession request) throws SQLException {
		String url = "/expert/recallRequest/RecallList";

		ChemistVO chemist = (ChemistVO) request.getAttribute("loginUser");

		String pharmacyCode = chemist.getPharmacyCode();
		cri.setPharmacyCode(pharmacyCode);
		cri.setPerPageNum(9);

		System.out.println("/////////////////////////"+cri.getStartDate());

		Map<String, Object> dataMap = retrieveService.getRetrieveList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
}
