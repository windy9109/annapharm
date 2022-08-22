package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PharmacyInfoVO;

public interface PharmacyService {
	public List<PharmacyInfoVO> getPharmacyName() throws SQLException;
	public Map<String, Object> getPharmacyList(SearchCriteria cri) throws SQLException;
}
