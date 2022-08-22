package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.DoctorVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;

public interface MemberDAO {

	// 회원리스트조회
	List<MemberVO> selectMemberList() throws Exception;

	// 회원 추가
	public int insertMember(DoctorVO member) throws Exception;

	public int insertMember(MemberVO member) throws Exception;

	public int insertMember(ChemistVO member) throws Exception;

	public int insertDoctor(DoctorVO doctor) throws Exception;

	public int insertChemist(ChemistVO doctor) throws Exception;

	// 회원정보 조회
	MemberVO selectMemberById(String memId) throws SQLException;

	// 회원아이디 중복검사
	public int selectSameId(String memId) throws SQLException;

	public int isPatient(String memRegnum) throws SQLException;

	public int updateMemId(MemberVO member) throws SQLException;

	public int insertPatient(PatientVO patient) throws SQLException;

	public int updateLoginDate(String memId) throws SQLException;

	public String foundId(MemberVO member) throws SQLException;

	public int updatePwd(MemberVO member) throws SQLException;
	
	// 헤지 : 약사가 환자 등록
	public void insertMemberForPharmacist(MemberVO member) throws SQLException;

	// 아이디로 의사 정보 가져오기
	public DoctorVO selectDoctorInfo(String memId) throws SQLException;

	// 아이디로 약사 정보 가져오기
	public ChemistVO selectChemistInfo(String memId) throws SQLException;
	
	// 아이디로 환자 정보 가져오기
	public MemberVO selectPatientInfo(String memId) throws SQLException;
	
	
}
