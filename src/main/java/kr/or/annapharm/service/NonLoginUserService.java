package kr.or.annapharm.service;

import java.util.List;

import kr.or.annapharm.dto.PatientVO;
import kr.or.annapharm.dto.PrescriptionLogVO;

public interface NonLoginUserService {

	/**
	 * @param vo : 사용자의 처방전 목록을 가져오는 VO
	 * @return
	 * @throws Exception
	 * 	개요 : 사용자가 입력한 정보를 받아서 입력된 정보의 처방전 정보를 받아온다.
	 * 	작성자 : 이병진
	 */
	public List<PrescriptionLogVO> searchNonLoginUser(PatientVO vo) throws Exception;

}
