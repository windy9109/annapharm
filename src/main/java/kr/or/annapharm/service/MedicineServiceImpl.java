package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.MedicineDAO;
import kr.or.annapharm.dto.AddMedicineListVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;

public class MedicineServiceImpl implements MedicineService {

	private MedicineDAO medicineDAO;
	
	public void setMedicineDAO(MedicineDAO medicineDAO) {
		this.medicineDAO = medicineDAO;
	}

	// 처방전의 첫번째 약이름 구하기
	@Override
	public String getPrescriptionFirstMedicine(String psCode) throws Exception {
		String prescriptionFirstMedicine = null;
		
		prescriptionFirstMedicine = medicineDAO.selectPrescriptionFirstMedicine(psCode);
		
		return prescriptionFirstMedicine;
	}

	// 하나의 처방전에 약 갯수 구하기
	@Override
	public int getPrescriptionMedicineCount(String psCode) throws Exception {
		int prescriptionMedicineCount = 0;
		
		prescriptionMedicineCount = medicineDAO.selectPrescriptionMedicineCount(psCode);
		
		return prescriptionMedicineCount;
	}

	@Override
	public int getMedicineType(int mdNo) throws SQLException {
		return medicineDAO.selectMedicineType(mdNo);
	}

	@Override
	public String getMedicineName(int mdNo) throws SQLException {
		return medicineDAO.selectMedicineName(mdNo);
	}

	@Override
	public String getMedicineClass(int mdNo) throws SQLException {
		return medicineDAO.selectMedicineClass(mdNo);
	}

	@Override
	public List<AddMedicineListVO> getAddMedicineList(SearchCriteria cri) throws SQLException {
		List<AddMedicineListVO> addMedicineList = medicineDAO.selectAddMedicineList(cri);
		return addMedicineList;
	}

	// 헤지 : 새처방전작성(약추가)
	@Override
	public void insertNewMedicine(List<UpdatePrescriptionVO> voList) throws Exception {
		
		for(UpdatePrescriptionVO vo : voList) {
			medicineDAO.insertNewMedicine(vo);
		}
	}

	// 헤지 : 약사)비처방조제 약추가
	@Override
	public void insertNewMedicineForChemist(List<UpdatePrescriptionVO> voList) throws Exception {
		for(UpdatePrescriptionVO vo : voList) {
			medicineDAO.insertNewMedicine(vo);
		}
	}
}
