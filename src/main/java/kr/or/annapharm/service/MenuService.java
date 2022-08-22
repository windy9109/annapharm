package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.dto.MenuVO;

public interface MenuService {
	public List<MenuVO> getUserMenuList() throws SQLException;
	public List<MenuVO> getDoctorMenuList() throws SQLException;
	public List<MenuVO> getChemistMenuList() throws SQLException;
	
	public List<MenuVO> getSubMenuList(String mCode) throws SQLException;
	public MenuVO getMenuByMcode(String mCode) throws SQLException;
	public MenuVO getMenuByMname(String mName) throws SQLException;	
	
	List<MenuVO> selectMainMenu( String Mcode ) throws SQLException;
	List<MenuVO> selectSubMenu2( ) throws SQLException;
	
}
