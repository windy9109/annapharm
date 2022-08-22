package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.DoctorVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession session;
	private MemberDAO memberDAO;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public List<MemberVO> selectMemberList() throws Exception {
		return session.selectList("Member-Mapper.selectMemberList");
	}

	@Override
	public int insertMember(MemberVO member) throws Exception {
		return session.update("Member-Mapper.insertMember", member);
	}

	@Override
	public int insertMember(DoctorVO member) throws Exception {
		return session.update("Member-Mapper.insertMemberD", member);

	}

	@Override
	public int insertDoctor(DoctorVO doctor) throws Exception {
		// TODO Auto-generated method stub
		return session.update("Member-Mapper.insertDoctor", doctor);
	}

	@Override
	public int insertMember(ChemistVO member) throws Exception {
		return session.update("Member-Mapper.insertMemberC", member);

	}

	@Override
	public int insertChemist(ChemistVO chemist) throws Exception {
		// TODO Auto-generated method stub
		return session.update("Member-Mapper.insertChemist", chemist);
	}

	@Override
	public MemberVO selectMemberById( String memId) throws SQLException {
		return session.selectOne("Member-Mapper.selectMemberById", memId);
	}

	@Override
	public int selectSameId(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.selectSameId", memId);
	}

	@Override
	public int isPatient(String memRegnum) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.isPatient",memRegnum);
	}

	@Override
	public int updateMemId(MemberVO member) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Member-Mapper.updateMemId", member);
	}

	@Override
	public int insertPatient(PatientVO patient) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Member-Mapper.insertPatient", patient);
	}

	@Override
	public int updateLoginDate(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Member-Mapper.updateLoginDate", memId);
	}

	@Override
	public String foundId(MemberVO member) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.foundId", member);
	}

	@Override
	public int updatePwd(MemberVO member) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Member-Mapper.updatePwd", member);
	}

	// 헤지 : 약사가 환자 등록
	@Override
	public void insertMemberForPharmacist(MemberVO member) throws SQLException {
		System.out.println("memberDAO통과");
		session.update("Member-Mapper.insertMemberForPharmacist", member);
		
	}

	@Override
	public DoctorVO selectDoctorInfo(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.selectDoctorInfo",memId);
	}

	@Override
	public ChemistVO selectChemistInfo(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.selectChemistInfo",memId);
	}

	@Override
	public MemberVO selectPatientInfo(String memId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.selectPatientInfo",memId);
	}

}
