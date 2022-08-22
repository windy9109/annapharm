package kr.or.annapharm.dao;

import java.sql.SQLException;

import kr.or.annapharm.dto.LoginUserLogVO;


public interface LoginUserLogDAO {

	
	public void insertLoginUserLog(LoginUserLogVO logVO)throws SQLException;
	public void deleteLoginUserLog()throws SQLException;
	
	
}
