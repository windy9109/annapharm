package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kr.or.annapharm.command.PastPrescriptionCommand;
import kr.or.annapharm.command.SearchCriteria;

public interface PastPrescriptionDAO {
	public List<PastPrescriptionCommand> selectPastPrescriptionList(SearchCriteria cri) throws SQLException;

	public int selectPastPrescriptionCount(SearchCriteria cri) throws SQLException;

	public List<PastPrescriptionCommand> PastPrescriptionDetail(SearchCriteria cri) throws SQLException;

	public int PastPrescriptionDetailCount(SearchCriteria cri) throws SQLException;

}
