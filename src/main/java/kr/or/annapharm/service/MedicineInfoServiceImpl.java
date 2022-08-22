package kr.or.annapharm.service;

import java.sql.SQLException;

import kr.or.annapharm.dao.MedicineInfoDAO;

public class MedicineInfoServiceImpl implements MedicineInfoService {

	private MedicineInfoDAO medicineInfoDAO;
	
	public void setMedicineInfoDAO(MedicineInfoDAO medicineInfoDAO) {
		this.medicineInfoDAO = medicineInfoDAO;
	}
	
	@Override
	public String getMedicineInfoType(int miCode) throws SQLException {
		return medicineInfoDAO.selectMedicineInfoType(miCode);
	}

}
