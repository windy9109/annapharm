package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.dto.CompareMedicineVO;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.LongPrescriptionCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.LongPrescriptionVO;
import kr.or.annapharm.dto.MedicineDetailTableVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.SalesByAgeVO;
import kr.or.annapharm.dto.SearchMedicineVO;
import kr.or.annapharm.dto.SelectListVO;

/**
 * BusinessDAO : 약국 경영(제약사별 비교,내방환자분석) DAO
 * @author PC-17
 *
 */
public interface BusinessDAO {
	/**
	 * 약 이름 검색 리스트 DAO
	 * @param cri
	 * @return 
	 * @throws SQLException
	 */
	public List<SearchMedicineVO> selectSearchMedicine(Criteria cri) throws SQLException;
	
	/**
	 * 약 이름 검색 전체 갯수
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public int selectSearchMedicineCount(String keyword) throws SQLException;
	
	/**
	 * 주성분 검색 리스트
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	public List<SearchMedicineVO> selectSearchBasis(Criteria cri) throws SQLException;
	
	/**
	 * 주성분 검색 전체 갯수
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public int selectSearchBasisCount(String keyword) throws SQLException;
	
	/**
	 * 제약사별 약 매입가 비교 리스트
	 * @param miMaincode
	 * @return
	 * @throws SQLException
	 */
	public List<CompareMedicineVO> selectCompareMedicine(String miMaincode) throws SQLException;
	
	/**
	 * 선택한 약을 목록에 추가하는 DAO
	 * @param selectListVO
	 * @throws SQLException
	 */
	public void insertSelectList(SelectListVO selectListVO) throws SQLException;
	
	/**
	 * 목록에 추가한 약을 삭제하는 DAO
	 * @param selectListVO
	 * @throws SQLException
	 */
	public void deleteSelectList(SelectListVO selectListVO) throws SQLException;
	
	/**
	 * 약사의 선택한 약목록 리스트 DAO
	 * @param chemistCode
	 * @return
	 * @throws SQLException
	 */
	public List<SelectListVO> selectList(String chemistCode) throws SQLException;
	
	/**
	 * 연령별/성별 매출 현황 리스트 DAO
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	public List<SalesByAgeVO> salesByAgeList(Criteria cri) throws SQLException;
	
	/**
	 * 선택한 연령의 선호 약/건강기능식품을 페이지 별로 가져오는 DAO
	 * @param preferMedicineVO
	 * @return
	 * @throws SQLException
	 */
	public List<PreferMedicineVO> preferMedicineList(PreferMedicineVO preferMedicineVO) throws SQLException;
	
	/**
	 * 선호 약/건강기능식품 전체 결과 totalCountDAO
	 * @param preferMedicineVO
	 * @return
	 * @throws SQLException
	 */
	public int preferMedicineCount(PreferMedicineVO preferMedicineVO) throws SQLException;
	
	/**
	 * 장기조제환자 리스트를 불러오는 DAO
	 * @param commandVO
	 * @return
	 * @throws SQLException
	 */
	public List<LongPrescriptionVO> longPrescription(LongPrescriptionCommandVO commandVO) throws SQLException;

	/**
	 * 장기조제환자 상세처방 내역 DAO
	 * @param commandVO
	 * @return
	 * @throws SQLException
	 */
	public List<LongPrescriptionDetailVO> longPrescriptionDetail(String psCode) throws SQLException;
	
	/**
	 * 장기조제환자 리스트 전체 Count DAO
	 * @param commandVO
	 * @return
	 * @throws SQLException
	 */
	public int longPrescriptionCount(LongPrescriptionCommandVO commandVO) throws SQLException;
	
	/**
	 * 상세비교 새창띄우기 DAO
	 * @param mdNo
	 * @return
	 * @throws SQLException
	 */
	public MedicineDetailTableVO medicineDetailTable(int mdNo) throws SQLException;
	
	/**
	 * 약국 상세정보 불러오는 DAO
	 * @param commandVO
	 * @return
	 * @throws SQLException
	 */
	public PharmacyInfoMapVO pharmacyInfo(FindPharmacyCommandVO commandVO) throws SQLException;
	
	/**
	 * 약국 코드로 상세정보를 불러오는 DAO
	 * @param piHpid
	 * @return
	 * @throws SQLException
	 */
	public PharmacyInfoMapVO selectPharmacyInfoDetail(String piHpid) throws SQLException;
	
	/**
	 * 해당 약국의 안전상비의약품 재고 현황을 불러오는 DAO
	 * @param piHpid
	 * @return
	 * @throws SQLException
	 */
	public List<ProductVO> selectPharmacyProductInfo(String piHpid) throws SQLException;
	
	/**
	 * 약국 검색 DAO
	 * @param keyword
	 * @return
	 * @throws SQLException
	 */
	public List<PharmacyInfoMapVO> searchPharmacy(String keyword) throws SQLException;
	
	/**
	 * 과거처방내역에서 해당 약국 위치로 이동 DAO
	 * @param piHpid
	 * @return
	 * @throws SQLException
	 */
	public PharmacyInfoMapVO goPharmacy(String piHpid) throws SQLException;
}





































