package kr.or.annapharm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AddMedicineListVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.service.ClassficationService;
import kr.or.annapharm.service.IPatientService;
import kr.or.annapharm.service.MedicineService;
import kr.or.annapharm.service.MemberService;
import kr.or.annapharm.service.PrescriptionService;

@Controller
@RequestMapping("/pharmacist")
public class PharmacistController {
	
	@Autowired
	private IPatientService ipatientService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MedicineService medicineService;
	
	@Autowired
	private PrescriptionService prescriptionService;
	
	@Autowired
	private ClassficationService classficationService;

	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv) {
		String url = "prescript/main";

		mnv.setViewName(url);
		return mnv;
	}
	
	// 헤지 : 약사 환자 등록 창 출력
	@RequestMapping("/addPatient")
	public ModelAndView addMedicinalDoctor(ModelAndView mnv) throws Exception{
		String url = "prescript/addPatient";
		
		SearchCriteria cri = null;
		
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	// 헤지 : 약사가 환자 등록
	@RequestMapping("/insertMemberForPharmacist")
	public ModelAndView insertMemberForPharmacist(MemberVO member, ModelAndView mnv) throws Exception{
//		String url = "redirect:main";
		
		String url = "prescript/addPatient";
		
		Map<String, Object> dataMap =  memberService.insertMemberForPharmacist(member);
		// 
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	// 헤지 : 약사 수정 요청 창 출력
	@RequestMapping("/requestUpdatePrescription")
	public ModelAndView requestUpdatePrescription(ModelAndView mnv) throws Exception {
		String url = "prescript/requestPrescript";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	// 헤지 : 약사 수정 요청
	@RequestMapping("/preUpdateRequestChemist")
	public ModelAndView preUpdateRequest(RequestPrescriptionChemistVO vo, ModelAndView mnv) throws Exception{
		String url = "redirect:main";

//			System.out.println("약사 수정 요청 : " + vo);
			
		prescriptionService.updatePrescriptionRequest(vo);
			
		ipatientService.insertWaitingPatient(vo);
			
		mnv.setViewName(url);
		return mnv;
	}
		
	// 헤지 : 약사 비처방 조제 약 추가
	@RequestMapping("/addMedicinalChemist")
	public ModelAndView addMedicinalChemist(ModelAndView mnv) throws Exception{
		String url = "prescript/addNewMedicinalChemist";
			
		SearchCriteria cri = null;
			
		Map<String, Object> dataMap2 = classficationService.getClassficationList(cri);
			
		mnv.addObject("dataMap2", dataMap2);
		mnv.setViewName(url);
			
		return mnv;
	}
	
	// 헤지 : 약사 비처방 조제 약 추가창에서 검색
	@RequestMapping(value="/addMedicinalSearchForChemist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<AddMedicineListVO>> addMedicinalSearchForChemist(SearchCriteria cri) throws Exception{
		
		ResponseEntity<List<AddMedicineListVO>> entity = null;
		
		List<AddMedicineListVO> addMedicineList = medicineService.getAddMedicineList(cri);
		
		entity = new ResponseEntity<List<AddMedicineListVO>>(addMedicineList, HttpStatus.OK);
		
		return entity;
	}

}
