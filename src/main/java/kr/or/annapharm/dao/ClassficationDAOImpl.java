package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ClassficationVO;

public class ClassficationDAOImpl implements ClassficationDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ClassficationVO> selectClassficationList(SearchCriteria cri) throws SQLException {
		return session.selectList("Classfication-Mapper.selectClassficationList", cri);
	}

}
