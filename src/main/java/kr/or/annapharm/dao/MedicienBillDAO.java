package kr.or.annapharm.dao;

import kr.or.annapharm.dto.MedicienBillVO;

public interface MedicienBillDAO {

	/**
	 * @return 약가 산정 시 필요한  5가지의 값이 저장되어있는 VO
	 * 개요 : 약값을 계산하기 위한 조제료 기본값들에 대한 정보를 가져오는 메서드
	 * 작성자 : 이병진
	 */
	public MedicienBillVO getMedicienBill() throws Exception;
}
