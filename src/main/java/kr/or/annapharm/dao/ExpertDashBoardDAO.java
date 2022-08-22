package kr.or.annapharm.dao;

import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnalysisPrescriptionVO;
import kr.or.annapharm.dto.DashBoardProductVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;

public interface ExpertDashBoardDAO {
	
	List<Map<String, String>> selectExpertDashBoardList(MemberVO id) throws Exception;
	
	List<Map<String, String>> selectPharmacistINList() throws Exception;
	
	List<Map<String, String>> selectCumulativeStockList(String id) throws Exception;
	
	
	/**
	 * 최다 판매 약품 DAO
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	List<PreferMedicineVO> selectMaximumSalesList(SearchCriteria cri) throws Exception;
	
	/**
	 * 처방환자 방문자수 DAO
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	List<AnalysisPrescriptionVO> selectAnalysisPrescription(SearchCriteria cri) throws Exception;
	
	/**
	 * 최고 방문 연령별 최다 처방 약품 DAO
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	List<PreferMedicineVO> selectSalesStatistics(SearchCriteria cri) throws Exception;
	
	/**
	 * 재고 부족 표시 대시보드 DAO
	 * @return
	 * @throws Exception
	 */
	List<DashBoardProductVO> selectStockShortage() throws Exception;
	
	/**
	 * 재고 유통기한 임박 DAO
	 * @return
	 * @throws Exception
	 */
	List<DashBoardProductVO> selectStockEXP() throws Exception;

}
