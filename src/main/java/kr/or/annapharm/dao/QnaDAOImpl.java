package kr.or.annapharm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.QnaVO;

public class QnaDAOImpl implements QnaDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<QnaVO> selectQnaList() throws Exception {
		return session.selectList("Qna-Mapper.selectQnaList");
	}


}
