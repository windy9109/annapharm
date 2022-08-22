package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.CompareMedicineVO;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.LongPrescriptionCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.MedicineDetailTableVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.SelectListVO;

public interface BusinessService {
	
	/**
	 * 약이름 검색 service
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> searchMedicineList(Criteria cri) throws SQLException;
	
	/**
	 * 주성분 검색 service
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> searchBasisList(Criteria cri) throws SQLException;
	
	/**
	 * 제약사별 약 매입가 비교 service
	 * @param miMaincode
	 * @return
	 * @throws SQLException
	 */
	public List<CompareMedicineVO> getCompareList(String miMaincode) throws SQLException;
	
	/**
	 * 선택한 약목록에 약을 추가 또는 삭제 service
	 * @param selectListVO
	 * @throws SQLException
	 */
	public void selectListAddDel(SelectListVO selectListVO) throws SQLException;
	
	/**
	 * 로그인한 약사의 선택한 약 리스트를 가져오는 service
	 * @param chemistCode
	 * @return
	 * @throws SQLException
	 */
	public List<SelectListVO> getSelectList(String chemistCode) throws SQLException;
	
	/**
	 * 연령별/성별 매출 현황 service
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> getSalesByAgeList(SearchCriteria cri) throws SQLException;
	
	public Map<String, Object> getPreferMedicineList(PreferMedicineVO preferMedicineVO) throws SQLException;
	
	public Map<String, Object> getLongPrescriptionList(LongPrescriptionCommandVO commandVO) throws SQLException;
	
	public List<LongPrescriptionDetailVO> getLongPrescriptionDetailList(String psCode) throws SQLException;
	
	public List<MedicineDetailTableVO> getMedicineDetailTableList(List<Integer> mdNoList) throws Exception;
	
	/**
	 * 약국 정보를 리스트로 반환하는 Service
	 * 지도에 표시된 마커의 정보를 CommandVO List형태로 받아와 처리함
	 * @param commandList
	 * @return
	 * @throws SQLException
	 */
	public List<PharmacyInfoMapVO> getPharmacyInfoList(List<FindPharmacyCommandVO> commandList) throws SQLException;
	
	/**
	 * 약국 코드로 약국 상세정보를 불러오는 Service
	 * @param piHpid
	 * @return
	 * @throws SQLException
	 */
	public PharmacyInfoMapVO getPharmacyInfoDetail(String piHpid)throws SQLException;
	
	/**
	 * 해당약국의 상비의약품 재고현황을 가져오는 Service
	 * @param piHpid
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> getPharmacyProductInfo(String piHpid) throws SQLException;
	
	/**
	 * 약국 검색 service
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public List<PharmacyInfoMapVO> getSearchPharmacy(String keyword) throws SQLException;
	
	/**
	 * 과거처방내역에서 해당 약국 위치로 이동 service
	 * @param piHpid
	 * @return
	 * @throws SQLException
	 */
	public PharmacyInfoMapVO getGoPharmacy(String piHpid) throws SQLException;
	
	
}
