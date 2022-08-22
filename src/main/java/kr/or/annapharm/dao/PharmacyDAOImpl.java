package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PharmacyInfoVO;

public class PharmacyDAOImpl implements PharmacyDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<PharmacyInfoVO> selectPharmacyName() throws SQLException {
		return session.selectList("Pharmacy-Mapper.selectPharmacyName");
	}

	@Override
	public List<PharmacyInfoVO> SelectSearchPharmacyList(SearchCriteria cri) {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		System.out.println("offset : " + offset);
		System.out.println("limit : " + limit);

		RowBounds rowBounds = new RowBounds(offset,limit);

		List<PharmacyInfoVO> list = session.selectList("Pharmacy-Mapper.selectSearchPharmacyList", cri, rowBounds);

		return list;
	}

	@Override
	public int selectPharmacyCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int boardCount = session.selectOne("Pharmacy-Mapper.selectSearchPharmacyListCount",cri);
		return boardCount;
	}

}
