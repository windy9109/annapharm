package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.PastPrescriptionCommand;
import kr.or.annapharm.command.SearchCriteria;

public class PastPrescriptionDAOImpl implements PastPrescriptionDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PastPrescriptionCommand> selectPastPrescriptionList(SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(12);
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds row = new RowBounds(offset, limit);
		return session.selectList("Prescription-Mapper.selectPastPrescriptionList",cri, row);
	}

	@Override
	public int selectPastPrescriptionCount(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Prescription-Mapper.selectPastPrescriptionCount",cri);
	}

	@Override
	public List<PastPrescriptionCommand> PastPrescriptionDetail(SearchCriteria cri) throws SQLException {
		cri.setPerPageNum(10);
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds row = new RowBounds(offset, limit);
		return session.selectList("Prescription-Mapper.PastPrescriptionDetail",cri, row);
	}

	@Override
	public int PastPrescriptionDetailCount(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Prescription-Mapper.PastPrescriptionDetailCount",cri);
	}

}
