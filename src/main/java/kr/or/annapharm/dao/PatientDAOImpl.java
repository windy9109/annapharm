package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionHistoryVO;
import kr.or.annapharm.dto.PrescriptionLogVO;
import kr.or.annapharm.dto.PsStatusReadyPatientVO;
import kr.or.annapharm.dto.RequestPrescriptionChemistVO;

public class PatientDAOImpl implements IPatientDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 처방 대기 환자 목록 - 예전
//	@Override
//	public List<Map<String, String>> selectPatientList() throws Exception {
//		return session.selectList("Patient-Mapper.selectPatientList");
//	}

	// 처방 대기 환자 목록 - 최근
	@Override
	public List<Map<String, String>> selectWaitingPatientList() throws Exception {
		return session.selectList("Patient-Mapper.selectWaitingPatientList");
	}

	// 처방 대기 환자 목록 : 환자의 최근 처방일
	@Override
	public String selectPatiengLastPrescriptionDate(String patientCode) throws Exception {
		String day = session.selectOne("Patient-Mapper.selectPatiengLastPrescriptionDate", patientCode);
		if(StringUtils.isNotBlank(day)) {
			return day;
		}else {
			return "-";
		}
	}

	// 헤지 : 의사)처방완료환자목록
	@Override
	public List<PsStatusReadyPatientVO> selectPsStatusReady(SearchCriteria cri) throws Exception {

		// 한페이지에 보여줄 리스트갯수
//		cri.setPerPageNum(5);

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);

		return session.selectList("Patient-Mapper.selectPsStatusReady", cri.getDoctorCode(),rowBounds);
	}
	// 헤지 : 의사)처방완료환자목록갯수
	@Override
	public int selectPsStatusReadyCount(String doctorCode) throws Exception {
		return session.selectOne("Patient-Mapper.selectPsStatusReadyCount",doctorCode);
	}


	// 처방 대기 환자 중 선택한 환자 조회(환자코드) - 예전
	@Override
	public List<PatientVO> selectPatientOne(String patientCode) throws Exception {
		System.out.println("DAO Code = " + patientCode);
		return session.selectList("Patient-Mapper.selectPatientOne", patientCode);
	}


	// 처방 대기 환자 중 선택한 환자 조회(환자코드) - 최근
	@Override
	public List<PatientVO> selectWaitingPatientChoice(String patientCode) throws Exception {
		System.out.println("DAO Code = " + patientCode);
		return session.selectList("Patient-Mapper.selectWaitingPatientChoice", patientCode);
	}

	@Override
	public List<PatientVO> selectPatientToNameRegnum(PatientVO vo) throws Exception {

		System.out.println("다오 생년월일 : " + vo.getPatientRegnum());
		System.out.println("다오 이름 : " + vo.getPatientName());

		return session.selectList("Patient-Mapper.selectPatientToNameRegnum", vo);
	}


	// 헤지 : 환자의 과거 처방 내역
	@Override
	public List<PrescriptionHistoryVO> selectPatientPrescription(PsStatusReadyPatientVO vo) throws Exception {
		return session.selectList("Patient-Mapper.selectPatientPrescription",vo);
	}


	/**
	 *	개요 : 약사가 약국에서 개별 환자의 과거처방이력을 확인할 때 사용
	 *	파라미터 : 환자의 환자코드
	 *	제작 : 이병진
	 */
	@Override
	public List<PrescriptionLogVO> selectPrescriptionLogByPharmacist(String code) throws Exception {
		return session.selectList("Patient-Mapper.selectPrescriptionLogByPharmacist",code);
	}

	/**
	 *	개요 :비로그인 처방전 조회 시 사용(최대 조회 30일)
	 *	파라미터 : 환자의 환자코드
	 *	제작 : 이병진
	 */
	@Override
	public List<PrescriptionLogVO> selectNonloginPrescriptionLogByPharmacistTo30(String code) throws Exception {
		return session.selectList("Patient-Mapper.selectNonloginPrescriptionLogByPharmacistTo30",code);
	}


	/**
	 *	개요 : 의사 코드로 의사/병원명을 가져오는 메서드
	 *	파라미터 : 의사의  의사코드
	 *	작성자 : 이병진
	 */
	@Override
	public PrescriptionLogVO selectDoctorNameByCode(String doctorCode) throws Exception {
		return session.selectOne("Patient-Mapper.selectDoctorNameByCode",doctorCode);
	}

	// 헤지 : 약사가 환자 등록
	@Override
	public void insertPatientForPharmacist(MemberVO member) throws SQLException {
		System.out.println("환자DAO통과");
		session.update("Patient-Mapper.insertPatientForPharmacist", member);
	}

	// 헤지 : 처방전 작성 완료된 환자 대기열에서 지우기
	@Override
	public void deletePatientFromWaiting(String patientCode) throws Exception {
		session.update("Patient-Mapper.deletePatientFromWaiting", patientCode);

	}

	// 헤지 : 처방전 수정 요청시 다시 처방환자대기목록에 환자 추가
	@Override
	public void insertWaitingPatient(RequestPrescriptionChemistVO vo) throws Exception {
		session.update("Patient-Mapper.insertWaitingPatient", vo);
	}

	// 개요 :간편 처방전 검색 시 이름/생년월일/전화번호를 받아 해당하는 유저 정보가 있는지 확인하는 메서드
	// 작성자 : 병진
	@Override
	public PatientVO findNonLoginUser(PatientVO vo) throws Exception {
		return session.selectOne("Patient-Mapper.findNonLoginUser", vo);
	}










}
