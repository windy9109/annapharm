package kr.or.annapharm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;

public class ManagerDashBoardDAOImpl implements ManagerDashBoardDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public String allCount() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allCount");
	}

	@Override
	public String allCountCompare() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allCountCompare");
	}

	@Override
	public String allPharmacy() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allPharmacy");
	}

	@Override
	public String allPountCompare() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allPountCompare");
	}

	@Override
	public String allDoctor() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allDoctor");
	}

	@Override
	public String allDoctorCompare() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allDoctorCompare");
	}

	@Override
	public String allNormal() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allNormal");
	}

	@Override
	public String allNormalCompare() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.allNormalCompare");
	}

	@Override
	public String newCount() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.newCount");
	}

	@Override
	public String newCountCompare() throws Exception {
		return session.selectOne("ManagerDashBoard-Mapper.newCountCompare");
	}


}
