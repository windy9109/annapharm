package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.PastPrescriptionCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.PastPrescriptionDAO;

public class PastPrescriptionServiceImpl implements PastPrescriptionService{

	private PastPrescriptionDAO pastPrescriptionDAO;

	public void setPastPrescriptionDAO(PastPrescriptionDAO pastPrescriptionDAO) {
		this.pastPrescriptionDAO = pastPrescriptionDAO;
	}

	@Override
	public Map<String, Object> getPastPrescriptionList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("cri page : " + cri.getPage());

		List<PastPrescriptionCommand> pastPrescriptionList = pastPrescriptionDAO.selectPastPrescriptionList(cri);

		for (PastPrescriptionCommand p : pastPrescriptionList) {
			String arr[] = p.getName().split(",");
			p.setMdName(arr[0]);
			p.setMdCount(arr.length);

			p.toString();
		}

		int totalCount = pastPrescriptionDAO.selectPastPrescriptionCount(cri);

		System.out.println("pastPrescriptionList :" + pastPrescriptionList.size());
		System.out.println("totalCount :" + totalCount);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("pastPrescriptionList", pastPrescriptionList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getPastPrescriptionDetail(SearchCriteria cri, String psCode) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		cri.setPsCode(psCode);
		System.out.println("cri page : " + cri.getPage());

		List<PastPrescriptionCommand> pastPrescriptionDetail = pastPrescriptionDAO.PastPrescriptionDetail(cri);

		int totalCount = pastPrescriptionDAO.PastPrescriptionDetailCount(cri);

		System.out.println("pastPrescriptionDetail :" + pastPrescriptionDetail.size());
		System.out.println("totalCount :" + totalCount);

		System.out.println(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("pastPrescriptionDetail", pastPrescriptionDetail);
		dataMap.put("pageMaker", pageMaker);

		System.out.println("서비스 통과");
		return dataMap;
	}

}
