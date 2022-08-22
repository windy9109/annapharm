package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PharmacyInfoVO;

public interface PharmacyDAO {
	public List<PharmacyInfoVO> selectPharmacyName() throws SQLException;

	public List<PharmacyInfoVO> SelectSearchPharmacyList(SearchCriteria cri) throws SQLException;

	public int selectPharmacyCriteriaTotalCount(SearchCriteria cri) throws SQLException;

}
