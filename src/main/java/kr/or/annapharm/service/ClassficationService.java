package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;

public interface ClassficationService {
	public Map<String, Object> getClassficationList(SearchCriteria cri) throws SQLException;
}
