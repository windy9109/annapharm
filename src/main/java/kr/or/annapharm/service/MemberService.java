package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.jsp.exception.InvalidPasswordException;
import com.jsp.exception.NotFoundIdException;

import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.DoctorVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;

public interface MemberService {

	public List<MemberVO> getMemberList() throws Exception;

	public int insertMember(MemberVO member) throws Exception;

	public int insertMember(DoctorVO member) throws Exception;

	public int insertMember(ChemistVO member) throws Exception;

	public int insertDoctor(DoctorVO doctor) throws Exception;

	public int insertChemist(ChemistVO chemist) throws Exception;

	public int getCountSameId(String memId) throws Exception;

	// 회원상세
	public MemberVO getMember(String memId) throws Exception;

	public void login(String memId, String memPwd) throws NotFoundIdException, InvalidPasswordException, SQLException;

	public int isPatient(String memRegnum) throws Exception;

	public int updateMemId(MemberVO member) throws Exception;

	public int insertPatient(PatientVO patient) throws Exception;

	public int updateLoginDate(String memId) throws Exception;

	public String foundId(MemberVO member) throws Exception;

	public int updatePwd(MemberVO member) throws Exception;
	
	// 헤지 : 약사가 환자 등록
	public Map<String, Object> insertMemberForPharmacist(MemberVO member) throws Exception;

	public ChemistVO selectChemistInfo(String memId) throws Exception;

	public DoctorVO selectDoctorInfo(String memId)throws Exception;
	
	public MemberVO selectPatientInfo(String memId)throws Exception;
	
}
