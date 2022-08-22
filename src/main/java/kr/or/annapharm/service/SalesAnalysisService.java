package kr.or.annapharm.service;

import java.util.List;

import kr.or.annapharm.PharmacyAPIVO;
import kr.or.annapharm.command.SalesAnalysisCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PrescriptionCompleteVO;
import kr.or.annapharm.dto.PrescriptionSaveLogVO;
import kr.or.annapharm.dto.RegistBillVO;
import kr.or.annapharm.dto.SalesAnalysisDetailVO;
import kr.or.annapharm.dto.SalesDashboardResultVO;

public interface SalesAnalysisService {

	/**
	 * @param loginUserPharmacyCode : 로그인한 유저의 약국 코드
	 * @return : 같은 약국에 등록되어있는 약사들의 목록
	 * @throws Exception
	 * 	개요 : 로그인한 유저와 같은 약국에 등록되어있는 약사들의 목록을 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<RegistBillVO> getChemistsName(String loginUserPharmacyCode) throws Exception;

	/**
	 * @param cri : 약사/기간 조건을 가져오기 위한 파라미터
	 * @return	: 목록 출력에 필요한 데이터를 가져오는 VO
	 * @throws Exception
	 * 	개요 : 약사/기간 조건에 따라 매출 목록의 데이터를 출력하기 위한 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisCommand> getSearchAnalysisList(SearchCriteria cri) throws Exception;

	/**
	 * @param pslogNum : 선택된 행의 pslogNum
	 * @return : 목록 출력에 필요한 데이터를 가져오는 VO
	 * @throws Exception
	 * 	개요 : 저장/출력 내역에서 선택한 행의 매출 목록을 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<SalesAnalysisCommand> getSaveAndPrintDetailList(int pslogNum) throws Exception;

	/**
	 * @param psCode : 처방전 코드
	 * @return : 파라미터로 받은 처방전의 상세내역 정보
	 * @throws Exception
	 * 	개요 : 처방전 코드를 받아 해당 처방전의 약품을 검색하는 메서드
	 *	작성자 : 이병진
	 */
	public List<SalesAnalysisDetailVO> getSalesAnalyssisDetail(String psCode) throws Exception;

	/**
	 * @param pharmacyCode : 로그인한 사용자의 약국 코드
	 * @return : 저장/출력 내역에 들어갈 리스트
	 * @throws Exception
	 * 	개요 : 저장/출력 내역에 들어갈 리스트를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public List<PrescriptionSaveLogVO> getSavePringList(String pharmacyCode) throws Exception;

	/**
	 * @param memId : 사용자 ID
	 * @return : 약국 코드와 사용자 정보가 담긴 vo
	 * @throws Exception
	 * 	개요 : 사용자 ID를 통해 사용자의 정보와 약국 코드를 가져오는 메서드
	 * 	작성자 : 이병진
	 */
	public RegistBillVO getloginUserpharmacyCode(String memId) throws Exception;

	/**
	 * @param vo : 사용자 ID
	 * @return : 약국 세보정보가 담긴 VO
	 * @throws Exception
	 * 	개요 : 사용자 ID를 통해 사용자의 정보와 약국의 세부 정보를 가져오는 메서드
	 *  작성자 : 이병진
	 */
	public RegistBillVO getPharmacyInfo(String memId) throws Exception;

	/**
	 * @param vo : 약국 정보 테이블에 들어갈 컬럼명이 변수값으로 저장되어 있는 VO
	 * @throws Exception
	 * 	개요 : 약국정보를 API에서 받아 insert하는 메서드
	 * 	작성자 : 이병진
	 */
	public void test(PharmacyAPIVO vo) throws Exception;

	/**
	 * @param psvo : prescriptionSavelog 테이블의 컬럼이 변수로 설정되어 있는 VO
	 * @param preCode : 처방전 코드가 리스트 형태에 담아 받아오는 파라미터
	 * @throws Exception
	 * 	개요 : 매출현황 화면에서 임시저장 버튼을 눌렀을 때 처방전 코드의 save타입을 변경하고 prescriptionSavelog와 savelogPrescription을 등록 하는 메서드
	 * 	작성자 : 이병진
	 */
	public void temporarilySave(PrescriptionSaveLogVO psvo, List<String> preCode) throws Exception;

	/**
	 * @param psvo : prescriptionSavelog 테이블의 컬럼이 변수로 설정되어 있는 VO
	 * @param preCode : 처방전 코드가 리스트 형태에 담아 받아오는 파라미터
	 * @throws Exception
	 * 	개요 : 청구서 화면에서 저장 버튼을 눌렀을 때 처방전 코드의 save타입을 변경하고 prescriptionSavelog와 savelogPrescription을 등록 하는 메서드
	 * 	작성자 : 이병진
	 */
	public void printSave(PrescriptionSaveLogVO psvo, List<String> preCode) throws Exception;

	/**
	 * @param psvo : prescriptionSavelog 테이블의 컬럼이 변수로 설정되어 있는 VO
	 * @param preCode : 처방전 코드가 리스트 형태에 담아 받아오는 파라미터
	 * @throws Exception
	 * 	개요 : 매출현황 화면에서 삭제 버튼을 눌렀을 때 처방전 코드의 save타입을 변경하고 prescriptionSavelog와 savelogPrescription을 삭제 하는 메서드
	 * 	작성자 : 이병진
	 */
	public void saveDelete(int pslohNum) throws Exception;

	public SalesDashboardResultVO getWeekSalesListforDashboard(String pharmachCode) throws Exception;
	public SalesDashboardResultVO getMonthSalesListforDashboard(String pharmachCode) throws Exception;
	public SalesDashboardResultVO getYearSalesListforDashboard(String pharmachCode) throws Exception;

	// 헤지 : 조제완료 후 sale, sale_cart테이블에 데이터 insert
	public String insertSalePrescription(PrescriptionCompleteVO vo) throws Exception;
	public void insertSaleCartMedicine(List<PrescriptionCompleteVO> vo) throws Exception;


}
