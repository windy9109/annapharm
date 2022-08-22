package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AddMedicineListVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;

public interface MedicineService {

	// 처방전의 첫번째 약이름 구하기
	public String getPrescriptionFirstMedicine(String psCode) throws Exception;
	
	// 하나의 처방전에 약 갯수 구하기
	public int getPrescriptionMedicineCount(String psCode) throws Exception;
	
	// 약의 분류코드 가져오기
	public int getMedicineType(int mdNo) throws SQLException;
	
	public String getMedicineName(int mdNo) throws SQLException;
	
	public String getMedicineClass(int mdNo) throws SQLException;
	
	// 의사 : 약 목록 출력
	public List<AddMedicineListVO> getAddMedicineList(SearchCriteria cri) throws SQLException;
	
	// 헤지 : 새처방전 작성(약추가)
	public void insertNewMedicine(List<UpdatePrescriptionVO> mediVo) throws Exception;
	
	// 헤지 : 약사)비처방조제 약추가
	public void insertNewMedicineForChemist(List<UpdatePrescriptionVO> mediVo) throws Exception;
}
