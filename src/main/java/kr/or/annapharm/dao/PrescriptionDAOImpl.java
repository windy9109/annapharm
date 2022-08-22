package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;
import kr.or.annapharm.dto.ReadMedicineInfoVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;
import kr.or.annapharm.dto.PreDetailForPharmacistVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;

public class PrescriptionDAOImpl implements PrescriptionDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PrescriptionVO> selectPrescriptionList(String prescriptionCode) throws Exception {
		return session.selectList("Prescription-Mapper.selectPrescriptionList", prescriptionCode);
	}

	@Override
	public PrescriptionVO selectPrescriptionOne(PrescriptionVO vo) throws Exception {

//		Map<String, String> map = new HashMap<String, String>();
//		map.put("patient_code", patientCode);
//		map.put("ps_code", psCode);
//
//		PrescriptionVO vo = new PrescriptionVO();
//		vo.setPatient_code(patientCode);
//		vo.setPs_code(psCode);

		return session.selectOne("Prescription-Mapper.selectPrescriptionList", vo);
	}

	@Override
	public int selectPrescriptionCount(String patientCode) throws Exception {
		return session.selectOne("Prescription-Mapper.selectPrescriptionCount", patientCode);
	}

	// 과거 처방 이력에서 처방전 선택 -> 해당 처방전의 상세내역 출력 (헤지)
	@Override
	public List<PrescriptionDetailVO> selectPrescriptionDetail(String psCode) throws Exception {
		return session.selectList("Prescription-Mapper.selectPrescriptionDetail", psCode);
	}

	// 개요 : 약사 조제 화면에서 약의 정보를 확인할 수 있게 도와주는 외부 URL을 가져오기 위한 메서드
	// 작성자 : 이병진
	@Override
	public ReadMedicineInfoVO selectMedicineInfoOne(String psCode) throws Exception {
		return session.selectOne("Prescription-Mapper.selectMedicineInfoOne", psCode);
	}

	// 헤지 : 선택한 약의 상세정보 조회
	@Override
	public ReadMedicineInfoVO selectMedicineInfoOneMdNo(String mdNo) throws Exception {
		return session.selectOne("Prescription-Mapper.selectMedicineInfoOneMdNo", mdNo);
	}
	
	// 헤지 : 기존 처방전 삭제
	@Override
	public void deleteOriginalPrescription(String psCode) throws Exception {
		session.delete("Prescription-Mapper.deleteOriginalPrescription", psCode);
		
	}

	// 헤지 : 수정 처방전 추가
	@Override
	public void insertUpdatePrescription(UpdatePrescriptionVO vo) throws Exception {
		session.update("Prescription-Mapper.insertUpdatePrescription", vo);
		
	}

	// 헤지 : 새 처방전 작성(처방전추가)
	@Override
	public void insertNewPrescription(PrescriptionVO vo) throws Exception {
		System.out.println("처방전작성 DAO");
		session.update("Prescription-Mapper.insertNewPrescription", vo);
	}

	// 헤지 : 번호생성 시퀀스 가져오기
	@Override
	public String selectPreNumSeq() throws SQLException {
		return session.selectOne("Prescription-Mapper.selectPreNumSeq");
	}

	// 헤지 : 약사가 처방이력에서 처방전 선택 후 처방전 상세 조회 (위에 정보)
	@Override
	public PreDetailForPharmacistVO selectPrescriptionUpDetailForPharmacist(String psCode) throws Exception {
		return session.selectOne("Prescription-Mapper.selectPrescriptionUpDetailForPharmacist", psCode);
	}
	// 헤지 : 처방전에 포함된 약국명과 약사명 구하기
	@Override
	public PreDetailForPharmacistVO selectChemistNameForPharmacist(String psCode) throws Exception {
		return session.selectOne("Prescription-Mapper.selectChemistNameForPharmacist", psCode);
	}

	// 헤지 : 약사가 처방이력에서 처방전 선택 후 처방전 상세 조회 (아래 정보)
	@Override
	public List<PreDetailForPharmacistVO> selectPrescriptionDownDetailForPharmacist(String psCode) throws Exception {
		return session.selectList("Prescription-Mapper.selectPrescriptionDownDetailForPharmacist", psCode);
	}

	// 헤지 : 약사가 처방전 수정 요청
	@Override
	public void updatePrescriptionRequest(RequestPrescriptionChemistVO vo) throws Exception {
		session.update("Prescription-Mapper.updatePrescriptionRequest", vo);
		
	}

	// 헤지 : 처방전수정요청 정보 출력
	@Override
	public RequestPrescriptionChemistVO selectPrescriptionRequest(String psCode) throws Exception {
		return session.selectOne("Prescription-Mapper.selectPrescriptionRequest", psCode);
	}

	// 헤지 : 수정요청처방전 수정 후 처방전상태변경 ('수정요청' -> '조제대기')
	@Override
	public void updatePsStatusModify(String psCode) throws Exception {
		session.update("Prescription-Mapper.updatePsStatusModify", psCode);
	}

	// 헤지 : 수정요청처방전 수정 후 대기열에서 환자 제거
	@Override
	public void deletePatientModify(String patientCode) throws Exception {
		session.update("Prescription-Mapper.deletePatientModify", patientCode);
		System.out.println("0730DAO");
	}

	// 헤지 : 약사)비처방조제 처방전 추가
	@Override
	public void insertPrescriptionForChemist(UpdatePrescriptionVO vo) throws Exception {
		session.update("Prescription-Mapper.insertPrescriptionForChemist", vo);
	}

	// 헤지 : 처방전조제완료)처방전상태 조제대기 -> 조제완료
	@Override
	public void updatePrescriptionComplete(PrescriptionCompleteVO vo) throws Exception {
		session.update("Prescription-Mapper.updatePrescriptionComplete", vo);
	}



}
