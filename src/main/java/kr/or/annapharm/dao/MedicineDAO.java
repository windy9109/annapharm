package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AddMedicineListVO;
import kr.or.annapharm.dto.MedicineVO;
import kr.or.annapharm.dto.SearchMedicineVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;

public interface MedicineDAO {
	public String selectMedicineClass(int mdNo) throws SQLException;
	
	public int selectMedicineType(int mdNo) throws SQLException;
	
	public String selectMedicineName(int mdNo) throws SQLException;
	
	public String selectMedicineTerm(int mdNo) throws SQLException;
	
	// 약 데이터 전체 가져오기
	public MedicineVO selectMedicineAll(int mdNo) throws SQLException;
	
	// 약명 가져오기
//	public List<String> selectMedicineNameList(String patientCode) throws SQLException;
	
	
	// 처방전의 첫번째 약이름 구하기
	public String selectPrescriptionFirstMedicine(String psCode) throws SQLException;
	
	// 하나의 처방전에 약 갯수 구하기
	public int selectPrescriptionMedicineCount(String psCode) throws SQLException;
	
	// 의사 : 약 목록 출력
	public List<AddMedicineListVO> selectAddMedicineList(SearchCriteria cri) throws SQLException;
	
	public void modifyMedicineList(AddMedicineListVO vo) throws SQLException;
	
	// 헤지 : (새 처방 작성)약 추가하기 
	public void insertNewMedicine(UpdatePrescriptionVO vo) throws Exception;
	
	// 헤지 : 약사)비처방조제 약 추가
	public void insertNewMedicineForChemist(UpdatePrescriptionVO vo) throws Exception;
}
