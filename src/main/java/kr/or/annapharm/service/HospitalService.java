package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.dto.HospitalVO;

public interface HospitalService {
	public List<HospitalVO> getHospitalName() throws SQLException;
}
