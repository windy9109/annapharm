package kr.or.annapharm.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hpsf.Array;

import kr.or.annapharm.dao.IPatientDAO;
import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionLogVO;

public class NonLoginUserServiceImpl implements NonLoginUserService {

	private IPatientDAO patientDAO;
	public void setPatientDAO(IPatientDAO patientDAO) {
		this.patientDAO = patientDAO;
	}

	/**
	 *	개요 : 사용자가 입력한 정보를 받아서 입력된 정보의 처방전 정보를 받아온다
	 *	작성자 : 이병진
	 */
	@Override
	public List<PrescriptionLogVO> searchNonLoginUser(PatientVO vo) throws Exception {
		boolean userFlag = true;
		List<PrescriptionLogVO> plVOList = null;

		// 입력값 체크
		PatientVO checkVO = patientDAO.findNonLoginUser(vo);

		System.out.println("checkVO : " + checkVO);

		if(checkVO == null) {
			userFlag = false;
		}

		// 저장된 DB값이 있는 경우
		if(userFlag) {
			plVOList = patientDAO.selectNonloginPrescriptionLogByPharmacistTo30(checkVO.getPatientCode());
		}else {
			System.out.println("통과 확인");
			PrescriptionLogVO plVO = new PrescriptionLogVO();
			plVO.setMemName("none");

			plVOList = new ArrayList<PrescriptionLogVO>();
			plVOList.add(plVO);
		}

		return plVOList;
	}

}
