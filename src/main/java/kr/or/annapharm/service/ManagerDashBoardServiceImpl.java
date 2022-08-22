package kr.or.annapharm.service;

import java.util.List;
import java.util.Map;

import kr.or.annapharm.dao.ExpertDashBoardDAO;
import kr.or.annapharm.dao.ManagerDashBoardDAO;
import kr.or.annapharm.dao.PrescriptionDAO;
import kr.or.annapharm.dto.PrescriptionDetailVO;
import kr.or.annapharm.dto.PrescriptionVO;

public class ManagerDashBoardServiceImpl implements ManagerDashBoardService {
	
	private ManagerDashBoardDAO managerDashBoardDAO;
	
	public void setManagerDashBoardDAO(ManagerDashBoardDAO managerDashBoard) {
		this.managerDashBoardDAO = managerDashBoard;
	}

	

	@Override
	public String allCount() throws Exception {		
		String allCount = managerDashBoardDAO.allCount();
		return allCount;
	}

	@Override
	public String allCountCompare() throws Exception {
		String allCountCompare = managerDashBoardDAO.allCountCompare();
		return allCountCompare;
	}

	@Override
	public String allPharmacy() throws Exception {
		String allPharmacy = managerDashBoardDAO.allPharmacy();
		return allPharmacy;
	}

	@Override
	public String allPountCompare() throws Exception {
		String allPountCompare = managerDashBoardDAO.allPountCompare();
		return allPountCompare;
	}

	@Override
	public String allDoctor() throws Exception {
		String allDoctor = managerDashBoardDAO.allDoctor();
		return allDoctor;
	}

	@Override
	public String allDoctorCompare() throws Exception {
		String allDoctorCompare = managerDashBoardDAO.allDoctorCompare();
		return allDoctorCompare;
	}

	@Override
	public String allNormal() throws Exception {
		String allNormal = managerDashBoardDAO.allNormal();
		return allNormal;
	}

	@Override
	public String allNormalCompare() throws Exception {
		String allNormalCompare = managerDashBoardDAO.allNormalCompare();
		return allNormalCompare;
	}

	@Override
	public String newCount() throws Exception {
		String newCount = managerDashBoardDAO.newCount();
		return newCount;
	}

	@Override
	public String newCountCompare() throws Exception {
		String newCountCompare = managerDashBoardDAO.newCountCompare();
		return newCountCompare;
	}
	
	
	
	
}