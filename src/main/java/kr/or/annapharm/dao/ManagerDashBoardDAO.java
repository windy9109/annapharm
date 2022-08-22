package kr.or.annapharm.dao;

import java.util.List;
import java.util.Map;

import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;

public interface ManagerDashBoardDAO {
	
	
	String allCount() throws Exception;
	String allCountCompare() throws Exception;
	String allPharmacy() throws Exception;
	String allPountCompare() throws Exception;
	String allDoctor() throws Exception;
	String allDoctorCompare() throws Exception;
	String allNormal() throws Exception;
	String allNormalCompare() throws Exception;
	String newCount() throws Exception;
	String newCountCompare() throws Exception;
}
