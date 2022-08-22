package kr.or.annapharm.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.MedicienBillVO;

public class MedicienBillDAOImpl implements MedicienBillDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 *	개요 : 약값을 계산하기 위한 조제료 기본값들에 대한 정보를 가져오는 메서드
	 *	작성자 : 이병진
	 */
	@Override
	public MedicienBillVO getMedicienBill() throws Exception {
		return session.selectOne("PharmacyBill-Mapper.getMedicienBill");
	}

}
