package kr.or.annapharm.dao;

import java.sql.SQLException;

public interface MedicineInfoDAO {
	public String selectMedicineInfoType(int miCode) throws SQLException;
	
	public String selectMedicineCompany(int mdNo) throws SQLException;
	
	public String selectMedicineUnit(int miCode) throws SQLException;
}
