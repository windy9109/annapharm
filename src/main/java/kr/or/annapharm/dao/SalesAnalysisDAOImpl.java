package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.PharmacyAPIVO;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.MedicienBillVO;
import kr.or.annapharm.dto.MedicienCalculatVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;
import kr.or.annapharm.dto.PrescriptionSaveLogVO;
import kr.or.annapharm.dto.RegistBillVO;
import kr.or.annapharm.dto.SalesAnalysisDetailVO;
import kr.or.annapharm.dto.SalesAnalysisVO;
import kr.or.annapharm.dto.SavelogPrescriptionVO;

public class SalesAnalysisDAOImpl implements SalesAnalysisDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 개요 : 약사 / 기간 정보를 받아 매출 목록에 출력될 데이터를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisVO> selectSearchAnalysisList(SearchCriteria cri) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.selectSearchAnalysisList", cri);
	}


	// 개요 : 로그인된 정보로 해당 약국의 약사 이름을 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<RegistBillVO> selectChemistsName(String loginUserPharmacyCode) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.selectChemistsName",loginUserPharmacyCode);
	}

	// 개요 : 처방전코드를 받아 해당 처방전에 사용된 약품의 종류,갯수를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<MedicienCalculatVO> selectSearchAnalysisListMedicienData(String psCode) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.selectSearchAnalysisListMedicienData", psCode);
	}

	// 개요 : 처방코드를 통해 해당 처방전의 상세 약품 리스트를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisDetailVO> selectSalesAnalyssisDetail(String psCode) throws Exception {
		return session.selectList("Prescription-Mapper.selectSalesAnalyssisDetail", psCode);
	}

	// 개요 : 약국정보를 API에서 받아 insert하는 메서드
	// 작성자 : 이병진
	@Override
	public void test(PharmacyAPIVO vo) throws Exception {
		session.update("SalesAnalysis-Mapper.test", vo);
	}

	// 개요 : 사용자 ID를 통해 사용자의 정보와 약국 코드를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public RegistBillVO loginUserpharmacyCode(String memId) throws Exception {
		return session.selectOne("SalesAnalysis-Mapper.loginUserpharmacyCode", memId);
	}

	// 개요 : 약국코드를 통해 약국의 세부 정보를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public RegistBillVO selectPharmacyInfo(RegistBillVO vo) throws Exception {
		return session.selectOne("SalesAnalysis-Mapper.selectPharmacyInfo",vo);
	}

	// 개요 : 매출현황 신청서 출력 및 임시저장시 필요한 pslogNum의 값
	// 작성자 : 이병진
	@Override
	public int saveSEQnumFind() throws Exception {
		return session.selectOne("SalesAnalysis-Mapper.saveSEQnumFind");
	}

	// 개요 : 매출 현황 페이지에서 임시저장을 눌렀을 때 prescriptionSavelog에 insert 하기 위한 메서드
	// 작성자 : 이병진
	@Override
	public void prescriptionSavelogTemporarilySaveInsert(PrescriptionSaveLogVO psvo) throws Exception {
		session.update("SalesAnalysis-Mapper.prescriptionSavelogTemporarilySaveInsert", psvo);
	}

	// 개요 : 요양급여신청서 저장을 눌렀을 때 prescriptionSavelog에 insert 하기 위한 메서드
	// 작성자 : 이병진
	@Override
	public void prescriptionSavelogPrintSaveinsert(PrescriptionSaveLogVO psvo) throws Exception {
		session.update("SalesAnalysis-Mapper.prescriptionSavelogPrintSaveinsert", psvo);
	}

	// 개요 : 매출 현황 페이지에서 임시저장이나 요양급여신청서 저장을 눌렀을 때 savelogPrescription에 insert하기 위한 메서드
	// 작성자 : 이병진
	@Override
	public void savelogPrescriptionSaveInsert(PrescriptionSaveLogVO psvo) throws Exception {
		session.update("SalesAnalysis-Mapper.savelogPrescriptionSaveInsert", psvo);
	}

	// 개요 : 매출 현황 페이지에서 임시저장이나 출력으로 prescriptionSavelog에 저장된 값을 지우기 위한 메서드
	// 작성자 : 이병진
	@Override
	public void prescriptionSavelogDelete(int pslogNum) throws Exception {
		session.update("SalesAnalysis-Mapper.prescriptionSavelogDelete", pslogNum);
	}

	// 개요 : 매출 현황 페이지에서 임시저장이나 출력으로 savelogPrescription에 저장된 값을 지우기 위한 메서드
	// 작성자 : 이병진
	@Override
	public void savelogPrescriptionDelete(int pslogNum) throws Exception {
		session.update("SalesAnalysis-Mapper.savelogPrescriptionDelete", pslogNum);
	}

	// 개요 : 임시저장이나 출력이 진행된 처방전의 처방전 코드를 받아 ps_cod의 값을 저장됨으로 변경하는 메서드 작성자
	// 작성자 : 이병진
	@Override
	public void prescriptionSaveupdate(String spPscode) throws Exception {
		// TODO Auto-generated method stub
		session.update("SalesAnalysis-Mapper.prescriptionSaveupdate", spPscode);
	}

	// 개요 : 임시저장이나 출력에서 삭제된 처방전의 처방전 코드를 받아 ps_cod의 값을 기본값으로 변경하는 메서드
	// 작성자 : 이병진
	@Override
	public void prescriptionDeleteupdate(String spPscode) throws Exception {
		session.update("SalesAnalysis-Mapper.prescriptionDeleteupdate", spPscode);
	}

	// 개요 : 약국코드를 통해 약국의 저장/출력 내역을 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<PrescriptionSaveLogVO> selectPrintSaveTableList(String pharmacyCode) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.selectPrintSaveTableList", pharmacyCode);
	}

	// 개요 : pslogNum을 넣어 해당하는 처방전들의 조제 완료 날짜가 포함된 vo를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SavelogPrescriptionVO> selectsavelogPrescriptionList(int pslogNum) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.selectsavelogPrescriptionList", pslogNum);
	}

	// 개요 : 저장/출력 내역의 행을 클릭했을 때 해당하는 데이터를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisVO> selectSaveAndPrintDetailList(int pslogNum) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.selectSaveAndPrintDetailList", pslogNum);
	}

	// 개요 : 일주일간 조제완료된 처방전의 리스트를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisVO> weekPrescriptionList(String pharmacyCode) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.weekPrescriptionList", pharmacyCode);
	}
	// 개요 : 한달간 조제완료된 처방전의 리스트를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisVO> monthPrescriptionList(String pharmacyCode) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.monthPrescriptionList", pharmacyCode);
	}

	// 개요 : 1년간 조제완료된 처방전의 리스트를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisVO> yearPrescriptionList(String pharmacyCode) throws Exception {
		return session.selectList("SalesAnalysis-Mapper.yearPrescriptionList", pharmacyCode);
	}

	// 헤지 : sale테이블에 데이터 넣기 - 판매데이터
	@Override
	public void insertSalePrescription(PrescriptionCompleteVO vo) throws Exception {
		 session.update("SalesAnalysis-Mapper.insertSalePrescription", vo);
	}

	// 헤지 : sale_cart 테이블에 데이터 넣기 - 약데이터
	@Override
	public void insertSaleCartMedicine(PrescriptionCompleteVO vo) throws Exception {
		session.update("SalesAnalysis-Mapper.insertSaleCartMedicine", vo);
	}

	// 헤지 : 판매번호 생성하는 시퀀스
	@Override
	public String selectSaleNumSeq() throws SQLException {
		return session.selectOne("SalesAnalysis-Mapper.selectSaleNumSeq");
	}

}
