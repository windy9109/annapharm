package kr.or.annapharm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.CompareMedicineVO;
import kr.or.annapharm.dto.LongPrescriptionCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.SelectListVO;
import kr.or.annapharm.service.BusinessService;

@Controller
@RequestMapping("/expert/business")
public class BusinessController {
	
	@Autowired
	BusinessService service;  
	
	@RequestMapping("/visitor")
	public String visitor() throws Exception {
		String url = "/expert/business_management/visitor_analysis";
		return url;
	}
	
	@RequestMapping("/compare")
	public String compare() throws Exception {
		String url = "/expert/business_management/company_compare";
		return url;
	}
	
	@RequestMapping("/goOrder")
	public ModelAndView goOrder(String chemistCode, ModelAndView mnv) throws Exception{
		String url = "expert/product/orderWrite";
		
		List<SelectListVO> list = service.getSelectList(chemistCode);
		
		
		mnv.setViewName(url);
		mnv.addObject("selectList",list);
		
		return mnv;
	}
	
	@RequestMapping(value = "/compare/mdsearch/{keyword}/{page}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchMedicine(@PathVariable("keyword")String keyword,@PathVariable("page")int page) throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(keyword);
		cri.setPage(page);
		
		Map<String, Object> dataMap = service.searchMedicineList(cri);
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/compare/basearch/{keyword}/{page}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchBasis(@PathVariable("keyword")String keyword,@PathVariable("page")int page) throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(keyword);
		cri.setPage(page);
		
		Map<String, Object> dataMap = service.searchBasisList(cri);
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/visitor/agebysex", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> selectList(@RequestBody SearchCriteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> list = service.getSalesByAgeList(cri);
		
		entity = new ResponseEntity<Map<String, Object>>(list,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/visitor/prefermedicine", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> preferMedicineList(@RequestBody PreferMedicineVO preferMedicineVO, HttpServletRequest request) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = service.getPreferMedicineList(preferMedicineVO);
		
		String chemistCode = "F00001";
		
		List<SelectListVO> selectList = service.getSelectList(chemistCode);
		
		List<PreferMedicineVO> PreferMedicineList = (List<PreferMedicineVO>) dataMap.get("preferMedicineList");
		
		List<String> companyList = PreferMedicineList.stream().map(e -> e.getMiCompany()).collect(Collectors.toCollection(ArrayList::new));
		
		companyList = companyList.stream().distinct().collect(Collectors.toList());
		
		for(String company: companyList) {
			System.out.println(company);
		}
		
		int count = selectList.size();
		
		for(PreferMedicineVO vo : PreferMedicineList) {
			if(count <= 0) break;
			for(SelectListVO selectVO : selectList) {
				if(selectVO.getMdNo() == vo.getMdNo()) {
					vo.setSelectMd("far fa-minus-square");
					count--;
				}
			}
		}
		dataMap.put("companyList",companyList);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/visitor/longPrescription", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> longPrescriptionList(@RequestBody LongPrescriptionCommandVO commandVO) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;		
		
		Map<String,Object> dataMap = service.getLongPrescriptionList(commandVO);		
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/visitor/longPrescriptionDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<LongPrescriptionDetailVO>> longPrescriptionDetail(@RequestBody LongPrescriptionCommandVO commandVO, HttpServletRequest request) throws Exception{
		ResponseEntity<List<LongPrescriptionDetailVO>> entity = null;
		
		List<LongPrescriptionDetailVO> longPrescriptionDetailList = service.getLongPrescriptionDetailList(commandVO.getPsCode());	
		
		entity = new ResponseEntity<List<LongPrescriptionDetailVO>>(longPrescriptionDetailList, HttpStatus.OK);
		
		HttpSession session = request.getSession();
		
		ChemistVO chemistVO = (ChemistVO) session.getAttribute("loginUser");
		
		List<SelectListVO> selectList = service.getSelectList(chemistVO.getChemistCode());
		
		int count = selectList.size();
		
		for(LongPrescriptionDetailVO compareVO : longPrescriptionDetailList) {
			if(count <= 0) break;
			for(SelectListVO selectVO : selectList) {
				if(selectVO.getMdNo() == Integer.parseInt(compareVO.getMdNo())) {
					compareVO.setSelectMd("far fa-minus-square");
					count--;
				}
			}
		}
		return entity;
	}

	
	// String chemistCode 대신에 request를 가져와서 session에 약사 코드를 가져오면 된다.
	// 로그인 구현이후!!!!!!!
	@RequestMapping(value = "/compare/list/{chemistCode}/{miMaincode}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<CompareMedicineVO>> compareList(@PathVariable("miMaincode")String miMaincode, @PathVariable("chemistCode")String chemistCode) throws Exception{
		
		List<CompareMedicineVO> compareList = service.getCompareList(miMaincode);
		List<SelectListVO> selectList = service.getSelectList(chemistCode);
		
		int count = selectList.size();
		
		for(CompareMedicineVO compareVO : compareList) {
			if(count <= 0) break;
			for(SelectListVO selectVO : selectList) {
				if(selectVO.getMdNo() == compareVO.getMdNo()) {
					compareVO.setSelectMd("far fa-minus-square");
					count--;
				}
			}
		}
		
		ResponseEntity<List<CompareMedicineVO>> entity = null;
		
		entity = new ResponseEntity<List<CompareMedicineVO>>(compareList, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/compare/addselectlsit", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<SelectListVO>> addSelectList(@RequestBody SelectListVO selectListVO) throws Exception{
		
		ResponseEntity<List<SelectListVO>> entity = null;
		
		
		if(selectListVO.getMdNo() != 0 && !selectListVO.getSelectMd().equals("no")) {
			service.selectListAddDel(selectListVO);			
		}
	
		List<SelectListVO> selectList = service.getSelectList(selectListVO.getChemistCode());
		
		entity = new ResponseEntity<List<SelectListVO>>(selectList,HttpStatus.OK);
		
		return entity;
	}
	
	

}
