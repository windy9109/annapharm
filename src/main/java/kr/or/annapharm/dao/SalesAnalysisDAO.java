package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

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

/**
 * @author PC-09
 *	개요 : 약국 매출 현황의 화면구성에 필요한 DAO 인터페이스
 *	작성자 : 이병진
 */
public interface SalesAnalysisDAO {

	/**
	 * @param cri : 사용자가 정의한 조회할 약사 / 기간을 받아오는 파라미터
	 * @return : 매출 목록
	 * @throws Exception
	 * 	개요 : 약사 / 기간 정보를 받아 매출 목록에 출력될 데이터를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisVO> selectSearchAnalysisList(SearchCriteria cri) throws Exception;

	/**
	 * @param pslogNum : 클릭한 저장/출력 내역 행의 번호
	 * @return : 매출 목록
	 * @throws Exception
	 * 	개요 : 저장/출력 내역의 행을 클릭했을 때 해당하는 데이터를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisVO> selectSaveAndPrintDetailList(int pslogNum) throws Exception;

	/**
	 * @param psCode : 처방전 코드
	 * @return : 처방전에 들어있는 약품 목록 데이터
	 * @throws Exception
	 * 	개요 : 처방전코드를 받아 해당 처방전에 사용된 약품의 종류,갯수를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<MedicienCalculatVO> selectSearchAnalysisListMedicienData(String psCode) throws Exception;

	/**
	 * @param loginChemistCode : 로그인한 사람의 약국 코드
	 * @return : 가져온 이름 목록
	 * @throws Exception
	 * 	개요 : 로그인된 정보로 해당 약국의 약사 이름을 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<RegistBillVO> selectChemistsName(String loginUserPharmacyCode) throws Exception;


	/**
	 * @param psCode : 처방전 코드
	 * @return : 파라미터로 받은 처방전의 상세 약품 리스트
	 * @throws Exception
	 *  개요 : 처방코드를 통해 해당 처방전의 상세 약품 리스트를 가져오는 메서드
	 *  작성자 : 이병진
	 */
	public List<SalesAnalysisDetailVO> selectSalesAnalyssisDetail(String psCode) throws Exception;

	/**
	 * @param memId	: 사용자 ID
	 * @return	: 사용자의 정보와 약국 코드
	 * @throws Exception
	 * 	개요 : 사용자 ID를 통해 사용자의 정보와 약국 코드를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public RegistBillVO loginUserpharmacyCode(String memId) throws Exception;

	/**
	 * @param vo : 약국 코드가 들어있는 VO
	 * @return	: 약국 세부 정보
	 * @throws Exception
	 * 	개요 : 약국코드를 통해 약국의 세부 정보를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public RegistBillVO selectPharmacyInfo(RegistBillVO vo) throws Exception;

	/**
	 * @param pharmacyCode : 로그인한 유저의 약국 코드
	 * @return : 해당 약국의 저장/출력 내역의 리스트
	 * @throws Exception
	 * 	개요 : 약국코드를 통해 약국의 저장/출력 내역을 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<PrescriptionSaveLogVO> selectPrintSaveTableList(String pharmacyCode) throws Exception;

	/**
	 * @param pslogNum : PRESCRIPTION_SAVELOG 테이블의 PK인 pslogNum
	 * @return : 해당 pslogNum에 저장된 처방전의 조제 완료 날짜가 포함된 VO
	 * @throws Exception
	 * 	개요 : pslogNum을 넣어 해당하는 처방전들의 조제 완료 날짜가 포함된 vo를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SavelogPrescriptionVO> selectsavelogPrescriptionList(int pslogNum) throws Exception;

	/**
	 * @return : 매출현황 신청서 출력 및 임시저장시 필요한 pslogNum의 값
	 * @throws Exception
	 * 	개요 : 매출현황 신청서 출력 및 임시저장시 필요한 값을 시퀀스를 통해 뽑아내는 메서드
	 * 	작성자 : 이병진
	 */
	public int saveSEQnumFind() throws Exception;

	/**
	 * @param psvo : prescriptionSavelog 테이블의 컬럼이 변수로 설정되어 있는 VO
	 * @throws Exception
	 * 	개요 : 매출 현황 페이지에서 임시저장을 눌렀을 때 prescriptionSavelog에 insert 하기 위한 메서드
	 * 	작성자 : 이병진
	 */
	public void prescriptionSavelogTemporarilySaveInsert(PrescriptionSaveLogVO psvo) throws Exception;

