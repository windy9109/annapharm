package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.ReadMedicineInfoVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.dto.PreDetailForPharmacistVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;

public interface PrescriptionDAO {

	List<PrescriptionVO> selectPrescriptionList(String patientCode) throws Exception;

	PrescriptionVO selectPrescriptionOne(PrescriptionVO vo) throws Exception;

	// 처방전의 약 갯수 가져오기
	int selectPrescriptionCount(String patientCode) throws Exception;

	// 과거 처방 이력에서 처방전 선택 -> 해당 처방전의 상세내역 출력 (헤지)
	public List<PrescriptionDetailVO> selectPrescriptionDetail(String psCode) throws Exception;

	/**
	 * @param psCode : 처방전 코드
	 * @return : 약의 상세정보를 조회할 수 있는 URL등이 저장되어 있는 ReadMedicineInfoVO
	 * @throws Exception
	 *  개요 : 약사 조제 화면에서 약의 정보를 확인할 수 있게 도와주는 외부 URL을 가져오기 위한 메서드
	 *  작성자 : 이병진
	 */
	public ReadMedicineInfoVO selectMedicineInfoOne(String psCode) throws Exception;
	
	// 헤지 : 선택한 약의 상세정보 조회
	public ReadMedicineInfoVO selectMedicineInfoOneMdNo(String mdNo) throws Exception;
	
	// 헤지 : 기존 처방전 삭제
	public void deleteOriginalPrescription (String psCode) throws Exception;
	
	// 헤지 : 수정 처방전 추가
	public void insertUpdatePrescription (UpdatePrescriptionVO vo) throws Exception;
	
	// 헤지 : 새 처방전 작성(처방전추가)
	public void insertNewPrescription (PrescriptionVO vo) throws Exception;
	
	// 헤지 : 처방전번호 생성하는 시퀀스
	String selectPreNumSeq() throws SQLException;
	
	// 헤지 : 약사가 처방이력에서 처방전 선택 후 처방전 상세 조회 (위에 정보)
	public PreDetailForPharmacistVO selectPrescriptionUpDetailForPharmacist(String psCode) throws Exception;
	// 헤지 : 처방전에 포함된 약국명과 약사명 구하기
	public PreDetailForPharmacistVO selectChemistNameForPharmacist(String psCode) throws Exception;
	
	// 헤지 : 약사가 처방이력에서 처방전 선택 후 처방전 상세 조회 (아래 정보)
	public List<PreDetailForPharmacistVO> selectPrescriptionDownDetailForPharmacist(String psCode) throws Exception;
	
	// 헤지 : 약사가 처방전 수정 요청
	public void updatePrescriptionRequest(RequestPrescriptionChemistVO vo) throws Exception;
	
	// 헤지 : 처방전수정요청 정보 출력
	public RequestPrescriptionChemistVO selectPrescriptionRequest(String psCode) throws Exception;
	
	// 헤지 : 수정요청처방전 수정 후 처방전상태변경 ('수정요청' -> '조제대기')
	public void updatePsStatusModify(String psCode) throws Exception;
	
	// 헤지 : 수정요청처방전 수정 후 대기열에서 환자 제거
	public void deletePatientModify(String patientCode) throws Exception;
	
	// 헤지 : 약사)비처방조제 처방전 추가
	public void insertPrescriptionForChemist(UpdatePrescriptionVO vo) throws Exception;
	
	// 헤지 : 처방전조제완료)처방전상태 조제대기 -> 조제완료
	public void updatePrescriptionComplete(PrescriptionCompleteVO vo) throws Exception;
}
