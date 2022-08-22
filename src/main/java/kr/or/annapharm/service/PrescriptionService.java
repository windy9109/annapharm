package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.ReadMedicineInfoVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.dto.PreDetailForPharmacistVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;

public interface PrescriptionService {

	public List<PrescriptionVO> getPrescriptionList(String prescriptionCode) throws Exception;

	public PrescriptionVO getPrescriptionOne (PrescriptionVO vo) throws Exception;

	public int getPrescriptionCount(String patientCode) throws Exception;

	// 과거 처방 이력에서 처방전 선택 -> 해당 처방전의 상세내역 출력 (헤지)
	public List<PrescriptionDetailVO> getPrescriptioinDetil(String psCode) throws Exception;

	/**
	 * @param psCode : 처방전 코드
	 * @return : 약의 상세정보를 조회할 수 있는 URL등이 저장되어 있는 ReadMedicineInfoVO
	 * @throws Exception
	 * 개요 : 약사 조제 화면에서 약의 정보를 확인할 수 있게 도와주는 외부 URL을 가져오기 위한 메서드
	 * 작성자 : 이병진
	 */
	public ReadMedicineInfoVO getMedicineInfo(String psCode) throws Exception;
	
	// 헤지 : 약사)선택한 약의 상세정보
	public ReadMedicineInfoVO getMedicineInfoChoice(String mdNo) throws Exception;
	
	// 헤지 : 의사)기존 처방전 삭제
	public void deleteOriginalPrescription(List<UpdatePrescriptionVO> voList) throws Exception;
	
	// 헤지 : 의사)처방전 삭제 후 수정 처방전 추가
	public void updatePrescription (List<UpdatePrescriptionVO> voList) throws Exception;

	// 헤지 : 의사)새 처방전 작성(처방전추가)
	public String insertNewPrescription(PrescriptionVO vo) throws Exception;

	// 헤지 : 약사) 처방전 목록 중 상세보기할 처방전 하나 선택
	public Map<String, Object> getPrescriptionDetailForPharmacist(String psCode) throws Exception;
	// 헤지 : 약사) 처방전 목록 중 상세보기할 처방전 하나 선택(약사명, 약국명, 약국코드 가져오기)
	public Map<String, Object> getChemistDetailForPharmacist(String psCode) throws Exception;
	
	// 헤지 : 약사가 처방전 수정 요청
	public void updatePrescriptionRequest(RequestPrescriptionChemistVO vo) throws Exception;
	
	// 헤지 : 의사)처방전수정요청 정보 출력
	public RequestPrescriptionChemistVO getPrescriptionRequest(String psCode) throws Exception;
	
	// 헤지 : 의사)'수정요청'처방전의 상태 변경, 대기열에서 환자 지우기
	public void updatePsStatusModify (RequestPrescriptionChemistVO vo) throws Exception;
	
	// 헤지 : 약사)비처방조제 처방전 추가
	public String insertPrescriptionForChemist(UpdatePrescriptionVO vo) throws Exception;
	
	// 헤지 : 처방전조제완료)처방전상태 조제대기 -> 조제완료
	public void updatePrescriptionComplete(PrescriptionCompleteVO vo) throws Exception;
	
}
