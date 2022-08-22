package kr.or.annapharm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnalysisPrescriptionVO;
import kr.or.annapharm.dto.DashBoardProductVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;

public class ExpertDashBoardDAOImpl implements ExpertDashBoardDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Map<String, String>> selectExpertDashBoardList(MemberVO id) throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.runtimeSelectPatientList", id);
	}

	@Override
	public List<Map<String, String>> selectPharmacistINList() throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.selectPharmacistINList");
	}

	@Override
	public List<Map<String, String>> selectCumulativeStockList(String id) throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.selectCumulativeStockList", id);
	}

	@Override
	public List<PreferMedicineVO> selectMaximumSalesList(SearchCriteria cri) throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.selectMaximumSalesList", cri);
	}

	@Override
	public List<AnalysisPrescriptionVO> selectAnalysisPrescription(SearchCriteria cri) throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.analysisPrescription", cri);
	}

	@Override
	public List<PreferMedicineVO> selectSalesStatistics(SearchCriteria cri) throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.selectSalesStatistics", cri);
	}

	@Override
	public List<DashBoardProductVO> selectStockShortage() throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.stockShortage");
	}

	@Override
	public List<DashBoardProductVO> selectStockEXP() throws Exception {
		return session.selectList("ExpertDashBoard-Mapper.stockEXP");
	}


}
