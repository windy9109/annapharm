package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.dao.HospitalDAO;
import kr.or.annapharm.dto.HospitalVO;

public class HospitalServiceImpl implements HospitalService{

	private HospitalDAO hospitalDAO;
	public void setHospitalDAO(HospitalDAO hospitalDAO) {
		this.hospitalDAO = hospitalDAO;
	}

	@Override
	public List<HospitalVO> getHospitalName() throws SQLException {
		List<HospitalVO> hospitalNameList = null;
		hospitalNameList = hospitalDAO.selectHospitalName();
		return hospitalNameList;
	}

}
