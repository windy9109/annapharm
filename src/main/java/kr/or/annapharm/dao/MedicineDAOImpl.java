package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AddMedicineListVO;
import kr.or.annapharm.dto.MedicineVO;
import kr.or.annapharm.dto.SearchMedicineVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;

public class MedicineDAOImpl implements MedicineDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public String selectMedicineClass(int mdNo) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectMedicineClass",mdNo); 
	}

	@Override
	public int selectMedicineType(int mdNo) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectMedicineType",mdNo);
	}

	@Override
	public String selectMedicineName(int mdNo) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectMedicineName",mdNo);
	}

	@Override
	public MedicineVO selectMedicineAll(int mdNo) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectMedicineAll",mdNo);
	}

//	@Override
//	public List<String> selectMedicineNameList(String patientCode) throws SQLException {
//		return session.selectList("Medicine-Mapper.selectMedicineNameList", patientCode);
//	}
	
	

	// 처방전의 첫번째 약이름 구하기
	@Override
	public String selectPrescriptionFirstMedicine(String psCode) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectPrescriptionFirstMedicine", psCode);
	}

	// 하나의 처방전에 약 갯수 구하기
	@Override
	public int selectPrescriptionMedicineCount(String psCode) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectPrescriptionMedicineCount", psCode);
	}

	// 의사 : 약 목록 출력
	@Override
	public List<AddMedicineListVO> selectAddMedicineList(SearchCriteria cri) throws SQLException {
		return session.selectList("Medicine-Mapper.selectAddMedicineList", cri);
	}

	@Override
	public void modifyMedicineList(AddMedicineListVO vo) throws SQLException {
		session.update("Medicine-Mapper.modifyMedicineList",vo);
	}

	@Override
	public String selectMedicineTerm(int mdNo) throws SQLException {
		return session.selectOne("Medicine-Mapper.selectMedicineTerm", mdNo);
	}

	// 헤지 : (새 처방 작성)약 추가하기 
	@Override
	public void insertNewMedicine(UpdatePrescriptionVO vo) throws Exception {
		session.update("Medicine-Mapper.insertNewMedicine", vo);
		
	}

	// 헤지 : 약사)비처방조제 약추가
	@Override
	public void insertNewMedicineForChemist(UpdatePrescriptionVO vo) throws Exception {
		session.update("Medicine-Mapper.insertNewMedicineForChemist", vo);
	}
}	
