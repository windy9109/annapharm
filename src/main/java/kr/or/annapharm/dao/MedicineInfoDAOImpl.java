package kr.or.annapharm.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

public class MedicineInfoDAOImpl implements MedicineInfoDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public String selectMedicineInfoType(int miCode) throws SQLException {
		return session.selectOne("MedicineInfo-Mapper.selectMedicineInfoType", miCode);
	}

	@Override
	public String selectMedicineCompany(int mdNo) throws SQLException {
		return session.selectOne("MedicineInfo-Mapper.selectMedicineCompany",mdNo);
	}

	@Override
	public String selectMedicineUnit(int miCode) throws SQLException {
		return session.selectOne("MedicineInfo-Mapper.selectMedicineUnit", miCode);
	}

}
