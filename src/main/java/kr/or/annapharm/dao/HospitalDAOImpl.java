package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.HospitalVO;

public class HospitalDAOImpl implements HospitalDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<HospitalVO> selectHospitalName() throws SQLException {
		return session.selectList("Hospital-Mapper.selectHospitalName");
	}

}
