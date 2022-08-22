package kr.or.annapharm.service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SalesAnalysisCommand;
import kr.or.annapharm.dao.MedicienBillDAO;
import kr.or.annapharm.dao.MedicineDAO;
import kr.or.annapharm.dao.PrescriptionDAO;
import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.ReadMedicineInfoVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.SalesAnalysisVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.dto.MedicienBillVO;
import kr.or.annapharm.dto.MedicienCalculatVO;
import kr.or.annapharm.dto.PreDetailForPharmacistVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;

public class PrescriptionServiceImpl implements PrescriptionService {

	private PrescriptionDAO prescriptionDAO;
	public void setPrescriptionDAO(PrescriptionDAO prescriptionDAO) {
		this.prescriptionDAO = prescriptionDAO;
	}
	
	private MedicienBillDAO medicienBillDAO;
	public void setMedicienBillDAO(MedicienBillDAO medicienBillDAO) {
		this.medicienBillDAO = medicienBillDAO;
	}

	@Override
	public List<PrescriptionVO> getPrescriptionList(String prescriptionCode) throws Exception {
		List<PrescriptionVO> prescriptionList = null;

		prescriptionList = prescriptionDAO.selectPrescriptionList(prescriptionCode);

		return prescriptionList;
	}

	@Override
	public PrescriptionVO getPrescriptionOne(PrescriptionVO vo) throws Exception {
		PrescriptionVO prescriptionOne = null;

		prescriptionOne = prescriptionDAO.selectPrescriptionOne(vo);

		return prescriptionOne;
	}

	@Override
	public int getPrescriptionCount(String patientCode) throws Exception {
		int prescriptionCount = 0;

		prescriptionCount = prescriptionDAO.selectPrescriptionCount(patientCode);

		return prescriptionCount;
	}

	// 과거 처방 이력에서 처방전 선택 -> 해당 처방전의 상세내역 출력 (헤지)
	@Override
	public List<PrescriptionDetailVO> getPrescriptioinDetil(String psCode) throws Exception {
		List<PrescriptionDetailVO> prescriptionDetail = null;

		prescriptionDetail = prescriptionDAO.selectPrescriptionDetail(psCode);

		return prescriptionDetail;
	}

	// 개요 : 약사 조제 화면에서 약의 정보를 확인할 수 있게 도와주는 외부 URL을 가져오기 위한 메서드
	// 작성자 : 이병진
	@Override
	public ReadMedicineInfoVO getMedicineInfo(String psCode) throws Exception {
		// 의약품 안전나라 약품 상세 URL
		String detailUrl = "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=";

		ReadMedicineInfoVO vo = prescriptionDAO.selectMedicineInfoOne(psCode);
		String medicienUrl = detailUrl + vo.getMdNo();
		vo.setMdUrl(medicienUrl);

		return vo;
	}
	
	// 헤지 : 선택한 약의 상세정보
	@Override
	public ReadMedicineInfoVO getMedicineInfoChoice(String mdNo) throws Exception {
		// 의약품 안전나라 약품 상세 URL
		String detailUrl = "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=";
		
		ReadMedicineInfoVO vo = prescriptionDAO.selectMedicineInfoOneMdNo(mdNo);
		String medicienUrl = detailUrl + vo.getMdNo();
		vo.setMdUrl(medicienUrl);

		return vo;
	}

	// 헤지 : 기존 처방전 삭제
	@Override
	public void deleteOriginalPrescription(List<UpdatePrescriptionVO> voList) throws Exception {
		
		prescriptionDAO.deleteOriginalPrescription(voList.get(0).getPsCode());
		
	}

	// 헤지 : 수정 처방전 추가
//	@Override
//	public void insertUpdatePrescription(UpdatePrescriptionVO vo) throws SQLException {
//		
//		insertUpdatePrescription(vo);
//	}

	// 헤지 : 기존 처방전 삭제 후 수정 처방전 추가
	@Override
	public void updatePrescription(List<UpdatePrescriptionVO> voList) throws Exception {
		// System.out.println("업데이트 서비스");
		for(UpdatePrescriptionVO vo : voList) {
			// System.out.println("업데이트 서비스 22");
			prescriptionDAO.insertUpdatePrescription(vo);
		}
		
	}
	
	// 헤지 : 새 처방전 작성(처방전추가)
	@Override
	public String insertNewPrescription(PrescriptionVO vo) throws Exception {
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		String formatedNow = now.format(formatter);
		
//		System.out.println(formatedNow);
		//String psCode = concat(replace(to_char(sysdate), '/', ''),lpad(pre_num_seq.nextval,4,0));
		
		//String psCode = sysdate + dao.nextValue();
		//vo.setPsCode(psCode);
		
		String psCode = formatedNow + prescriptionDAO.selectPreNumSeq();
		System.out.println("처방전 코드 : " + psCode);
		
		vo.setPsCode(Long.parseLong(psCode));
		
		prescriptionDAO.insertNewPrescription(vo);
//		
//		// 약 추가 테이블
//		UpdatePrescriptionVO mediVo = new UpdatePrescriptionVO();
//		 
//		mediVo.setPsCode(psCode);
//		
		// 처방전을 insert 한 후 psCode를 리턴해준다.
		return psCode;
		
	}

	// 헤지 : 약사 -> 처방전 목록 중 상세보기할 처방전 하나 선택
	@Override
	public Map<String, Object> getPrescriptionDetailForPharmacist(String psCode) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		// 위에정보
		PreDetailForPharmacistVO pdvo = prescriptionDAO.selectPrescriptionUpDetailForPharmacist(psCode);
		
		// 약사, 약국명정보
		PreDetailForPharmacistVO pdvo2 = prescriptionDAO.selectChemistNameForPharmacist(psCode);
		
