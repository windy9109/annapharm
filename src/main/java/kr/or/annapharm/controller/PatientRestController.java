package kr.or.annapharm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionHistoryVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.PsStatusReadyPatientVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.service.IPatientService;
import kr.or.annapharm.service.MedicineService;
import kr.or.annapharm.service.PrescriptionService;

@RestController
@RequestMapping("/patient")
public class PatientRestController {

	@Autowired
	private IPatientService patientService;

	@Autowired
	private PrescriptionService prescriptionService;

	@Autowired
	private MedicineService medicineService;

	// 환자 선택 후 환자 정보 & 과거 처방 이력 출력
	@RequestMapping(value = "/readCode", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> readCode(PsStatusReadyPatientVO vo) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
//
//		// code -> 환자코드
//		System.out.println("코드 : " + code);
//		
//		System.out.println("이름 : " + date);

		// 처방 대기 환자 목록 중 환자 선택
		List<PatientVO> patientInfo = patientService.getWaitingPatientChoice(vo.getPatientCode());

		// 과거 처방 이력 목록
		List<PrescriptionHistoryVO> preInfo = patientService.getPatientPreList(vo);

//		System.out.println("patientInfo : " + patientInfo);
//		System.out.println("preInfo : " + preInfo);
//
//		System.out.println("RESTController 도착");

		for (PrescriptionHistoryVO vo1 : preInfo) {

			// String name = prescriptionService.getPrescriptionList(vo.getPs_code()); //-->
			// 2번 sql 구하는 service(약명)
			String medicineName = medicineService.getPrescriptionFirstMedicine(vo1.getPsCode());

			// int num = prescriptionService.getPrescriptionList(vo.getPs_code()); //--> 3번
			// sql 구하는 service(약 수)
			int medicineNum = medicineService.getPrescriptionMedicineCount(vo1.getPsCode());

			if (medicineNum == 1) {

				vo1.setMedicineName(medicineName);
			} else {
				vo1.setMedicineName(medicineName + "외" + (medicineNum - 1) + "개");
			}
		}

		// System.out.println("preInfo : " + preInfo);

		// System.out.println(medicineCount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("patientInfo", patientInfo); // 환자 정보
		map.put("preInfo", preInfo); // 해당 환자의 과거 처방 이력
		// map.put("medicineName", medicineName); // 처방전의 약 이름들
		// map.put("medicineCount", medicineCount);// 처방전의 약 갯수
		
		System.out.println("환자정보 : " + patientInfo);
		System.out.println("환자처방전정보 : " + preInfo);

//		entity = new ResponseEntity<PatientVO>(info, HttpStatus.OK);
		// entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		return entity;
	}

