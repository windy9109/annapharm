package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.ClassficationDAO;
import kr.or.annapharm.dto.ClassficationVO;

public class ClassficationServiceImpl implements ClassficationService {
	
	private ClassficationDAO classficationDAO;
	
	public void setClassficationDAO(ClassficationDAO classficationDAO) {
		this.classficationDAO = classficationDAO;
	}
	
	@Override
	public Map<String, Object> getClassficationList(SearchCriteria cri) throws SQLException {

		Map<String, Object> productClass = new HashMap<String, Object>();
		
		List<ClassficationVO> classficationList = classficationDAO.selectClassficationList(cri);
		productClass.put("classficationList", classficationList);
		
		return productClass;
	}

}
