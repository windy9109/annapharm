package kr.or.annapharm.service;

import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionHistoryVO;
import kr.or.annapharm.dto.PrescriptionLogVO;
import kr.or.annapharm.dto.PsStatusReadyPatientVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;


public interface IPatientService {

	// 처방 대기 환자 목록 - 예전
//	public List<Map<String, String>> getPatientList() throws Exception;

	// 헤지 : 의사)처방 대기 환자 목록 - 최근
	public List<Map<String, String>> getWaitingPatientList() throws Exception;

	// 헤지 : 의사)처방완료환자목록
	public Map<String, Object> getPsStatusReadyList(SearchCriteria cri) throws Exception;
	
	// 처방 대기 환자 중 선택한 환자 조회(환자코드) - 최근
	public List<PatientVO> getWaitingPatientChoice(String patientCode) throws Exception;

	// 아이디, 이름으로 환자 조회하는 메서드
	public List<PatientVO> getPatentLsit(PatientVO vo) throws Exception;

//	List<String> getMedicineName(String code) throws Exception;

	// 환자의 과거 처방이력 조회
	public List<PrescriptionHistoryVO> getPatientPreList(PsStatusReadyPatientVO vo) throws Exception;

	/**
	 * @param code : 환자코드
	 * @return : 환자의 과거 처방이력 목록
	 * @throws Exception
	 * 개요 : 약사가 약국에서 개별 환자의 과거처방이력을 확인할 때 사용
	 * 제작 : 이병진
	 */
	public List<PrescriptionLogVO> getPatientPreListByPharmacist(String code) throws Exception;
	
	// 헤지 : 의사)처방전 작성 완료된 환자 대기열에서 지우기
	public void deletePatientFromWaiting(String patientCode) throws Exception;
	
	// 헤지 : 약사)처방전 수정 요청시 다시 처방환자대기목록에 환자 추가
	public void insertWaitingPatient(RequestPrescriptionChemistVO vo) throws Exception;

}