	// 처방 상세 이력 출력
	@RequestMapping(value = "/readPre", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> readPrescription(String psCode, String psStatus) throws Exception {

		// System.out.println("-----------------------------------------------------------------"+psCode);
		// System.out.println("psStatus : " + psStatus);
		ResponseEntity<Map<String, Object>> preEntity = null;

		List<PrescriptionDetailVO> detailInfo = prescriptionService.getPrescriptioinDetil(psCode);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("detailInfo", detailInfo);
		map.put("psStatus", psStatus);

		// System.out.println(detailInfo);

		preEntity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		return preEntity;
	}
	
	// 헤지 : 의사)처방완료환자목록
	@RequestMapping(value = "/psStatusReadyPatient", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> psStatusReadyPatientList(SearchCriteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> map = patientService.getPsStatusReadyList(cri);
		
//		System.out.println("vo : " + vo.get(1).getPatientName());
		
		entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
		return entity; 
	}

	// 의사 : 수정 처방전 저장
	@RequestMapping(value = "/medicineUpdate", method = RequestMethod.POST)
	public ResponseEntity<List<UpdatePrescriptionVO>> updatePrescriptionList(@RequestBody String arr) throws Exception {
		ResponseEntity<List<UpdatePrescriptionVO>> entity = null;

		// System.out.println("arr" + arr);

		ObjectMapper objectMapper = new ObjectMapper();

		List<String> arrList = objectMapper.readValue(arr, new TypeReference<List>() {});

		List<UpdatePrescriptionVO> vo = new ArrayList<UpdatePrescriptionVO>();

		for (int i = 0; i < arrList.size(); i++) {
			Map<String, String> arrListMap = objectMapper.readValue(arrList.get(i),
					new TypeReference<Map<String, String>>() {
					});
			UpdatePrescriptionVO updateVO = new UpdatePrescriptionVO(); // vo에 넣기위해
//			System.out.println("arrList : " + arrList);

			int code = Integer.parseInt(arrListMap.get("mdNo"));
//			String preDrugCount2 = arrListMap.get("preDrugCount");
//			System.out.println("preDrugCount2 : " + preDrugCount2);
			int preDrugCount = Integer.parseInt(arrListMap.get("preDrugCount"));
			int preDrugDay = Integer.parseInt(arrListMap.get("preDrugDay"));
//			System.out.println("arrListMap.get(\"pscode\")" + arrListMap.get("pscode"));
			String psCode = arrListMap.get("pscode");

			updateVO.setMdNo(code);
			updateVO.setPreDrugCount(preDrugCount);
			updateVO.setPreDrugDay(preDrugDay);
			updateVO.setPsCode(psCode);
			updateVO.setPreDrugNum(preDrugDay * preDrugCount);
			vo.add(updateVO);
		}

//		System.out.println("arrList2 : " + arrList);
//		System.out.println("vo : " + vo);

		// System.out.println("123" + arrList.size());

		// System.out.println("확인 : " + arrList.getClass().getSimpleName());

		prescriptionService.deleteOriginalPrescription(vo);
//		System.out.println("삭제 통과");
		prescriptionService.updatePrescription(vo);
//		System.out.println("업데이트 통과");
		return entity;
	}

	// 의사 : 새 처방전 작성
	@RequestMapping(value = "/newMedicineInsert", method = RequestMethod.POST)
	public ResponseEntity<List<UpdatePrescriptionVO>> newMedicineInsert(@RequestBody String registArr) throws Exception {

		ResponseEntity<List<UpdatePrescriptionVO>> entity = null;

		ObjectMapper objectMapper = new ObjectMapper();

		// 받아온 파라미터가 저장되어있는 배열(환자코드, 의사코드, 약번호, 횟수, 일수)
		List<String> registArrList = objectMapper.readValue(registArr, new TypeReference<List>() {});

		// 처방전
		PrescriptionVO preVo = new PrescriptionVO();
		// 약
		List<UpdatePrescriptionVO> voList = new ArrayList<UpdatePrescriptionVO>();

		String patientCode = "";
		String doctorCode = "";

		for (int i = 0; i < registArrList.size(); i++) {
			Map<String, String> arrListMap = objectMapper.readValue(registArrList.get(i), new TypeReference<Map<String, String>>() {});
			// 약 VO
			UpdatePrescriptionVO mediVo = new UpdatePrescriptionVO();

//			System.out.println("registArrList : " + registArrList);

			// 환자코드
			patientCode = arrListMap.get("patientCode");
			// 의사코드
			doctorCode = arrListMap.get("doctorCode");

			preVo.setPatientCode(patientCode);
			preVo.setDoctorCode(doctorCode);

			// 약번호
			int mdNo = Integer.parseInt(arrListMap.get("mdNo"));
			// 횟수
			int preDrugCount = Integer.parseInt(arrListMap.get("preDrugCount"));
			// 일수
			int preDrugDay = Integer.parseInt(arrListMap.get("preDrugDay"));

			mediVo.setMdNo(mdNo);
			mediVo.setPreDrugCount(preDrugCount);
			mediVo.setPreDrugDay(preDrugDay);
			mediVo.setPreDrugNum(preDrugCount * preDrugDay);

			voList.add(mediVo);
		}

//		System.out.println("registArrList : " + registArrList);

//		System.out.println("약VO1 : " + voList);

		// 처방전 추가
		String psCode = prescriptionService.insertNewPrescription(preVo);

		//System.out.println("처방전코드 : " + psCode);
		//System.out.println("---처방전 추가 통과 완료---");

		for (UpdatePrescriptionVO vo : voList) {
			vo.setPsCode(psCode);
		}

		//System.out.println("약VO2 : " + voList);

		// 약추가
		medicineService.insertNewMedicine(voList);
		//System.out.println("---약 추가 통과 완료---");

		// 처방전 작성한 환자 삭제
		patientService.deletePatientFromWaiting(patientCode);

		return entity;
	}

	// 헤지 : (의사)'수정요청'처방전 변경 후 저장 (처방전상태 변경, 대기열에서 환자 제거)
	@RequestMapping(value = "/updatePsStatus", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updatePsStatus(@RequestBody RequestPrescriptionChemistVO vo)
			throws Exception {

		//System.out.println("수정vo : " + vo);

		ResponseEntity<Map<String, Object>> entity = null;
		prescriptionService.updatePsStatusModify(vo);

		return entity;

	}

}
