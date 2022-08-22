package kr.or.annapharm.service;

import java.sql.SQLException;

public interface MedicineInfoService {
	
	public String getMedicineInfoType(int miCode) throws SQLException;
		
}
