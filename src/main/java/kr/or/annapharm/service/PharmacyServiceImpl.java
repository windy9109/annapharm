package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.PharmacyDAO;
import kr.or.annapharm.dto.PharmacyInfoVO;

public class PharmacyServiceImpl implements PharmacyService{

	private PharmacyDAO pharmacyDAO;
	public void setPharmacyDAO(PharmacyDAO pharmacyDAO) {
		this.pharmacyDAO = pharmacyDAO;
	}

	@Override
	public List<PharmacyInfoVO> getPharmacyName() throws SQLException {
		List<PharmacyInfoVO> pharmacyNameList = null;
		pharmacyNameList = pharmacyDAO.selectPharmacyName();
		return pharmacyNameList;
	}

	@Override
	public Map<String, Object> getPharmacyList(SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("cri page : " + cri.getPage());

		List<PharmacyInfoVO> pharmacyList = pharmacyDAO.SelectSearchPharmacyList(cri);

		int totalCount = pharmacyDAO.selectPharmacyCriteriaTotalCount(cri);

		System.out.println("pharmacyList :" + pharmacyList.size());
		System.out.println("totalCount :" + totalCount);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("pharmacyList", pharmacyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

}
