package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.dto.MenuVO;


public interface MenuDAO {
	List<MenuVO> selectUserMenu() throws SQLException;
	List<MenuVO> selectDoctorMenu() throws SQLException;
	List<MenuVO> selectChemistMenu() throws SQLException;	
	
	List<MenuVO> selectSubMenu(String mCode) throws SQLException;
	MenuVO selectMenuByMcode(String mCode) throws SQLException;
	MenuVO selectMenuByMname(String mName) throws SQLException;
	
	List<MenuVO> selectMainMenu(String Mcode) throws SQLException;
	List<MenuVO> selectSubMenu2( ) throws SQLException;
	
}
