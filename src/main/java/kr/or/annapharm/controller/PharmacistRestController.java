package kr.or.annapharm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.ResponseExtractor;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.jsp.dto.MemberVO;

import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;
import kr.or.annapharm.dto.PrescriptionLogVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.ReadMedicineInfoVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.service.IPatientService;
import kr.or.annapharm.service.MedicineService;
import kr.or.annapharm.service.PrescriptionService;
import kr.or.annapharm.service.SalesAnalysisService;

@RestController
@RequestMapping("/pharmacist")
public class PharmacistRestController {

	@Autowired
	private IPatientService patientService;

	@Autowired
	private PrescriptionService prescriptionService;

	@Autowired
	private MedicineService medicineService;
	
	@Autowired
	private SalesAnalysisService salesanalysisService;
	
	@RequestMapping(value="/lookUp", method = RequestMethod.POST)
	public ResponseEntity<List<PatientVO>> lookUpPatient(@RequestParam String lookUpName, String lookUpBirth) throws Exception{
		ResponseEntity<List<PatientVO>> entity = null;

		//System.out.println("아이디 : " + lookUpName);
		//System.out.println("생년월일 : " + lookUpBirth);

		PatientVO vo = new PatientVO();
		vo.setPatientName(lookUpName);
		vo.setPatientRegnum(lookUpBirth);

		List<PatientVO> list = patientService.getPatentLsit(vo);

		entity = new ResponseEntity<List<PatientVO>>(list, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value="/preList", method = RequestMethod.POST)
	public ResponseEntity<List<PrescriptionLogVO>> patientPreList(String ptCode) throws Exception{

		ResponseEntity<List<PrescriptionLogVO>> entity = null;

		List<PrescriptionLogVO> list = patientService.getPatientPreListByPharmacist(ptCode);

		entity = new ResponseEntity<List<PrescriptionLogVO>>(list, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value="/medicineInfo", method = RequestMethod.POST)
	public ResponseEntity<ReadMedicineInfoVO> readMedicienInfo(@RequestParam String psCode) throws Exception{
		ResponseEntity<ReadMedicineInfoVO> entity = null;

		ReadMedicineInfoVO vo = prescriptionService.getMedicineInfo(psCode);

		entity = new ResponseEntity<ReadMedicineInfoVO>(vo, HttpStatus.OK);

		return entity;
	}
	
	@RequestMapping(value="/medicineInfoChoice", method = RequestMethod.POST)
	public ResponseEntity<ReadMedicineInfoVO> readMedicienInfoChoice(@RequestParam String mdNo) throws Exception{
		ResponseEntity<ReadMedicineInfoVO> entity = null;

		System.out.println("약번호 : " + mdNo);
		
		ReadMedicineInfoVO vo = prescriptionService.getMedicineInfoChoice(mdNo);

		entity = new ResponseEntity<ReadMedicineInfoVO>(vo, HttpStatus.OK);

		return entity;
	}
	
	// 헤지 : 약사 -> 처방전 목록 중 상세보기할 처방전 하나 선택
	@RequestMapping(value="/prescriptionDetail", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> readPrescriptionDetail(@RequestParam String psCode) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> map = prescriptionService.getPrescriptionDetailForPharmacist(psCode);
		
		entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
				
		return entity;
	}
	
	// 헤지 : 약사) 비처방조제 저장
	@RequestMapping(value="/newMedicineInsertForChemicist", method = RequestMethod.POST)
	public ResponseEntity<List<UpdatePrescriptionVO>> newMedicineInsertForChemist(@RequestBody String arr) throws Exception{

		ResponseEntity<List<UpdatePrescriptionVO>> entity = null;
		
		ObjectMapper objectMapper = new ObjectMapper();
		
// 		// 처방전
		UpdatePrescriptionVO preVo = new UpdatePrescriptionVO();
//		// 약
		List<UpdatePrescriptionVO> voList = new ArrayList<UpdatePrescriptionVO>();

		System.out.println("arr : " + arr);
//		
		// 받아온 파라미터가 저장되어있는 배열(환자코드, 약번호, 횟수, 일수)
		List<String> registArrList = objectMapper.readValue(arr, new TypeReference<List>() {});
		System.out.println("registArrList : " + registArrList);
		String patientCode = "";
		String chemistCode = "";
		String pharmacyCode = "";
		
		for(int i = 0; i < registArrList.size(); i++) {
			Map<String, String> arrListMap = objectMapper.readValue(registArrList.get(i), new TypeReference<Map<String, String>>() {});
			
			patientCode = (String)arrListMap.get("partientCode");
//			System.out.println("arrListMap" + arrListMap);
//			System.out.println("arrListMap.get('patientCode') : " + patientCode);
			
			// 약 VO
			UpdatePrescriptionVO mediVo = new UpdatePrescriptionVO();
			
			// 환자코드
			patientCode = arrListMap.get("patientCode");
			// 약사코드
			chemistCode = arrListMap.get("chemistCode");
			// 약국코드
			pharmacyCode = arrListMap.get("pharmacyCode");
			
//			System.out.println("환자코드 : " + patientCode);

			preVo.setPatientCode(patientCode);
			preVo.setChemistCode(chemistCode);
			preVo.setPharmacyCode(pharmacyCode);
//			// 약번호
			int mdNo = Integer.parseInt(arrListMap.get("mdNo"));
//			// 횟수
			int preDrugCount = Integer.parseInt(arrListMap.get("preDrugCount"));
//			// 일수
			int preDrugDay = Integer.parseInt(arrListMap.get("preDrugDay"));
//			
			mediVo.setMdNo(mdNo);
			mediVo.setPreDrugCount(preDrugCount);
			mediVo.setPreDrugDay(preDrugDay);
			mediVo.setPreDrugNum(preDrugCount * preDrugDay);
//			
			voList.add(mediVo);
		}
		
//		System.out.println("registArrList : " + registArrList);
		
//		System.out.println("약VO1 : " + voList);
		
//		System.out.println("처방전 : " + preVo);
		
		// 처방전 추가
		String psCode = prescriptionService.insertPrescriptionForChemist(preVo);
		
//		System.out.println("처방전코드 : " + psCode);
//		System.out.println("---처방전 추가 통과 완료---");
		
		for(UpdatePrescriptionVO vo : voList) {
			vo.setPsCode(psCode);
		}
		
		// 약추가
		medicineService.insertNewMedicineForChemist(voList);
		
		return entity;
	}
	
	// 헤지 : 약사) 비처방조제 저장
		@RequestMapping(value="/chemistPrescriptionComplete", method = RequestMethod.POST)
		public ResponseEntity<List<PrescriptionCompleteVO>> chemistPrescriptionComplete(@RequestBody String arr) throws Exception{
			
			ResponseEntity<List<PrescriptionCompleteVO>> entity = null;
			
			ObjectMapper objectMapper = new ObjectMapper();
			
			// 처방전
			PrescriptionCompleteVO preVO = new PrescriptionCompleteVO();
			// 판매데이터
			PrescriptionCompleteVO saleVO = new PrescriptionCompleteVO();
			// 판매약
			List<PrescriptionCompleteVO> saleCartVO = new ArrayList<PrescriptionCompleteVO>();
			
			// 받아온 파라미터가 저장되어있는 배열
			List<String> registArrList = objectMapper.readValue(arr, new TypeReference<List>() {});
			
//			System.out.println("registArrList : " + registArrList);
			
			String psCode = "";	// 처방전코드
			String chemistCode = "";	// 약사코드
			String pharmacyCode = "";	// 약국코드
			String patientCode = "";	// 환자코드
			String mdNo = "";	// 약번호
			int mediNum = 0;	// 약 갯수
			String saleCartPrice = "";	// 약의 각각 가격
			String salePrice = "";	// 총 판매가
			
			for(int i = 0; i < registArrList.size(); i++) {
				Map<String, String> arrListMap = objectMapper.readValue(registArrList.get(i), new TypeReference<Map<String, String>>() {});
				
				PrescriptionCompleteVO mediVo = new PrescriptionCompleteVO();
				
				psCode = arrListMap.get("psCode");
				chemistCode = arrListMap.get("chemistCode");
				pharmacyCode = arrListMap.get("pharmacyCode");
				patientCode = arrListMap.get("patientCode");
				mdNo = arrListMap.get("mdNo");
				mediNum = Integer.parseInt(arrListMap.get("mediNum"));
				saleCartPrice = arrListMap.get("saleCartPrice");
				salePrice = arrListMap.get("salePrice");
				
//				System.out.println("psCode : " + psCode);
//				System.out.println("patientCode : " + patientCode);
//				System.out.println("mdNo : " + mdNo);
//				System.out.println("mediNum : " + mediNum);
//				System.out.println("saleCartPrice : " + saleCartPrice);
//				System.out.println("salePrice : " + salePrice);
				
				// 처방전 상태변경
				preVO.setPsCode(psCode);	// 처방전코드
				preVO.setChemistCode(chemistCode);	// 약사코드
				preVO.setPharmacyCode(pharmacyCode);	// 약국코드
				
				// sale 테이블
				saleVO.setPsCode(psCode);	// 처방전코드
				saleVO.setPatientCode(patientCode);	// 환자코드
				saleVO.setChemistCode(chemistCode);	// 약사코드
				saleVO.setSalePrice(salePrice); // 총 판매가
				
				mediVo.setMdNo(mdNo);
				mediVo.setSaleCartNum(mediNum);
				mediVo.setSaleCartPrice(saleCartPrice);
				
				saleCartVO.add(mediVo);
				
//				System.out.println("mediVo -> " + mediVo);
			}
			
//			System.out.println("saleCartVO -> " + saleCartVO);
			
			// 처방전상태 변경
			prescriptionService.updatePrescriptionComplete(preVO);
//			System.out.println("---처방전 상태 변경 완료---");
			
			// sale테이블 insert
			String saleNo = salesanalysisService.insertSalePrescription(saleVO);
//			System.out.println(" -- sale테이블 insert -- ");
			
			// sale_cart 테이블 insert
			// sale테이블 insert할때 생성한 saleNo를 리턴해서 다시 saleCart테이블에 insert한다.
			for(PrescriptionCompleteVO vo : saleCartVO) {
				vo.setSaleNo(saleNo);
			}
			salesanalysisService.insertSaleCartMedicine(saleCartVO);
//			System.out.println(" -- saleCart테이블 insert -- ");
			
			// 처방전 작성한 환자 삭제
			
			return entity;
		}



}