	/**
	 * @param psvo : prescriptionSavelog 테이블의 컬럼이 변수로 설정되어 있는 VO
	 * @throws Exception
	 * 	개요 : 요양급여신청서 저장을 눌렀을 때 prescriptionSavelog에 insert 하기 위한 메서드
	 * 	작성자 : 이병진
	 */
	public void prescriptionSavelogPrintSaveinsert(PrescriptionSaveLogVO psvo) throws Exception;

	/**
	 * @param psvo : savelogPrescription 테이블의 컬럼이 변수로 설정되어 있는 VO
	 * @throws Exception
	 * 	개요 : 매출 현황 페이지에서 임시저장이나 요양급여신청서 저장을 눌렀을 때 savelogPrescription에 insert하기 위한 메서드
	 * 	작성자 : 이병진
	 */
	public void savelogPrescriptionSaveInsert(PrescriptionSaveLogVO psvo) throws Exception;

	/**
	 * @param pslogNum : prescriptionSavelog 테이블에서 삭제할 번호값
	 * @throws Exception
	 * 	개요 : 매출 현황 페이지에서 임시저장이나 출력으로 prescriptionSavelog에 저장된 값을 지우기 위한 메서드
	 * 	작성자 : 이병진
	 */
	public void prescriptionSavelogDelete(int pslogNum) throws Exception;

	/**
	 * @param pslogNum : savelogPrescription 테이블에서 삭제할 번호값
	 * @throws Exception
	 * 	개요 : 매출 현황 페이지에서 임시저장이나 출력으로  savelogPrescription에 저장된 값을 지우기 위한 메서드
	 *  작성자 : 이병진
	 */
	public void savelogPrescriptionDelete(int pslogNum) throws Exception;

	/**
	 * @param spPscode : 처방전 코드
	 * @throws Exception
	 * 	개요 : 임시저장이나 출력이 진행된 처방전의 처방전 코드를 받아 ps_cod의 값을 저장됨으로 변경하는 메서드
	 * 	작성자 : 이병진
	 */
	public void prescriptionSaveupdate(String spPscode) throws Exception;

	/**
	 * @param spPscode
	 * @throws Exception
	 * 	개요 : 임시저장이나 출력에서 삭제된 처방전의 처방전 코드를 받아 ps_cod의 값을 기본값으로 변경하는 메서드
	 * 	작성자 : 이병진
	 */
	public void prescriptionDeleteupdate(String spPscode) throws Exception;


	/**
	 * @param pharmacyCode : 약국 코드
	 * @return : 일주일간 조제완료된 처방전 리스트
	 * @throws Exception
	 * 	개요 : 일주일간 조제완료된 처방전의 리스트를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisVO> weekPrescriptionList(String pharmacyCode) throws Exception;

	/**
	 * @param pharmacyCode : 약국 코드
	 * @return : 한달간 조제완료된 처방전 리스트
	 * @throws Exception
	 * 	개요 : 한달간 조제완료된 처방전의 리스트를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisVO> monthPrescriptionList(String pharmacyCode) throws Exception;

	/**
	 * @param pharmacyCode : 약국 코드
	 * @return : 1년간 조제완료된 처방전 리스트
	 * @throws Exception
	 * 	개요 : 1년간 조제완료된 처방전의 리스트를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisVO> yearPrescriptionList(String pharmacyCode) throws Exception;


	/**
	 * @param vo : 약국 API의 컬럼 정보가 들어있는 VO
	 * @throws Exception
	 *	개요 : 약국 API를 받아서 DB에 넣는 메서드
	 *	작성자 : 이병진
	 */
	public void test(PharmacyAPIVO vo) throws Exception;
	
	// 헤지 : 판매번호 생성하는 시퀀스
	String selectSaleNumSeq() throws SQLException;
	
	// 헤지 : sale테이블에 데이터 넣기 - 판매데이터
	public void insertSalePrescription(PrescriptionCompleteVO vo) throws Exception;
	// 헤지 : sale_cart 테이블에 데이터 넣기 - 약데이터
	public void insertSaleCartMedicine(PrescriptionCompleteVO vo) throws Exception;


}
