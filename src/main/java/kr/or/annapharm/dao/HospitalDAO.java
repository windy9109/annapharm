package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.dto.HospitalVO;

public interface HospitalDAO {
	List<HospitalVO> selectHospitalName() throws SQLException;
}
