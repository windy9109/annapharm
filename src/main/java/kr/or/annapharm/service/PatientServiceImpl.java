package kr.or.annapharm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.IPatientDAO;
import kr.or.annapharm.dao.MedicineDAO;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionHistoryVO;
import kr.or.annapharm.dto.PrescriptionLogVO;
import kr.or.annapharm.dto.PsStatusReadyPatientVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;

public class PatientServiceImpl implements IPatientService {

	private IPatientDAO patientDAO;

	private MedicineDAO medicineDAO;

	public void setPatientDAO(IPatientDAO patientDAO) {
		this.patientDAO = patientDAO;
	}

	public void setMedicineDAO(MedicineDAO medicineDAO) {
		this.medicineDAO = medicineDAO;
	}

	// 처방 대기 환자 목록 - 예전
//	@Override
//	public List<Map<String, String>> getPatientList() throws Exception {
//
//		List<Map<String, String>> patientList = null;
//
//		patientList = patientDAO.selectPatientList();
//
//		return patientList;
//	}

	// 처방 대기 환자 목록 - 최근
	@Override
	public List<Map<String, String>> getWaitingPatientList() throws Exception {
		
		List<Map<String, String>> patientList = null;

		patientList = patientDAO.selectWaitingPatientList();
		
		System.out.println(patientList);
		
		int i = 0;
		
		for(Map<String, String> str : patientList) {
			System.out.println("환자코드 : " + str.get("PATIENT_CODE"));
			
			String pCode = str.get("PATIENT_CODE");
			
			//System.out.println("안녕 : " + patientDAO.selectPatiengLastPrescriptionDate(pCode));
			
			patientList.get(i).put("psDate", patientDAO.selectPatiengLastPrescriptionDate(pCode));
			
			i++;
		}
//		System.out.println("patientList : " + patientList);
		return patientList;
	}
	
	// 헤지 : 의사)처방완료환자목록
	@Override
	public Map<String, Object> getPsStatusReadyList(SearchCriteria cri) throws Exception {
//	public List<PsStatusReadyPatientVO> getPsStatusReadyList(SearchCriteria cri) throws Exception {
		List<PsStatusReadyPatientVO> patientList = null;
		int count = 0;
		
		SearchCriteria searchCri = (SearchCriteria) cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(6);// 한페이지에 보이는 행의 갯수
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(patientDAO.selectPsStatusReadyCount(cri.getDoctorCode()));

		patientList = patientDAO.selectPsStatusReady(cri);
		
		System.out.println("환자목록 : " + patientList );
		System.out.println("환자길이 : " + patientList.size() );
		System.out.println("환자수 : " +patientDAO.selectPsStatusReadyCount(cri.getDoctorCode()) );
		
		for(PsStatusReadyPatientVO vo : patientList) {
			int page = cri.getPage();
			int lastNum = patientDAO.selectPsStatusReadyCount(cri.getDoctorCode());
			vo.setNo(lastNum - (count + (page - 1)*6));
			count++;
		}

		dataMap.put("patientList", patientList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
//		return patientList;
	}

	// 처방 대기 환자 중 선택한 환자 조회(환자코드) - 최근
	@Override
	public List<PatientVO> getWaitingPatientChoice(String patientCode) throws Exception {
		List<PatientVO> patientOne = null;
		
		patientOne = patientDAO.selectWaitingPatientChoice(patientCode);

		for(int k = 0; k < 5; k++) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			uuid = uuid.substring(0, 10);
			System.out.println(k + "번째 아이디 : " + uuid);
		}
		return patientOne;
	}
	

	@Override
	public List<PatientVO> getPatentLsit(PatientVO vo) throws Exception {

		List<PatientVO> patientList = patientDAO.selectPatientToNameRegnum(vo);

		// 주민번호, 전화번호 암호화
		for(PatientVO list : patientList ) {
			String regnum = list.getPatientRegnum();
			String phone = list.getPatientPhone();

			regnum = regnum.substring(0,8) + regnum.substring(8, 14).replace(regnum.substring(8, 14), "******");
			phone = phone.replaceFirst(phone.substring(3,7), "****");

			list.setPatientRegnum(regnum);
			list.setPatientPhone(phone);
		}

		return patientList;
	}

//	@Override
//	public List<String> getMedicineName(String code) throws Exception{
//		return medicineDAO.selectMedicineNameList(code);
//	}

	// 환자의 과거 처방이력 조회
	@Override
	public List<PrescriptionHistoryVO> getPatientPreList(PsStatusReadyPatientVO vo) throws Exception {
		return patientDAO.selectPatientPrescription(vo);
	}

	/**
	 *	개요 : 약사가 약국에서 개별 환자의 과거처방이력을 확인할 때 사용
	 *	파라미터 : 환자의 환자코드
	 *	제작 : 이병진
	 */
	@Override
	public List<PrescriptionLogVO> getPatientPreListByPharmacist(String code) throws Exception {

		List<PrescriptionLogVO> plvList = patientDAO.selectPrescriptionLogByPharmacist(code);

		for (PrescriptionLogVO vo : plvList) {
			vo.setHospitalName("-");
			vo.setMemName("-");
			if(vo.getDoctorCode() != null) {
				PrescriptionLogVO exvo = patientDAO.selectDoctorNameByCode(vo.getDoctorCode());
				vo.setHospitalName(exvo.getHospitalName());
				vo.setMemName(exvo.getMemName());
			}
		}

		return plvList;
	}

	// 헤지 : 처방전 작성 완료된 환자 대기열에서 지우기
	@Override
	public void deletePatientFromWaiting(String patientCode) throws Exception {
		patientDAO.deletePatientFromWaiting(patientCode);
		
	}

	// 헤지 : 처방전 수정 요청시 다시 처방환자대기목록에 환자 추가
	@Override
	public void insertWaitingPatient(RequestPrescriptionChemistVO vo) throws Exception {
//		System.out.println("처방대기목록-vo" + vo);
		
		patientDAO.insertWaitingPatient(vo);
	}






}