		System.out.println("pdvo : " + pdvo);
		System.out.println("pdvo2 : " + pdvo2);
		
		// 아래정보
		List<PreDetailForPharmacistVO> pdList = prescriptionDAO.selectPrescriptionDownDetailForPharmacist(psCode);
		
		MedicienBillVO billVO = medicienBillDAO.getMedicienBill();
		int bill1 = billVO.getManageBill(); // 약국관리료
		int bill2 = billVO.getMedicineBasicBill(); // 조제기본료
		int bill3 = billVO.getTakingMedicineBill(); // 복약지도료
		int bill4 = billVO.getMedicineBill(); // 처방조제료
		int bill5 = billVO.getMedicalManageBill(); // 의약품 관리료
		int bill6 = billVO.getMedicalManageDrugBill(); // 의약품관리료(마약류)
		
		double total; // 약제비 총액
		double medicienTotal=0; // 약값 전체
		double medicineSum; // 조제료 합
		double patientFee; // 본인부담금
		int prescriptionDay=0; // 처방일
		String drug = null; // 마약류 확인
		
		// 처방전에서 약을 하나씩 꺼내서 조제료를 계산하는 작업
		for(PreDetailForPharmacistVO vo : pdList ) {
			total = 0;
			prescriptionDay = 0;
			int preDrugNum = vo.getPreDrugCount() * vo.getPreDrugDay();

			// 약값 구하기
			prescriptionDay = vo.getPreDrugDay();
			drug = vo.getMdDrug();

			// 약가 총합
			double medicienPrice = vo.getMiPrice();
			medicienTotal += medicienPrice;
		}
		// 조제료 구하기
		double medicineBill = bill4; // 처방조제료
		int medicalManageBill = bill5; // 의약품관리료
		// 처방 조제료 계산(하루마다 1.1%씩 증가)
		for(int i = 1; i < prescriptionDay; i++) {
			medicineBill = Math.round(medicineBill * 1.1);
		}
		// 마약류이면 가격 변경
		if(drug != null && !drug.equals("-")) {
			medicalManageBill = bill6;
		}
		// 조제료 : 약국관리료 + 조제기본료 + 복약지도료 + 의약품관리료 + 처방조제료(원 미만 반올림)
		medicineSum = Math.round(bill1 + bill2 + bill3 + medicineBill + medicalManageBill);
		
//		System.out.println("medicineSum : " + medicineSum);
//		System.out.println("medicienTotal : " + medicienTotal);
		
	

		// 약제비 총액 : 10원 미만 절사
		total = Math.floor((medicienTotal + medicineSum)/10) * 10;
		// 본인부담금 : 100원 미만 절사
		patientFee = Math.floor((total * 20/100)/100) * 100;

		pdvo.setTotalMedicienBill(total); // 총 약제비
		pdvo.setCharge(total - patientFee); // 청구액
		pdvo.setPatientCharge(patientFee); // 본인부담금

//		System.out.println("처방전코드 : " + psCode);
		
//		System.out.println("DAO통과" + pdvo);
		
		if(pdvo.getPsType().equals("비처방")) {
			pdvo.setHospitalName("-");
			pdvo.setMemName("-");
			
//			System.out.println("병원이름 : " + pdvo.getHospitalName());
//			System.out.println("의사이름 : " + pdvo.getMemName());
		}
		
		dataMap.put("pdList", pdList);
		dataMap.put("pdvo", pdvo);
		dataMap.put("pdvo2", pdvo2);
		
		return dataMap;
	}
	
	// 헤지 : 약사) 처방전 목록 중 상세보기할 처방전 하나 선택(약사명, 약국명, 약국코드 가져오기)
	@Override
	public Map<String, Object> getChemistDetailForPharmacist(String psCode) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 약국명, 약사이름
		PreDetailForPharmacistVO chemistInfo = prescriptionDAO.selectChemistNameForPharmacist(psCode);
		
		dataMap.put("chemistInfo", chemistInfo);
		return dataMap;
	}


	// 헤지 : 약사가 처방전 수정 요청
	@Override
	public void updatePrescriptionRequest(RequestPrescriptionChemistVO vo) throws Exception {
		prescriptionDAO.updatePrescriptionRequest(vo);
		
	}

	// 헤지 : 처방전수정요청 정보 출력
	@Override
	public RequestPrescriptionChemistVO getPrescriptionRequest(String psCode) throws Exception {
		return prescriptionDAO.selectPrescriptionRequest(psCode);
	}

	// 헤지 : '수정요청'처방전의 상태 변경, 대기열에서 환자 지우기
	@Override
	public void updatePsStatusModify(RequestPrescriptionChemistVO vo) throws Exception {
		prescriptionDAO.updatePsStatusModify(vo.getPsCode());
		prescriptionDAO.deletePatientModify(vo.getPatientCode());
//		System.out.println("0730Service");
	}


	// 헤지 : 약사)비처방조제 처방전 추가
	@Override
	public String insertPrescriptionForChemist(UpdatePrescriptionVO vo) throws Exception {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		String formatedNow = now.format(formatter);
		
		String psCode = formatedNow + prescriptionDAO.selectPreNumSeq();
		
		vo.setPsCodeL(Long.parseLong(psCode));
		
		prescriptionDAO.insertPrescriptionForChemist(vo);

		// 처방전을 insert 한 후 psCode를 리턴해준다.
		return psCode;
	}

	// 헤지 : 처방전조제완료)처방전상태 조제대기 -> 조제완료
	@Override
	public void updatePrescriptionComplete(PrescriptionCompleteVO vo) throws Exception {
		prescriptionDAO.updatePrescriptionComplete(vo);
	}


	
}
