package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import com.jsp.exception.InvalidPasswordException;
import com.jsp.exception.NotFoundIdException;

import kr.or.annapharm.dao.IPatientDAO;
import kr.or.annapharm.dao.MemberDAO;
import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.DoctorVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	private IPatientDAO patientDAO;
	public void setPatientDAO(IPatientDAO patientDAO) {
		this.patientDAO = patientDAO;
	}
	
	@Override
	public List<MemberVO> getMemberList() throws Exception {
		return null;
	}

	@Override
	public int insertMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertMember(member);
	}

	@Override
	public int insertMember(DoctorVO member) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertMember(member);
	}

	@Override
	public int insertDoctor(DoctorVO doctor) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertDoctor(doctor);
	}

	@Override
	public int insertMember(ChemistVO member) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertMember(member);
	}

	@Override
	public int insertChemist(ChemistVO chemist) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertChemist(chemist);
	}

	@Override
	public int getCountSameId(String memId) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectSameId(memId);
	}

	@Override
	public MemberVO getMember(String memId) throws Exception {

		return memberDAO.selectMemberById(memId);
	}

	@Override
	public void login(String memId, String memPwd) throws NotFoundIdException, InvalidPasswordException, SQLException {

		MemberVO member = memberDAO.selectMemberById(memId);
		if (member == null)
			throw new NotFoundIdException();
		if (!memPwd.equals(member.getMemPwd()))
			throw new InvalidPasswordException();
	}

	@Override
	public int isPatient(String memRegnum) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.isPatient(memRegnum);
	}

	@Override
	public int updateMemId(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.updateMemId(member);
	}

	@Override
	public int insertPatient(PatientVO patient) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertPatient(patient);
	}

	@Override
	public int updateLoginDate(String memId) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.updateLoginDate(memId);
	}

	@Override
	public String foundId(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.foundId(member);
	}

	@Override
	public int updatePwd(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.updatePwd(member);
	}

	// 임시 비밀번호 생성
	public static String randomPw() {
		
		char pwCollection[] = new char[] {
				'1','2','3','4','5','6','7','8','9','0'
				,'A','B','C','D','E','F','G','H','I','J'
				,'K','L','M','N','O','P','Q','R','S','T'
				,'U','V','W','X','Y','Z','a','b','c','d'
				,'e','f','g','h','i','j','k','l','m','n'
				,'o','p','q','r','s','t','u','v','w','x'
				,'y','z','!','@','#','$','%','^','&','*'
				,'(',')'
		};
		
		String ranPw = "";
		
		for(int p = 0; p < 10; p++) {
			int selectRandomPw = (int)(Math.random()*(pwCollection.length));
			//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
			ranPw += pwCollection[selectRandomPw];
		}
		
		return ranPw;
	}
	
	// 헤지 : 약사가 환자 등록
	@Override
	public Map<String, Object> insertMemberForPharmacist(MemberVO member) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		String uuid = "";
		
		// 임시 아이디
		for(int k = 0; k < 5; k++) {
			uuid = (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 7);
//			uuid = uuid.substring(0, 7);
			//System.out.println(k + "번째 아이디 : " + uuid);
		}
		
		for (int p = 0; p < 5; p++) {
			//System.out.println(p +"번째 비밀번호 : "+randomPw());			
		}
		
		String patientCode = "";
		// 임시 아이디
		for (int k = 0; k < 5; k++) {
			patientCode = "A" + (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 8);
//			uuid = uuid.substring(0, 7);
			System.out.println(k + "번째 아이디 : " + patientCode);
		}
		
		// 아이디
		member.setMemId(uuid);
		// 비밀번호
		member.setMemPwd(randomPw());
		
		// 환자코드
		member.setPatientCode(patientCode);
		
		
		memberDAO.insertMemberForPharmacist(member);
		System.out.println("멤버 : " + member);
		patientDAO.insertPatientForPharmacist(member);
		 
		 // select결과를 dataMap에 put
		 String name = member.getMemName();
		 String regNum = member.getMemRegnum().substring(0,6); // 생년월일을 구하시오!!
		 
		dataMap.put("name", name);
		dataMap.put("regNum", regNum);
		 
		 return dataMap;
	}

	@Override
	public ChemistVO selectChemistInfo(String memId) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectChemistInfo(memId);
	}

	@Override
	public DoctorVO selectDoctorInfo(String memId) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectDoctorInfo(memId);
	}

	@Override
	public MemberVO selectPatientInfo(String memId) throws Exception {
		// TODO Auto-generated method stub
		
		return memberDAO.selectPatientInfo(memId);
	}

}
