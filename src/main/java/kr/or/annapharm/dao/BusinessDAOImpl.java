package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.SearchCriteria;
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
 * BusinessDAOImpl : 약국 경영(제약사별 비교,내방환자분석) DAOImpl
 * @author PC-17
 *
 */
public class BusinessDAOImpl implements BusinessDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	
	// 약 검색결과 리스트 가져오기
	@Override
	public List<SearchMedicineVO> selectSearchMedicine(Criteria cri) throws SQLException {
		
		SearchCriteria searchCri = (SearchCriteria)cri;
		cri.setPerPageNum(11);
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<SearchMedicineVO> searchMedicineList=session.selectList("Business-Mapper.selectSearchMedicine",searchCri,rowBounds);
		
		return searchMedicineList;
	}

	@Override
	public int selectSearchMedicineCount(String keyword) throws SQLException {
		return session.selectOne("Business-Mapper.selectSearchMedicineCount",keyword);
	}

	@Override
	public List<SearchMedicineVO> selectSearchBasis(Criteria cri) throws SQLException {
		
		SearchCriteria searchCri = (SearchCriteria)cri;
		cri.setPerPageNum(11);
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<SearchMedicineVO> searchBasisList = session.selectList("Business-Mapper.selectSearchBasis",searchCri,rowBounds);
		
		return searchBasisList;
	}

	@Override
	public int selectSearchBasisCount(String keyword) throws SQLException {
		return session.selectOne("Business-Mapper.selectSearchBasisCount",keyword);
	}

	@Override
	public List<CompareMedicineVO> selectCompareMedicine(String miMaincode) throws SQLException {
		return session.selectList("Business-Mapper.selectCompareMedicine",miMaincode);
	}

	@Override
	public void insertSelectList(SelectListVO selectListVO) throws SQLException {
		session.update("Business-Mapper.insertSelectList",selectListVO);
	}

	@Override
	public void deleteSelectList(SelectListVO selectListVO) throws SQLException {
		session.delete("Business-Mapper.deleteSelectList",selectListVO);
	}

	@Override
	public List<SelectListVO> selectList(String chemistCode) throws SQLException {
		return session.selectList("Business-Mapper.selectSelectList",chemistCode);
	}
	
	@Override
	public List<SalesByAgeVO> salesByAgeList(Criteria cri) throws SQLException {
		
		SearchCriteria searchCri = (SearchCriteria)cri;
		cri.setPerPageNum(5);
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);	
		
		return session.selectList("Business-Mapper.salesByAgeList",searchCri,rowBounds);
	}
	
	@Override
	public List<PreferMedicineVO> preferMedicineList(PreferMedicineVO preferMedicineVO) throws SQLException {
		
		preferMedicineVO.setPerPageNum(5);
		int offset=preferMedicineVO.getStartRowNum();
		int limit=preferMedicineVO.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("Business-Mapper.preferMedicineList",preferMedicineVO,rowBounds);
	}

	@Override
	public int preferMedicineCount(PreferMedicineVO preferMedicineVO) throws SQLException {
		return session.selectOne("Business-Mapper.preferMedicineCount",preferMedicineVO);
	}

	@Override
	public List<LongPrescriptionVO> longPrescription(LongPrescriptionCommandVO commandVO) throws SQLException {
		
		commandVO.setPerPageNum(6);
		int offset=commandVO.getStartRowNum();
		int limit=commandVO.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("Business-Mapper.longPrescription",commandVO,rowBounds);
	}

	@Override
	public List<LongPrescriptionDetailVO> longPrescriptionDetail(String psCode) throws SQLException {
		return session.selectList("Business-Mapper.longPrescriptionDetail",psCode);
	}

	@Override
	public int longPrescriptionCount(LongPrescriptionCommandVO commandVO) throws SQLException {
		return session.selectOne("Business-Mapper.longPrescriptionCount",commandVO);
	}

	@Override
	public MedicineDetailTableVO medicineDetailTable(int mdNo) throws SQLException {
		return session.selectOne("Business-Mapper.medicineDetailTable",mdNo);
	}

	@Override
	public PharmacyInfoMapVO pharmacyInfo(FindPharmacyCommandVO commandVO) throws SQLException {
		PharmacyInfoMapVO vo = session.selectOne("Business-Mapper.pharmacyInfo",commandVO);

		return vo;
	}

	@Override
	public PharmacyInfoMapVO selectPharmacyInfoDetail(String piHpid) throws SQLException {
		return session.selectOne("Business-Mapper.pharmacyInfoDetail",piHpid);
	}


	@Override
	public List<ProductVO> selectPharmacyProductInfo(String piHpid) throws SQLException {
		return session.selectList("Business-Mapper.pharmacyProductInfo",piHpid);
	}


	@Override
	public List<PharmacyInfoMapVO> searchPharmacy(String keyword) throws SQLException {
		return session.selectList("Business-Mapper.searchPharmacy", keyword);
	}


	@Override
	public PharmacyInfoMapVO goPharmacy(String piHpid) throws SQLException {
		return session.selectOne("Business-Mapper.goPharmacy", piHpid);
	}


}
