package kr.or.annapharm.service;

import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.ExpertDashBoardDAO;
import kr.or.annapharm.dao.PrescriptionDAO;
import kr.or.annapharm.dto.AnalysisPrescriptionVO;
import kr.or.annapharm.dto.DashBoardProductVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;

public class ExpertDashBoardServiceImpl implements ExpertDashBoardService {
	
	private ExpertDashBoardDAO expertDashBoardDAO;
	
	public void setExpertDashBoardDAO(ExpertDashBoardDAO expertDashBoardDAO) {
		this.expertDashBoardDAO = expertDashBoardDAO;
	}

	@Override
	public List<Map<String, String>> getExpertDashBoardList(MemberVO id) throws Exception {
		List<Map<String, String>> ExpertDashBoardList = null;
		
		ExpertDashBoardList = expertDashBoardDAO.selectExpertDashBoardList(id);
		
		return ExpertDashBoardList;
	}

	@Override
	public List<Map<String, String>> getPharmacistINList() throws Exception {
		List<Map<String, String>> PharmacistINList = null;
		PharmacistINList = expertDashBoardDAO.selectPharmacistINList();
		
		return PharmacistINList;
	}

	@Override
	public List<Map<String, String>> getCumulativeStockList(String id) throws Exception {
		List<Map<String, String>> CumulativeStockList = null;
		CumulativeStockList = expertDashBoardDAO.selectCumulativeStockList(id);
		
		return CumulativeStockList;
	}

	@Override
	public List<AnalysisPrescriptionVO> getAnalysisPrescription(SearchCriteria cri) throws Exception {
		return expertDashBoardDAO.selectAnalysisPrescription(cri);
	}

	@Override
	public List<PreferMedicineVO> getMaximumSalesList(SearchCriteria cri) throws Exception {
		return expertDashBoardDAO.selectMaximumSalesList(cri);
	}

	@Override
	public List<PreferMedicineVO> getSalesStatisticsList(SearchCriteria cri) throws Exception {
		return expertDashBoardDAO.selectSalesStatistics(cri);
	}

	@Override
	public List<DashBoardProductVO> getStockShortageList() throws Exception {
		return expertDashBoardDAO.selectStockShortage();
	}

	@Override
	public List<DashBoardProductVO> getStockEXPList() throws Exception {
		return expertDashBoardDAO.selectStockEXP();
	}
	
	
	
	
}