package kr.or.annapharm.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AddMedicineListVO;
import kr.or.annapharm.service.ClassficationService;
import kr.or.annapharm.service.MedicineService;

@Controller
public class MedicineController {

	@Autowired
	private ClassficationService classficationService;
	
	@Autowired
	MedicineService medicineService;
	
	//----[처방전수정]--------------------
//	의사 : 약추가목록창
	@RequestMapping(value="/addMedicinalSearch", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<AddMedicineListVO>> addMedicineList(SearchCriteria cri) throws Exception{
		
		ResponseEntity<List<AddMedicineListVO>> entity = null;
		
//		System.out.println("키워드 : " + cri.getKeyword() + "구분 : " + cri.getSearchType() + "분류코드 : " + cri.getSearchType2());
		
		List<AddMedicineListVO> addMedicineList = medicineService.getAddMedicineList(cri);
		
		entity = new ResponseEntity<List<AddMedicineListVO>>(addMedicineList, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/addMedicinalDoctor")
	public ModelAndView addMedicinalDoctor(ModelAndView mnv) throws Exception{
		String url = "doctor/addMedicinalDoctor";
		
		SearchCriteria cri = null;
		
		Map<String, Object> dataMap2 = classficationService.getClassficationList(cri);
		
		mnv.addObject("dataMap2", dataMap2);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	//----[새처방작성]--------------------
	
	@RequestMapping(value="/addNewMedicinalSearch", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<AddMedicineListVO>> addNewMedicineList(SearchCriteria cri) throws Exception{
		
		ResponseEntity<List<AddMedicineListVO>> entity = null;
		
//		System.out.println("키워드 : " + cri.getKeyword() + "구분 : " + cri.getSearchType() + "분류코드 : " + cri.getSearchType2());
		
		List<AddMedicineListVO> addNewMedicineList = medicineService.getAddMedicineList(cri);

		entity = new ResponseEntity<List<AddMedicineListVO>>(addNewMedicineList, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/addNewMedicinalDoctor")
	public ModelAndView addNewMedicinalDoctor(ModelAndView mnv) throws Exception{
		String url = "doctor/addNewMedicinalDoctor";
		
		SearchCriteria cri = null;
		
		Map<String, Object> dataMap2 = classficationService.getClassficationList(cri);
		
		mnv.addObject("dataMap2", dataMap2);
		mnv.setViewName(url);
		
		return mnv;
	}
	

}
