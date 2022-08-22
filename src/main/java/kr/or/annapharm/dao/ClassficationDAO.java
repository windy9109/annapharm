package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ClassficationVO;

public interface ClassficationDAO {
	public List<ClassficationVO> selectClassficationList(SearchCriteria cri)throws SQLException;
}
