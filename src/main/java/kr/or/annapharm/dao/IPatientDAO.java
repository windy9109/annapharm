package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionHistoryVO;
import kr.or.annapharm.dto.PrescriptionLogVO;
import kr.or.annapharm.dto.PsStatusReadyPatientVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;

public interface IPatientDAO {

	// 처방 대기 환자 목록
//	List<Map<String, String>> selectPatientList() throws Exception;

	List<Map<String, String>> selectWaitingPatientList() throws Exception;

	// 헤지 : 의사)처방완료환자목록
	List<PsStatusReadyPatientVO> selectPsStatusReady(SearchCriteria cri) throws Exception;
	// 헤지 : 의사)처방완료환자목록갯수
	int selectPsStatusReadyCount(String doctorCode) throws Exception;

	// 처방 대기 환자 목록 : 환자의 최근 처방일
	String selectPatiengLastPrescriptionDate(String patientCode) throws Exception;

	// 처방 대기 환자 중 선택한 환자 조회(환자코드)
	List<PatientVO> selectPatientOne(String patientCode) throws Exception;
	List<PatientVO> selectWaitingPatientChoice(String patientCode) throws Exception;

	// 선택한 환자 조회(아이디, 생년월일)
	List<PatientVO> selectPatientToNameRegnum(PatientVO vo) throws Exception;

	// 헤지 : 환자의 과거 처방 내역
	List<PrescriptionHistoryVO> selectPatientPrescription(PsStatusReadyPatientVO vo) throws Exception;

	// 약사가 약국에서 개별 환자의 과거처방이력을 확인할 때 사용
	List<PrescriptionLogVO> selectPrescriptionLogByPharmacist(String code) throws Exception;

	// 비로그인 처방전 조회 시 사용(최대 조회 30일)
	List<PrescriptionLogVO> selectNonloginPrescriptionLogByPharmacistTo30(String code) throws Exception;

	/**
	 * @param doctorCode : 의사 코드
	 * @return	: 의사/병원명을 가져올 VO
	 * @throws Exception
	 * 	개요 : 의사 코드로 의사/병원명을 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	PrescriptionLogVO selectDoctorNameByCode(String doctorCode) throws Exception;

	// 헤지 : 약사가 환자 등록
	public void insertPatientForPharmacist(MemberVO member) throws SQLException;

	// 헤지 : 처방전 작성 완료된 환자 대기열에서 삭제
	public void deletePatientFromWaiting(String patientCode) throws Exception;

	// 헤지 : 처방전 수정 요청시 다시 처방환자대기목록에 환자 추가
	public void insertWaitingPatient(RequestPrescriptionChemistVO vo) throws Exception;

	/**
	 * @param vo : 사용자가 작성한 이름/생년월일/전화번호가 담기는 VO
	 * @return : 해당하는 사용자의 환자 테이블의 정보를 모두 받아온다.
	 * @throws Exception
	 *  개요 : 간편 처방전 검색 시 이름/생년월일/전화번호를 받아 해당하는 유저 정보가 있는지 확인하는 메서드
	 *  작성자 : 병진
	 */
	public PatientVO findNonLoginUser(PatientVO vo) throws Exception;
}
