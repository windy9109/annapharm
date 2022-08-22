package kr.or.annapharm.service;

import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnalysisPrescriptionVO;
import kr.or.annapharm.dto.DashBoardProductVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PreferMedicineVO;

public interface ExpertDashBoardService {

	//실시간 처방내역
	public List<Map<String, String>> getExpertDashBoardList(MemberVO id) throws Exception;
	
	//약사IN
	public List<Map<String, String>> getPharmacistINList() throws Exception;
	
	//최근누적재고
	public List<Map<String, String>> getCumulativeStockList(String id) throws Exception;
	
	/**
	 * 최다 판매 약품 Service
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<PreferMedicineVO> getMaximumSalesList(SearchCriteria cri) throws Exception;
	
	/**
	 * 처방환자 방문자수 Service
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<AnalysisPrescriptionVO> getAnalysisPrescription(SearchCriteria cri) throws Exception;
	
	/**
	 * 최고 방문 연령별 최다 처방 약품 Service
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<PreferMedicineVO> getSalesStatisticsList(SearchCriteria cri) throws Exception;
	
	/**
	 * 재고 부족 표시 Service
	 * @return
	 * @throws Exception
	 */
	public List<DashBoardProductVO> getStockShortageList() throws Exception;
	
	/**
	 * 재고 유통기한 임박 Service
	 * @return
	 * @throws Exception
	 */
	public List<DashBoardProductVO> getStockEXPList() throws Exception;
}
