package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.PastPrescriptionCommand;
import kr.or.annapharm.command.SearchCriteria;

public interface PastPrescriptionService {
	public Map<String, Object> getPastPrescriptionList(SearchCriteria cri) throws SQLException;

	public Map<String, Object> getPastPrescriptionDetail(SearchCriteria cri, String psCode) throws SQLException;
}
